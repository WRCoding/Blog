$(function () {
    $('#sortTable').bootstrapTable({
        locale: 'zh-CN',
        url: '/admin/sorts',                    //请求后台的URL（*）
        method: 'get',                      //请求方式（*）
        contentType: "application/x-www-form-urlencoded",
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: false,                    //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页
        pageSize: 3,                       //每页的记录行数（*）
        showColumns: true,                  //是否显示所有的列
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        queryParams: function (params) {    //传递参数（*）
            return {
                limit: params.limit,
                offset: params.offset,
            };
        },
        responseHandler: function (data) {  //在加载服务器发送来的数据之前，处理数据的格式
            return {
                "total": data.total,
                "rows": data.rows
            };
        },
        columns: [
            {
                field: 'ids',
                checkbox: true
            },
            {
                field: 'sortName',
                title: '分类名称',
                align: 'center'
            },
            {
                field: 'sortNumber',
                title: '文章数量',
                align: 'center'
            },
            {
                field: 'operate',
                title: '操作',
                formatter: function (value, row) {
                    var e = '<button type="button" class="btn btn-danger" onclick="del(\'' + row.id + '\')" > <i class="fas fa-trash-alt"></i>&nbsp;删除</button>'
                    return  e ;
                }
            },
        ]

    })
});

function del(id) {
    swal({
        title: "确定删除该分类吗？",
        icon: "warning",
        buttons: ["取消","确认"],
        dangerMode: true,
    }).then(function (isConfirm) {
        if (isConfirm){
            $.ajax({
                type: "POST",
                url: "/admin/delSort",
                data: {"id":id},
                success: function (data) {
                    if (data.code == 200){
                        swal({
                            title: data.message,
                            icon: "success"
                        });
                        $("#sortTable").bootstrapTable('refresh');
                    }else if (data.code == 500){
                        swal({
                            title: data.message,
                            icon: "error"
                        })
                    }
                },
                error: function () {
                    swal({
                        title: "操作错误",
                        icon: "error"
                    })
                }
            })
        }
    })
}
function isNull(obj) {
    if (obj == null || obj == undefined || obj.trim() == ''){
        return true;
    }
    return false;
}
$('#addSort').click(function () {
    $('#sortModal').modal('show');
});

$('#confirmReplay').click(function () {
    var sortName = $('#sortName').val();
    console.log(sortName);
    if (isNull(sortName)){
        swal("内容不能为空", {
            icon: "error",
        });
        return
    }
    var data = {"sortName":sortName}
    $.ajax({
        type: 'POST',
        url: '/admin/addSort',
        data: data,
        success: function (data) {
            if (data.code == 200){
                $('#sortModal').modal('hide');
                $('#sortName').val("");
                swal( {
                    title: data.message,
                    icon: "success",
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '返回',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    location.reload();
                });
            } else{
                $('#sortModal').modal('hide');
                $('#sortName').val("");
                swal(data.message,{
                    icon: "error"
                })
            }
        },
        error: function () {
            swal("操作失败",{
                icon: "error"
            })
        }
    })
})
