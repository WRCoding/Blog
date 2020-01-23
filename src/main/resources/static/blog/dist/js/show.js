var qrcode = new QRCode("qrcode");
$('#WeChatBtn').click(function () {

    var url = location.href;
    qrcode.makeCode(url);
})
$('#toTopBtn').click(function () {
    $(window).scrollTo(0,800);
})
$('#toBottomBtn').click(function () {
    $(window).scrollTo('#comment-contain',800);
})
var waypoint = new Waypoint({
    element: document.getElementById('waypoint'),
    handler: function(direction) {
        if (direction == 'down'){
            $('#tool-bar').show(500);
        }else {
            $('#tool-bar').hide(500);
        }
    }
});
function archive(obj) {
    location.href = '/archive?year='+obj;
}
var liked = false;
$(function () {
    if ($('#username').length > 0){
        var commentName = $('#username').html();
        $('#comment').attr("placeholder",commentName+" 发表评论");
    }
    var articleId = $('#articleId').val();
    var data = {'articleId':articleId};
    $.ajax({
        type: 'POST',
        url: '/getLikeStatus',
        data: data,
        success: function (data) {
           if(data == 1){
               liked = true;
               $('#like').attr('class','fas fa-thumbs-up');
               getLikedCountById();
           }else{
               liked = false;
               $('#like').attr('class','far fa-thumbs-up');
               getLikedCountById();
           }
        }
    })

});

$('#likeBtn').click(function () {
    if ($('#username').length > 0){
        if(!liked){
            //未点赞置为点赞
            likeStatus(1)
        }else{
            //点赞置为未点赞
            likeStatus(0);
        }
    }else {
        swal({
            title: "请先登录在点赞",
            icon: "warning",
            button: "登录"
        }).then(function () {
            location.href = "/login"
        });
    }
});
function likeStatus(obj) {
    var articleId = $('#articleId').val();
    $.ajax({
        method: 'POST',
        url: '/likeStatus',
        data: {'status':obj,"articleId":articleId},
        success: function (data) {
            console.log(data)
            if(obj == 1){
                liked = true;
                $('#like').attr('class','fas fa-thumbs-up');
                getLikedCountById();
            }else{
                liked = false;
                $('#like').attr('class','far fa-thumbs-up');
                getLikedCountById();
            }
        }
    })
}

function getLikedCountById() {
    var articleId = $('#articleId').val();
    var data = {"articleId":articleId}
    $.ajax({
        type: 'POST',
        url: '/getLikedCountById',
        data: data,
        success: function (data) {
            console.log(articleId+" : "+data);
            $('#likeNum').html(data);
        }
    })
}
$('#login').click(function () {
    var email = $('#email').val();
    var password = $('#password').val();
    $("#loginForm").submit();
})