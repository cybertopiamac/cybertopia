
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
    var btn=document.getElementById("isEdit");
    var sex=document.getElementById("sex-select");
    var school=document.getElementById("school-input");
    var major=document.getElementById("major-input");
    var grade=document.getElementById("grade-select");
    var phone=document.getElementById("phone-input");
    var email=document.getElementById("email-input");
    var desc=document.getElementById("desc-input");
    var show_word=document.getElementById("show_word");
    if(btn.value=="编辑"){
        btn.value="取消";
        sex.disabled=false;
        school.disabled=false;
        major.disabled=false;
        grade.disabled=false;
        phone.disabled=false;
        email.disabled=false;
        desc.disabled=false;
        show_word.style.visibility="visible";
        sex.style.border="1px solid #ffffff";
        school.style.borderBottom="1px solid #ffffff";
        major.style.borderBottom="1px solid #ffffff";
        grade.style.border="1px solid #ffffff";
        phone.style.borderBottom="1px solid #ffffff";
        email.style.borderBottom="1px solid #ffffff";
        desc.style.border="1px solid #ffffff";
    }
    else{
        btn.value="编辑";
        sex.disabled=true;
        school.disabled=true;
        major.disabled=true;
        grade.disabled=true;
        phone.disabled=true;
        email.disabled=true;
        desc.disabled=true;
        show_word.style.visibility="hidden";
        sex.style.border="none";
        school.style.borderBottom="none";
        major.style.borderBottom="none";
        grade.style.border="none";
        phone.style.borderBottom="none";
        email.style.borderBottom="none";
        desc.style.border="none";
    }
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
//修改用户信息
function changeInfo() {
    var picture=document.getElementById("file").files[0];
    var sex=document.getElementById("sex-select").selectedIndex;
    var school=document.getElementById("school-input").value;
    var major=document.getElementById("major-input").value;
    var grade=document.getElementById("grade-select").selectedIndex;
    var phone=document.getElementById("phone-input").value;
    var email=document.getElementById("email-input").value;
    var description=document.getElementById("desc-input").value;
    var formData = new FormData();
    formData.append('picture', picture);  //添加图片信息的参数
    formData.append('sex',sex);  //添加其他参数
    formData.append('school',school);
    formData.append('major',major);
    formData.append('grade',grade);
    formData.append('phone',phone);
    formData.append('email',email);
    formData.append('description',description);
    $.ajax({
        url: 'changeUserInfo.do',
        type: 'POST',
        cache: false, //上传文件不需要缓存
        data: formData,
        processData: false, // 告诉jQuery不要去处理发送的数据
        contentType: false, // 告诉jQuery不要去设置Content-Type请求头
        success: function (data) {
            var rs = eval("("+data+")");
            alert(rs);
            changeState();
        },
        error: function (data) {
            alert("error");
        }
    })

}



