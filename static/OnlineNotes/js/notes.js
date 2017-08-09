/**
 * Created by Administrator on 2017/8/8 0008.
 */



$(function(){
    $('#jsSearchBtn').on('click', function(){
       search_click()
    });
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
