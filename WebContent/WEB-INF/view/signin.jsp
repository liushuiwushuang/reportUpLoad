<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/include/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html class="login-bg">
<head>
	<title>Report System - Sign in</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">

function reg(){
	window.location.href="${ctx }/parameter.do?method=register";
}

function log(){
	var username=$("#username").val();
	var password =$("#password").val();
	if(username==""){
		alert("请输入用户名");
		$("#username").focus();
		return ;
	}else if(password==""){
		alert("请输入密码");
		$("#password").focus();
		return;
	}else{
		console.log("hello");
		
		$.ajax( {
			async :false,
			type : "POST",
			url : "${ctx }/userRequest.do?method=logCheck",
			dataType: "json",
			data:{"username":username,"password":password},
			success : function(data) {
				if(data.selectstate == "true"){
					//alert("登录成功！");
					//跳转到个人页面
					window.location.href="${ctx }/reportRequest.do";
				}
				else{
					alert("登录失败！用户名或密码错误");
				}
			},
			error :function(){
				alert("网络连接出错！");
			}
		});
	}
}
</script>
</head>
<body >

    <!-- background switcher -->
    <div class="bg-switch visible-desktop">
        <div class="bgs">
            <a href="#"  data-img="landscape.jpg" class="bg active" id="test">
                <img src="img/bgs/landscape.jpg" />
            </a>
            <a href="#" data-img="blueish.jpg" class="bg">
                <img src="img/bgs/blueish.jpg" />
            </a>            
            <a href="#" data-img="7.jpg" class="bg">
                <img src="img/bgs/7.jpg" />
            </a>
            <a href="#" data-img="8.jpg" class="bg">
                <img src="img/bgs/8.jpg" />
            </a>
            <a href="#" data-img="9.jpg" class="bg">
                <img src="img/bgs/9.jpg" />
            </a>
            <a href="#" data-img="10.jpg" class="bg">
                <img src="img/bgs/10.jpg" />
            </a>
            <a href="#" data-img="11.jpg" class="bg">
                <img src="img/bgs/11.jpg" />
            </a>
        </div>
    </div>
	

    <div class="row-fluid login-wrapper" >
        <a href="#">
            <img class="logo" src="img/logo-white.png" />
        </a>

        <div class="span4 box">
            <div class="content-wrap">
                <h6>Log in</h6>
                <input class="span12" type="text" id="username" name="username" placeholder="User name" />
                <input class="span12" type="password" id="password" name="password" placeholder="Your password" />
                <a href="#" class="forgot">Forgot password?</a>
                <div class="remember">
                    <input id="remember-me" type="checkbox" />
                    <label for="remember-me">Remember me</label>
                </div>
                <input class="btn-glow primary login" type="button" id="log" value="Log in" onclick="log()"/>
            </div>
        </div>

        <div class="span4 no-account">
            <p>Don't have an account?</p>
            <a href="#">Sign up</a>
        </div>
    </div>

	<!-- scripts -->
    <script src="script/js/jquery-latest.js"></script>
    <script src="script/js/bootstrap.min.js"></script>
    <script src="script/js/theme.js"></script>

    <!-- pre load bg imgs -->
    <script type="text/javascript">
        $(function () {
            // bg switcher
            
             $("html").css("background-image", "url('img/bgs/landscape.jpg')");
            var $btns = $(".bg-switch .bg");
            $btns.click(function (e) {
                e.preventDefault();
                $btns.removeClass("active");
                $(this).addClass("active");
                var bg = $(this).data("img");

              $("html").css("background-image", "url('img/bgs/" + bg + "')");
                   });

        });
    </script>

</body>
</html>