<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String toDetailBase = basePath+"main/compDetail.do?id=";
%>





<head>
    <script type="text/javascript">
        var step = 1; // 移动的像素
        var y = -1; // 垂直移动的方向，-1表示向上，1表示向下
        var x = 1; // 水平移动的方向，-1表示向左，1表示向右
        function myFloat()
        {
            var img = document.getElementById("myImg");
// 获取图片和当前浏览器窗口上边距，由于img.style.top获取的值带px单位
            var top = img.style.top.replace("px", "");
// top = top - 100;
// img.style.top = top + "px";
// 获取图片和当前浏览器窗口左边距
            var left = img.style.left.replace("px", "");
// left = left - 100;
// img.style.left = left + "px";
// 上下移动
            if(top <= 0)
            {
                y = 1;
            }
            if(top >= document.body.clientHeight)
            {
                y = -1;
            }
            top = (top*1) + (step * y);
            img.style.top = top + "px";
// 左右移动
            if(left <= 0)
            {
                x = 1;
            }
// alert(img.clientWidth);
            if(left >= (document.body.clientWidth - img.clientWidth))
            {
                x = -1;
            }
            left = (left*1) + (step * x);
            img.style.left = left + "px";
            setTimeout("myFloat()", 20);
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>谭老师的照片集锦</title>
    <style>
        #bg{
            width:940px;height:300px;
        background：url(images/精品展示.jpg);
        }
        #sm{/*滚动对象样式*/
            overflow:hidden;/*隐藏Div中多余的内容，增加图片会一起滚动*/
            width:920px;height:280px;
            margin:0 auto;
            padding-top:30px;
        }
    </style>
</head>
<body onload="myFloat();"  style="background-image:url(${pageContext.request.contextPath}/images/main_images/trumppresident111.png)">
<img id="myImg" src="${pageContext.request.contextPath}/images/main_images/advertisement.gif"
     style="position: absolute; left: 500px; top: 400px; border: solid 1px black;" />
<h1 style="color:white ;font-size:20px;background-color:black">感谢&致敬谭老师</h1>
<br>
<center>
    <div id="bg">
        <div id="sm">	<!--滚动div-->
            <table>		<!--外表格1x2,且第2单元格是空的-->
                <tr>
                    <td id="Pic1">
                        <table>	<!--内表格1x9,存放9张图片-->
                            <tr>
                                <td><img src="${pageContext.request.contextPath}/images/main_images/5FBDA16E570ED25E530AD74907FC63CF.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images//DA1A9525D6B5D60591F919FE2A89324F.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images/5FBDA16E570ED25E530AD74907FC63CF.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images//DA1A9525D6B5D60591F919FE2A89324F.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images/5FBDA16E570ED25E530AD74907FC63CF.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images//DA1A9525D6B5D60591F919FE2A89324F.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images/5FBDA16E570ED25E530AD74907FC63CF.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images//DA1A9525D6B5D60591F919FE2A89324F.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                                <td><img src="${pageContext.request.contextPath}/images/main_images/5FBDA16E570ED25E530AD74907FC63CF.jpg" onmouseover="mouseover(this)" onmouseout="mouseout(this)"/></td>
                        </table>
                    </td>
                    <td id="Pic2"></td>
                </tr>
            </table>
        </div>
    </div>
</center>

<!--下面内容的客户端脚本不可放置在页面头部-->

<script>
    Pic2.innerHTML=Pic1.innerHTML;//复制一组图片，但被隐藏
    function scrolltoleft(){//定义向左移动的方法
        sm.scrollLeft++;//改变层的水平坐标，实现向左移动
        if(sm.scrollLeft>=Pic1.scrollWidth)//需要复位
            sm.scrollLeft=0;//层的位置复位，浏览器窗口的宽度有限的
    }

    var MyMar=setInterval(scrolltoleft,40); //定时器，方法名后不可加()

    function mouseover(x){//放大图片
        x.style.width="210";
        x.style.height="256"
        x.style.cursor="pointer"
    }
    function mouseout(x){//图片复原
        x.style.width="105";
        x.style.height="128"
    }

    //两面两行是用方法响应对象的事件
    sm.onmouseover=function(){//匿名方法（函数）
        clearInterval(MyMar);//停止滚动
    }

    sm.onmouseout=function(){
        MyMar = setInterval(scrolltoleft,40);//继续滚动
    }


</script>
</body>
</html>





