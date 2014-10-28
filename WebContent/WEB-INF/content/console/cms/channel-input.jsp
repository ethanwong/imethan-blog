<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Add a channel</h1>
	
	<mvcform:form id="inputForm" action="${root}/console/cms/channel/save" commandName="channel" method="post">
<%-- 	<form id="inputForm" role="form" action="${root}/console/cms/channel/save" method="post"  > --%>
		<div class="form-group">
			<label for="exampleInputTitle">Title</label>
<!-- 			required -->
				<input type="text" class="form-control " id="title" placeholder="Enter title" name="title" >
				<mvcform:errors path="title"></mvcform:errors>
		</div>
		<div class="form-group">
			<label for="exampleInputIntro">Intro</label>
			<textarea class="form-control" rows="3" placeholder="Enter intro" name="intro" id="intro"></textarea>
			<mvcform:errors path='intro' />
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
<!-- 	</form> -->
	</mvcform:form>

	<c:if test="${isSuccess eq true}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>Well done!</strong> You successfully add a channel..
		</div>
	</c:if>
	<c:if test="${isSuccess eq false}">
		<div class="alert alert-warning alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<strong>Warning!</strong> Title and intro is required..
		</div>
	</c:if>
</body>
</html>