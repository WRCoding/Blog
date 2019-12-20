$(function () {
    $('#commentTable').bootstrapTable({
        locale: 'zh-CN',
        url: '/admin/comments',                    //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        contentType: "application/x-www-form-urlencoded",
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: false,                    //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
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
                field: 'articleTitle',
                title: '标题',
                align: 'center'
            },
            {
                field: 'commentName',
                title: '评论人名称',
                align: 'center',
            },
            {
                field: 'comment',
                title: '评论内容',
                align: 'center'
            },
            {
                field: 'createByStr',
                title: '评论时间',
                align: 'center'
            },
            {
                field: 'replay',
                title: '回复',
                align: 'center'
            },
            {
                field: 'operate',
                title: '操作',
                formatter: function (value, row, index) {
                    var c = '<button type="button" class="btn btn-info" onclick="replay(\''+row.id+'\',this)"> <i class="far fa-edit"></i>&nbsp;回复</button>&nbsp;'
                    var e = '<button type="button" class="btn btn-danger" onclick="del(\'' + row.id + '\')"> <i class="fas fa-trash-alt"></i>&nbsp;删除</button>'
                    return c + e ;
                }
            },
        ]

    })
});
function isNull(obj) {
    if (obj == null || obj == undefined || obj.trim() == ''){
        return true;
    }
    return false;
}

function replay(id,obj) {
    var td = $(obj).parent().parent().find('td');
    var comment = td.eq(3).text();
    $('#comment').html(comment);
    $('#replayModal').modal('show');
    $('#confirmReplay').click(function () {
        var replayComment = $('#replayComment').val();
        if (isNull(replayComment)){
            swal("内容不能为空", {
                icon: "error",
            });
            return;
        }
        var data = {"replayComment":replayComment,"id":id};
        $.ajax({
            type: "POST",
            url: "/admin/saveReplay",
            data: data,
            success: function (data) {
                if (data.code == 200){
                    $('#replayModal').modal('hide');
                    $('#replayComment').val("");
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
                    $('#replayModal').modal('hide');
                    $('#replayComment').val("");
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
}

function del(id) {
    swal({
            title: "确定删除该评论吗？",
            icon: "warning",
            buttons: ["取消","确认"],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm){
                $.ajax({
                    type: "POST",
                    url: "/admin/delComment",
                    data: {"id":id},
                    success: function (data) {
                        if (data.code == 200){
                            swal({
                                title: data.message,
                                icon: "success"
                            });
                            $("#commentTable").bootstrapTable('refresh');
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