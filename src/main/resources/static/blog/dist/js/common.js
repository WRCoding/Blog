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
                if (index %3 == 1){
                    a = '<a class="am-btn am-btn-primary am-round" href="/sort/'+element.id+'" target="_blank" style="margin-top: 5px">'+element.sortName+' <span class="am-badge">'+element.sortNumber+'</span></a>&nbsp;'
                    $('#sortPanel').append(a);
                }
                if (index %3 == 2){
                    a = '<a class="am-btn am-btn-secondary am-round" href="/sort/'+element.id+'" target="_blank" style="margin-top: 5px">'+element.sortName+' <span class="am-badge">'+element.sortNumber+'</span></a>&nbsp;'
                    $('#sortPanel').append(a);
                }
                if (index %3 == 0){
                    a = '<a class="am-btn am-btn-success am-round" href="/sort/'+element.id+'" target="_blank" style="margin-top: 5px">'+element.sortName+' <span class="am-badge">'+element.sortNumber+'</span></a>&nbsp;'
                    $('#sortPanel').append(a);
                }
            })
        }
    })
});
function archive(obj) {
    location.href = '/archive?year='+obj;
}