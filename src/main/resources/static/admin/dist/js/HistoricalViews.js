var timeArray = new Array(6);
var dataArray = new Array(6);
var index = 0;
var i = 1;
$('.nav-link').click(function () {
   console.log($(this).attr('id'));
   i++;
    $.ajax({
        method: 'post',
        url: '/admin/getHistoricalViews',
        success: function (data) {
            $.each(data,function (key, value) {
                timeArray[index] = key;
                dataArray[index] = value;
                index++;
            });
            var chart = echarts.init(document.getElementById("viewChart"));
            var option = {
                title: {
                    text: '历史浏览量'
                },
                tooltip: {},
                legend: {
                    data:['浏览量']
                },
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
            // var option = {
            //     title: {
            //         text: 'ECharts 入门示例'
            //     },
            //     tooltip: {},
            //     legend: {
            //         data:['销量']
            //     },
            //     xAxis: {
            //         data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            //     },
            //     yAxis: {},
            //     series: [{
            //         name: '销量',
            //         type: 'bar',
            //         data: [5, 20, 36, 10, 10, 20]
            //     }]
            // };
            chart.setOption(option)
            // var myChart = new Chart(viewChart, {
            //     type: 'line',
            //     data: {
            //         labels: timeArray,
            //         datasets: [{
            //             label: '历史浏览量',
            //             data: dataArray,
            //             borderWidth: 2
            //         }]
            //     },
            //     options: {
            //         scales: {
            //             yAxes: [{
            //                 ticks: {
            //                     beginAtZero:true
            //                 }
            //             }]
            //         }
            //     }
            // });
        }
    });
});

