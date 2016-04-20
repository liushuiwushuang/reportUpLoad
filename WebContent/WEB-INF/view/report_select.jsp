<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的页面-报告查询</title>
<script language="javascript" src="${ctx }/script/jquery.min.js"></script>
<style>
	table{  border-collapse:collapse;  }
	td{  border:1px solid #f00;  }
</style>
<script type="text/javascript">
function add(){
	window.location.href="${ctx }/parameter.do?method=turnToAddPage";
}

		function viewCancellation(href){
			top.$.jBox.open("iframe:"+href,'报告详情',$(top.document).width()-400,$(top.document).height()-120,{
			buttons:{"关闭":true},
			loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
				$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
				$("body", h.find("iframe").contents()).css("margin","10px");
			},
			closed: function () { 
				$("#searchForm").submit();
			}
			});
			return false;
		}
		
		
</script>
</head>
<body>
<p >用户名：${userName }</p>

<input id="add" type="button" onclick="add()" value="添加报告"/>

<p >所有报告：</p>
<form:form id="inputForm" modelAttribute="userVo" action="#" method="post" >
<table >
	<tr>
		<td>题目</td>
		<td>摘要</td>
		<td>报告人</td>
		<td>报告时间</td>
		<td>报告类型</td>
		<td>相关材料</td>
		<td>详情</td>
		
	</tr>
	<c:forEach items="${list}" var="report">
	
	<tr >
		<td><c:out value="${report.reTitle}"/></td>
		<td><c:out value="${report.reAbstract}"/></td>
		<td><c:out value="${report.reMan}"/></td>
		<td><c:out value="${report.reTime}"/></td>
		<td>
			<c:choose>
				<c:when test="${report.reType == '1'}">论文</c:when>
				<c:when test="${report.reType == '2'}">新技术</c:when>
			</c:choose>
		</td>
		<td><c:out value="${report.relatedMaterials}"/></td>
		
		<td>
			<a href="${ctx}/reportRequest.do?method=lookDetail&reId=${report.reId}" >详情</a>
		</td>
	</tr>
	
	</c:forEach>
	
</table>
</form:form>
</body>
</html>
