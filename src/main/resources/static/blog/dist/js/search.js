function isNull(obj) {
    if (obj == null || obj == undefined || obj == ""){
        return true;
    }
    return false;
}
function isLegal(obj){
    var reg = /^[\u4e00-\u9fa5\w]+$/;
    return reg.test(obj);
}

$('#searchDiv').keydown(function (even) {
    if (even.keyCode == 13){
        searchBlog();
    }
})


$('#search').click(function () {
    searchBlog();
})

function searchBlog() {
    var searchKey = $('#searchKey').val();
    if (isNull(searchKey)){
        swal("请输入关键字",{
            icon: "info",
        });
        return;
    }
    if (!isLegal(searchKey)) {
        swal("请输入合法关键字",{
            icon: "info",
        });
        $('#searchKey').val("");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/searchTitle",
        data: {"searchKey":searchKey},
        success: function (data) {
            if (data.code == 200){
                $('#searchForm').submit();
            }
            if (data.code == 202) {
                swal(data.message,{
                    icon: "error",
                });
                $('#searchKey').val("");
            }
        }
    })
}