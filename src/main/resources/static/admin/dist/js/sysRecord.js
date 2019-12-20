$(function () {
    $('#recordTable').bootstrapTable({
        locale: 'zh-CN',
        url: '/admin/records',                    //请求后台的URL（*）
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
                field: 'visitTime',
                title: '访问时间',
                align: 'center',
                formatter: function (value,row) {
                    var date = new Date(row.visitTime).toLocaleString();
                    return date;
                }
            },
            {
                field: 'ip',
                title: 'IP地址',
                align: 'center',
            },
            {
                field: 'url',
                title: 'URL',
                align: 'center'
            },
            {
                field: 'address',
                title: '地址',
                align: 'center'
            }
        ]

    })
});