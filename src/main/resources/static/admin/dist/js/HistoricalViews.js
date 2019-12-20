var timeArray = new Array(6);
var dataArray = new Array(6);
var index = 0;
$.ajax({
    method: 'post',
    url: '/admin/getHistoricalViews',
    success: function (data) {
        $.each(data,function (key, value) {
            timeArray[index] = key;
            dataArray[index] = value;
            index++;
        });
        var viewChart = document.getElementById("viewChart");
        var myChart = new Chart(viewChart, {
            type: 'line',
            data: {
                labels: timeArray,
                datasets: [{
                    label: '历史浏览量',
                    data: dataArray,
                    borderWidth: 2
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });
    }
});
