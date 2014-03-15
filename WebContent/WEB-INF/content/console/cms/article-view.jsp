<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title" id="myModalLabel">View</h4>
	</div>
	<div class="modal-body">
		  <div class="form-group">
		    <label>Channel</label>
		    <p>${entity.channel.title}</p>
		  </div>
		  <div class="form-group">
		    <label>Title</label>
		    <p>${entity.title}</p>
		  </div>
		  <div class="form-group">
		    <label >Content</label>
		    <p>${entity.content}</p>
		  </div>
		  <div class="form-group">
		    <label >Create Time</label>
		    <p><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		  </div>
		  <div class="form-group">
		    <label >Update Time</label>
		    <p><fmt:formatDate value="${entity.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		  </div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</body>
</html>