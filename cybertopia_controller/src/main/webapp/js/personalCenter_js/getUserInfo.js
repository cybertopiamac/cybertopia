
$(document).ready(function() {
    // navigation click actions
    $('.scroll-link').on('click', function(event){
        event.preventDefault();
        var sectionID = $(this).attr("data-id");
        scrollToID('#' + sectionID, 750);
    });
    // scroll to top action
    $('.scroll-top').on('click', function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop:0}, 'slow');
    });
    // mobile nav toggle
    $('#nav-toggle').on('click', function (event) {
        event.preventDefault();
        $('#main-nav').toggleClass("open");
    });
});
// scroll function
function scrollToID(id, speed){
    var offSet = 0;
    var targetOffset = $(id).offset().top - offSet;
    var mainNav = $('#main-nav');
    $('html,body').animate({scrollTop:targetOffset}, speed);
    if (mainNav.hasClass("open")) {
        mainNav.css("height", "1px").removeClass("in").addClass("collapse");
        mainNav.removeClass("open");
    }
}
if (typeof console === "undefined") {
    console = {
        log: function() { }
    };
}
//加载图片进img
function getFileUrl(sourceId) {
    var url;
    if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
        url = document.getElementById(sourceId).value;
    } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
        url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
    } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
        url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
    }
    return url;
}
function preImg(sourceId, targetId) {
    var url = getFileUrl(sourceId);
    var imgPre = document.getElementById(targetId);
    imgPre.src = url;
}
//修改input状态为可编辑
function changeState() {
    var sex=document.getElementById("sex-select");
    var school=document.getElementById("school-input");
    var major=document.getElementById("major-input");
    var grade=document.getElementById("grade-select");
    var phone=document.getElementById("phone-input");
    var email=document.getElementById("email-input");
    var desc=document.getElementById("desc-input");
    var show_word=document.getElementById("show_word");
    sex.disabled=false;
    school.disabled=false;
    major.disabled=false;
    grade.disabled=false;
    phone.disabled=false;
    email.disabled=false;
    desc.disabled=false;
    show_word.style.visibility="visible";
}
//密码清空
function passwordReset() {
    var oldPass=document.getElementById("oldPass");
    var newPass=document.getElementById("newPass");
    var againPass=document.getElementById("againPass");
    oldPass.value="";
    newPass.value="";
    againPass.value="";
}
//修改密码
function getPassMsg(oldPass,newPass) {
    console.log(oldPass,newPass);
    let psd = {
        old : oldPass,
        new : newPass
    }
    $.ajax(
        {
            url: 'changePassword.do',
            type: 'post',
            //contentType: 'application/json; charset=utf-8',
            datatype: "json",
            async: true,
            data: psd,
            success: function (data) {
                var pass_mag=eval(data);
                alert(pass_mag);
            },
            error: function () {
                alert("error");
            }
        }
    )
}


