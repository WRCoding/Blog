function image(id) {
    var url ='/show/'+id;
    window.open(url, '_blank');
}
$(function () {
    $.ajax({
        type: 'POST',
        url: "/archive",
        success: function (data) {
            $.each(data, function (index,element) {
                var li = '<li><a class="am-btn" style="text-align: left" href="/archive?year='+index+'" target="_blank">'+index+'<span class="am-badge am-badge-success" style="float: right">'+element+'</span></a></li>'
                $('#archiveUl').append(li);
            })
        }
    })
    $.ajax({
        type: 'POST',
        url: '/allSorts',
        success: function (data) {
            $.each(data, function (index,element) {
                var a = '';
                if (index >= 9){
                    return false;
                }
                a = '<a class="am-btn am-btn-default" href="/all_sort?name='+element.sortName+'" target="_blank" style="margin-top: 5px;margin-right: 5px;font-size: 18px">'+element.sortName+' <span style="color: rgb(255, 255, 255)" class="am-badge am-badge-primary">'+element.sortNumber+'</span></a>&nbsp;'
                $('#sortPanel').append(a);
            })
        }
    })
});
function archive(obj) {
    location.href = '/archive?year='+obj;
}
function clickSortName(sortName) {
    location.href = '/all_sort?name='+sortName;
}