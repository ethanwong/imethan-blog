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
		<h4 class="modal-title" id="myModalLabel">Modify</h4>
	</div>
	<form role="form"  method="post" action="${root}/console/cms/channel/modify" id="inputForm">
		<input type="hidden" value="${channel.id}" name="id" id="id">
		<div class="modal-body">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Title</label>
			    <input type="text" class="form-control required" id="title" name="title" placeholder="Enter title" value="${channel.title}">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Describe</label>
			    <textarea class="form-control required" rows="3" placeholder="Enter describe" name="describe" id="describe" >${channel.describe}</textarea>
			  </div>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</form>
	<%@ include file="/WEB-INF/content/base/js.jsp"%>
</body>
</html>