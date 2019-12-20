//下拉多选框
$('#sortSelect').select2({
    language: "zh-CN",
    placeholder: '选择分类',
});

//初始化markdown编辑框
var blogEditor;
$(function() {
    blogEditor = editormd("blog-editormd", {
        width   : "100%",
        height  : 640,
        syncScrolling : "single",
        path    : "/admin/dist/plugins/editormd/lib/",
        imageUpload : true,
        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL : "/oss/upload",
        // saveHTMLToTextarea : true
    });
});

function isNull(obj) {
    if (obj == null || obj == undefined || obj.trim() == '') {
        return true;
    }
    return false;
}
function isLegal(obj){
    var reg = /^[\u4e00-\u9fa5\w]+$/;
    return reg.test(obj);
}
//验证信息
$('#confirmButton').click(function () {
    var articleTitle = $("#articleTitle").val();
    var blogContent = blogEditor.getMarkdown();
    if (isNull(articleTitle)){
        swal("标题不能为空", {
            icon: "error",
        });
        return;
    }
    if (!isLegal(articleTitle)){
        swal("标题格式不正确", {
            icon: "error",
        });
        return;
    }
    if (isNull(blogContent)){
        swal("内容不能为空", {
            icon: "error",
        });
        return;
    }
    $('#showTitle').html(articleTitle);
    $('#articleModal').modal('show');
})
//上传题图
$('#uploadImage').click(function () {
    var formData = new FormData();
    formData.append("imageFile",$("#imageFile")[0].files[0]);
    $.ajax({
        url: "/oss/image",
        type: "POST",
        data: formData,
        cache: false,
        processData: false,
        contentType: false,
        success: function (data) {
           if (data.success == 1){
               $('#imageUpload').css('display','none');
               $('#imageDiv').css('display','block');
               $('#imageUrl').html(data.url);
           } else if (data.success == 0){
               swal(data.Message, {
                   icon: "error",
               });
           }
        },
    })
})
//更好题图
$('#changeImage').click(function () {
    $('#imageUpload').css('display','block');
    $('#imageDiv').css('display','none');
    $('#imageUrl').html();
})
//保存文章
$('#saveButton').click(function () {
    var articleTitle = $('#articleTitle').val();
    var blogContent = blogEditor.getMarkdown();
    var imageUrl = $('#imageUrl').html();
    var blogId = $('#blogId').val();
    if ($('#sortSelect').length > 0){
        var sortIds = $('#sortSelect').val().toString();
    }
    var url = "/admin/save";
    var message = "保存成功"
    var data = {
        "articleTitle" : articleTitle,"sortIds":sortIds,"blogContent" : blogContent,"imageUrl" : imageUrl
    }
    if (blogId > 0){
        url = "/admin/update";
        message = "修改成功";
        data = {
            "articleTitle" : articleTitle,"blogContent" : blogContent,"imageUrl" : imageUrl,"blogId":blogId
        }
    }
    console.log(data);
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function (data) {
            if (data.code == 200){
                $('#articleModal').modal('hide');
                swal( {
                    title: message,
                    icon: "success",
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '返回',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/manager";
                });
            }else{
                $('#articleModal').modal('hide');
                swal("发布失败", {
                    icon: "error",
                });
            }
        },
        error: function () {
            swal("操作失败", {
                icon: "error",
            });
        }
    })
})