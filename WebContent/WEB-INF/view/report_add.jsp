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
  
</head>
	<body>
	<%! 
  		Date now=new Date();
   		String form1=String.format("%tF",now);
   	%>
	<b class="alert alert-success" style="position:relative;margin:4px;width:90%;float:left;">填写报告信息：</b>
	<form id="inputForm"  action="${ctx}/reportRequest.do?method=add" method="post">
	<table>
		<tr >
			<td>报告标题：</td>
			<td><input name="reTitle"  type="text" value="${reportVo.reTitle}" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>报告摘要：</td>
			<td><input name="reAbstract"  type="text" value="${reportVo.reAbstract}"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>报告人：</td>
			<td><input name="reMan"  type="text" value="<%=session.getAttribute("userName")%>" /></td>
<!-- 			<td><input name="reMan"  type="text" value="${reportVo.reMan}" /></td> -->
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>报告时间：</td>
			<td><input name="reTime"  type="text" value="${reportVo.reTime}" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>相关材料：</td>
			<td><input name="relatedMaterials"  type="text" value="${reportVo.relatedMaterials}" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>论文类型：</td>
			<td>
				<select id="reType" name="reType"  onchange="choose()" class="conditions" style="width:150px;">
					<option  checked value="1">论文</option>
					<option  value="2">新技术</option>
				</select>
			
			</td>
			
			<td>&nbsp;</td>
		</tr>
		<tr id="x" >		
			<td>论文发表年份：</td>
			<td><input id="paYear"name="paYear"  type="text" value="${reportVo.paYear}" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr id="y" >		
			<td>作者：</td>
			<td><input id="paAuther"name="paAuther"  type="text" value="${reportVo.paAuther}" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr id="z" >		
			<td>论文来源：</td>
			<td><input id="paOrigin"name="paOrigin"  type="text" value="${reportVo.paOrigin}" /></td>
			<td>&nbsp;</td>
		</tr>		
		<tr id="l" >		
			<td>参考文献：</td>
			<td><input id="neReference"name="neReference"  type="text" value="${reportVo.neReference}" /></td>
			<td>&nbsp;</td>
		</tr>	
		<tr>
			<td>材料名称：</td>
			<td><input name="materialName"  type="text" value="${fileName}" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>材料保存地址：</td>
			<td><input name="materialAddress"  type="text" value="*******" /></td>
<!-- 			<td><input name="materialAddress"  type="text" value="${reportVo.materialAddress}" /></td> -->
			<td><a href="${ctx}/parameter.do?method=upPage">上传文件</a></td>
		</tr>
		<tr>
			<td>上传材料时间：</td>
			<td><input name="materialUptime"  type="text" value="<%=form1 %>" /></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><input type="submit" value="提交" /></td>
			<td><a href="${ctx}/reportRequest.do">返回查询页面</a></td>
			<td>&nbsp;</td>
		</tr>
		</table>
  	</form>
	</body>
</html>