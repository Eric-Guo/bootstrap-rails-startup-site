// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= stub html5shiv
//= stub respond.min

var start;
var end;
var stay_seconds;
start = new Date();//start是用户进入页面时间

$(document).ready(function() {//用户页面加载完毕，这个是jquery初始化的语句（不知道初始化这个词用的是否正确）
    $(window).unload(function() {//页面卸载，就是用户关闭页面、点击链接跳转到其他页面或者刷新页面都会执行
        end = new Date();//用户退出时间
        stay_seconds = (end.getTime() - start.getTime())/1000;//停留时间=退出时间-开始时间（得到的是一个整数，应该是毫秒为单位，1秒=1000）
        $.post("/stay_time", { stay_seconds: stay_seconds, stay_url: window.location.pathname, stay_title: $("title").html() });
        //把值传到action_to_sql.aspx页面写入数据库（一开始我不想这样做，希望在本页面直接处理写入数据库，后来发现我的是生成静态页面的，
        //无法在原来页面完成数据处理，所以学习jquery，并采用这种方法解决，才发现jquery真的是个好东西。）
    });
});