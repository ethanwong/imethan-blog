<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Add a <c:if test="${isRoot == '1' }">root</c:if> resource</h1><c:if test="${isRoot == '0' }">sub</c:if> resource</h1>
	
	<form id="inputForm" role="form" action="${root}/console/security/resource/save" method="post">
		<input type="hidden" name="isRoot" value="${isRoot}">
		<div class="form-group">
			<label for="exampleInputTitle">Name</label>
			<input type="text" class="form-control required" id="name" placeholder="Enter name" name="name" >
		</div>
		<div class="form-group">
			<label for="exampleInputTitle">Module</label>
			<input type="text" class="form-control required" id="module" placeholder="Enter module" name="module" >
		</div>
		<div class="form-group">
			<label for="exampleInputTitle">Url</label>
			<input type="text" class="form-control required" id="module" placeholder="Enter url" name="url" >
		</div>
		<div class="form-group">
			<label for="exampleInputDescribe">Describe</label>
			<textarea class="form-control required" rows="3" placeholder="Enter describe" name="describe" id="describe"></textarea>
		</div>
		<!-- 	  <a type="submit" class="btn btn-default" onclick="submitForm(this)">Submit</a> -->
		<button type="submit" class="btn btn-default">Submit</button>
	</form>

	<c:if test="${isSuccess eq true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>Well done!</strong> You successfully add a channel..
		</div>
	</c:if>
	<c:if test="${isSuccess eq false}">
		<div class="alert alert-warning alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>Warning!</strong> Title and description is required..
		</div>
	</c:if>
</body>
</html>