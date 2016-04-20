<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<script language="javascript" src="${ctx }/script/jquery.min.js"></script>
<style>
table{  border-collapse:collapse;  }
td{  border:1px solid #f00;  }
</style>
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
		$.ajax( {
			type : "POST",
			url : "${ctx }/userRequest.do?method=logCheck",
			dataType: "json",
			data:{"username":username,"password":password},
			success : function(data) {
				if(data.selectstate == "true"){
					alert("登录成功！");
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
<body>
<p>操作：登录</p>
<form id="inputForm"  modelAttribute="userVo" action="${ctx}/userRequest.do" method="post" >
<table >
	<tr>
		<td>用户名：</td>
		<td>
			<input type="text" id="username" name="username"  value="${userVo.userName}" placeholder="请输入用户名">
		</td>
	</tr>
	<tr>
		<td>密码：</td>
		<td>
			<input type="password" id="password" name="password" value="${userVo.password}" placeholder="请输入密码"/>
		</td>
	</tr>
	<tr>
		<td><input type="button" id="log" value="登 录" onclick="log()"/></td>
		<td><input type="button" id="reg" value="注册" onclick="reg()"/> </td>
	</tr>
</table>
</form>
</body>
</html>