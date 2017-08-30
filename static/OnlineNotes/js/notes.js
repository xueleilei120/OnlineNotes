/**
 * Created by Administrator on 2017/8/8 0008.
 */



$(function(){
    $('#jsSearchBtn').on('click', function(){
       search_click()
    });
    //注册刷新验证码点击事件
    $('#email_register_form .captcha-refresh').click({'form_id':'email_register_form'},refresh_captcha);
});

//搜索栏搜索方法
function search_click(){
    var request_url = $('#jsSearchBtn').attr('data-url'),
        keywords = $('#search_keywords').val();

    if(keywords == ""){
        return
    }

    request_url = request_url + keywords;
    window.location.href = request_url
}

//刷新验证码
function refresh_captcha(event){
    $.get("/captcha/refresh/?"+Math.random(), function(result){
        $('#'+event.data.form_id+' .captcha').attr("src",result.image_url);
        $('#'+event.data.form_id+' .form-control-captcha[type="hidden"]').attr("value",result.key);
    });
    return false;
}
