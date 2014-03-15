<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>
	<h1>Add a article</h1>
	<form id="inputForm" role="form" action="${root}/console/cms/article/save" method="post">
		<div class="form-group">
			<label for="exampleInputTitle">Channel</label>
			<select class="form-control" name="channel.id">
				<c:forEach var="item" items="${channelList}" varStatus="status">
					<option value="<c:out value="${item.id}"/>"><c:out value="${item.title}"/></option>
				</c:forEach>
			</select>
  		</div>
		<div class="form-group">
			<label for="exampleInputTitle">Title</label>
				<input  type="text" class="form-control required" id="title" placeholder="Enter title" name="title" >
		</div>
		<div class="form-group">
			<label for="exampleInputDescribe">Content</label>
			<textarea style="width: 100% !important;" class="required" rows="5" placeholder="Enter describe" name="content" id="kindeditorContent" ></textarea>
			<label for="title" id="kindeditorContentError" ></label>
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	
	
	<%@ include file="/WEB-INF/content/base/kindeditor.jsp"%>
</body>
</html>