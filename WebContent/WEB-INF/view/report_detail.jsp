<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>报告详情</title>
	 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="decorator" content="default"/>
   <script type="text/javascript">

function download(){
// 	alert("0000000");
	var materialAddress = document.getElementById("materialAddress").value;
	var materialName = document.getElementById("materialName").value;
	alert(materialName);
	window.location.href= "download.jsp?path="+materialAddress+"/"+materialName;
}
	</script>
</head>
	<body>
	<b >报告信息：</b>
	<form id="inputForm" action="${ctx}/reportRequest.do?method=download" method="post">
	<table>
		<tr>
			<td>报告标题：</td>
			<td><input readonly="readonly" type="text" value="${reportVo.reTitle}"  /></td>
		</tr>
		<tr>
			<td>报告摘要：</td>
			<td><input readonly="readonly" type="text" value="${reportVo.reAbstract}" /></td>
		</tr>
		<tr>
			<td>报告人：</td>
			<td><input readonly="readonly" type="text" value="${reportVo.reMan}"/></td>
		</tr>
		<tr>
			<td>报告时间</td>
			<td><input readonly="readonly" type="text" value="${reportVo.reTime}" /></td>
		</tr>
		<tr>
			<td>相关材料：</td>
			<td><input readonly="readonly" type="text" value="${reportVo.relatedMaterials}"/></td>
		</tr>
		<tr><td>&nbsp;&nbsp;</td> <td>&nbsp;&nbsp;</td></tr>
		
		<tr>
			<td>
			<b >
			<c:choose>
				<c:when test="${reportVo.reType == '1'}">论文：</c:when>
				<c:when test="${reportVo.reType == '2'}">新技术：</c:when>
			</c:choose>
			</b>
			</td>
			<td>&nbsp;&nbsp;</td>
		<c:if test="${not empty reportVo.paYear}">
			<tr>
				<td>论文发表年份：</td>
				<td>
					<input readonly="readonly" type="text" value="${reportVo.paYear}" />
				</td>
			</tr>
			<tr>
				<td>作者：</td>
				<td>
					<input readonly="readonly" type="text" value="${reportVo.paAuther}" />
				</td>
			</tr>
			<tr>
				<td>论文来源：</td>
				<td><input readonly="readonly" type="text" value="${reportVo.paOrigin}"/></td>
			</tr>
		</c:if>
		<c:if test="${not empty reportVo.neReference}">
			<tr>
				<td>参考文献：</td>
				<td><input readonly="readonly" type="text" value="${reportVo.neReference}"/></td>
			</tr>
		</c:if>
		
		<tr>
			<td>材料名称：</td>
			<td><input id="materialName" name="materialName" type="text" value="${reportVo.materialName}" /></td>
		</tr>
		<tr>
			<td>材料保存地址：</td>
			<input id="materialAddress" name="materialAddress" type="hidden" value="${reportVo.materialAddress}" />
			<td>
				<input type="submit"   value="下载"   />
			</td>
		</tr>
		<tr>
			<td>上传材料时间：</td>
			<td><input readonly="readonly" type="text" value="${reportVo.materialUptime}"/></td>
		</tr>
		<tr>
			<td><a href="${ctx}/reportRequest.do">返回查询页面</td>
			<td>&nbsp;</td>
		</tr>
	</table>
  	</form>
	</body>
</html>
