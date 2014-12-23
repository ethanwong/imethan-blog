<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
	});
	

</script>
</head>
<body>
	
	<%@ include file="/WEB-INF/content/base/kindeditor.jsp"%>
	<div class="row">
		<div class="col-md-12" >
			<div class='articleList'>
				<div class='article'>
					<h3 class='title'><a href="${root}/blog/article/${article.id}">${article.title}</a></h3>
					<hr>
					<a href="${root}/blog/${article.channelId}"><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>${article.channelName}</strong></small></a>
					&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;<fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/></small>
					<div class='content'>${article.content}</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>