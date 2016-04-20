<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<script language="javascript" src="${ctx }/script/jquery.min.js"></script>
<style>
	table{  border-collapse:collapse;  }
	td{  border:1px solid #f00;  }
</style>
<script type="text/javascript">

function onsubmit1(){
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
			url : "${ctx}/userRequest.do?method=saveUser",
			dataType: "json",
			data:{"username":username,"password":password},
			success : function(data) {
				if(data.addstate == "true"){
					alert("注册成功！");
					window.location="parameter.do";
				}
				else{
					alert("注册失败！");
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
<p >操作：注册</p>
<form:form id="inputForm" modelAttribute="userVo" action="${ctx}/userRequest.do?method=saveUser" method="post" >
<table >
	<tr>
		<td>用户名：</td>
		<td>
			<input type="text" id="username" name="username"  value="${userVo.userName}" placeholder="输入用户名">
		</td>
	</tr>
		<td>密码：</td>
		<td>
			<input type="password" id="password" name="password" value="${userVo.password}" placeholder="输入密码"/>
		</td>
		
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="button" value="提交" onclick="onsubmit1()"/></td>
	</tr>
	
</table>
</form:form>
</body>
</html>
