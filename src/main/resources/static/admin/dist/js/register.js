//检查邮箱
function checkEmail(){
    var flag = false;
    var email = $("#email").val();
    //定义正则
    var reg_email = /^\w+@\w+\.\w+$/
    //判断
    flag = reg_email.test(email);
    if (flag){
        $.ajax({
            method: 'POST',
            url: '/isEmail',
            data: {'email':email},
            success: function (data) {
                if (data > 0){
                    flag = false;
                    swal("邮箱已注册",{
                        icon: 'warning'
                    })
                    $("#username").attr('class','form-control mb-3');
                    $("#password").attr('class','form-control mb-3');
                    $("#email").attr('class','form-control mb-3');
                    $('#email').val('');
                    $("#password").val('');
                } else{
                    flag = true;
                    $("#email").attr('class','form-control mb-3 is-valid');
                }
            }
        });
    } else {
        $("#email").attr('class','form-control mb-3 is-invalid');
    }
    return flag

}
//检查昵称
function checkName() {
    //1.获取用户名的值
    var username = $("#username").val();
    //3.判断
    var flag = true;
    if (username.length == 0){
        //姓名为空
        flag = false;
        $("#username").attr('class','form-control mb-3 is-invalid');
    } else{
        var data = {'username':username};
        $.ajax({
            method: 'post',
            url:'/admin/isRegistered',
            data: data,
            success: function (index) {
                if (index > 0){
                    flag = false;
                    swal("用户名已存在",{
                        icon: 'warning'
                    })
                    $("#username").attr('class','form-control mb-3');
                    $("#password").attr('class','form-control mb-3');
                    $("#email").attr('class','form-control mb-3');
                    $('#username').val('');
                } else{
                    flag = true;
                    $("#username").attr('class','form-control mb-3 is-valid');
                }
            }
        });

    }
    return flag;
}
//检查密码
function checkPassWord() {
    //1.获取密码
    var password = $("#password").val();
    //2.定义正则
    var reg_password = /^\w{6,17}$/;
    //3.判断
    var flag = reg_password.test(password);
    if (flag){
        //合法
        $("#password").attr('class','form-control mb-3 is-valid');
    } else{
        //非法
        $("#password").attr('class','form-control mb-3 is-invalid');
    }
    return flag;
}
//当失去焦点时，调用对应的检查函数
$('#email').blur(function () {
    checkEmail();
});
$('#username').blur(function () {
    checkName();
});
$('#password').blur(function () {
    checkPassWord();
});

$('#registerBtn').click(function () {
    var email = $('#email').val();
    var username = $('#username').val();
    var password = $('#password').val();
    var data = {'email':email,'username':username,'password':password};
    console.log(data);
    if(checkEmail()&&checkName()&&checkPassWord()){
        $.ajax({
            method: 'POST',
            url: '/reg',
            data: data,
            success: function (data) {
                if (data.code == 200){
                    swal({
                        title: data.message,
                        text: '请通过注册的邮箱激活账号',
                        type: 'success',
                        button: '激活'
                    }).then(function () {
                        $.ajax({
                            method: 'POST',
                            url: '/activate',
                            data: {'username':username,'email':email}
                        })
                    })
                }
            }
        })
    }else if(!checkName() || !checkPassWord() || !checkEmail()){
        swal("请正确填写信息！", {
            icon: "warning",
        });
        if(!checkName()){
            $('#username').val('');
            $("#username").attr('class','form-control mb-3');
        }
        if(!checkEmail()){
            $('#email').val('');
            $("#email").attr('class','form-control mb-3');
        }
        if(!checkPassWord()){
            $('#password').val('');
            $("#password").attr('class','form-control mb-3');
        }
        return;
    }
});
