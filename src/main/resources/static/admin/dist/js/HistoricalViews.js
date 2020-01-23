var index = 0;
$('.nav-link').click(function () {
    var id = $(this).attr('id');
    console.log(id);
    $.ajax({
        method: 'post',
        url: '/admin/getHistoricalViews',
        data: {'key':id},
        success: function (data) {
            var timeArray = new Array(6);
            var dataArray = new Array(6);
            $.each(data,function (key, value) {
                timeArray[index] = key;
                dataArray[index] = value;
                index++;
            });
            index = 0;
            var chart = echarts.init(document.getElementById("viewChart"));
            var option = {
                title: {
                    text: '历史浏览量'
                },
                tooltip: {},
                // legend: {
                //     data:['浏览量']
                // },
                xAxis: {
                    data: timeArray,
                    axisLabel: {
                        interval:0,
                        rotate:40
                    }
                },
                yAxis: {},
                series: [{
                    name: '浏览量',
                    type: 'bar',
                    data: dataArray
                }]
            };
            chart.clear();
            chart.setOption(option,true);
        }
    });
});

