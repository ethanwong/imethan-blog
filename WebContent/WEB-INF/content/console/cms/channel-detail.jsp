<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Add a channel</h1>
	<form role="form" action="${root}/console/cms/channel/save"
		method="post">
		<div class="form-group">
			<label for="exampleInputTitle">Title</label> <input type="text"
				class="form-control" id="exampleInputEmail1"
				placeholder="Enter title" name="title">
		</div>
		<div class="form-group">
			<label for="exampleInputDescribe">Describe</label>
			<textarea class="form-control" rows="3" placeholder="Enter describe"
				name="describe"></textarea>
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	<c:if test="${isSuccess eq true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<strong>Well done!</strong> You successfully add a channel..
		</div>
	</c:if>
	<c:if test="${isSuccess eq false}">
		<div class="alert alert-warning alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			<strong>Warning!</strong> Title and description is required..
		</div>
	</c:if>


</body>
</html>