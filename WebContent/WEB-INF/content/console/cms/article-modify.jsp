<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>
	<h1>Modify a article</h1>
	<form role="form"  method="post" action="${root}/console/cms/article/modify/${page}/${size}" id="inputForm">
		<input type="hidden" value="${entity.id}" name="id" id="id">
		<input type="hidden" value="${entity.channel.id}" name="channel.id" id="channel.id">
				<div class="form-group">
					<label for="exampleInputTitle">Channel</label>
					<p>${entity.channel.title}</p>
<!-- 					<select class="form-control" name="channel.id"> -->
<%-- 						<c:forEach var="item" items="${channelList}" varStatus="status"> --%>
<%-- 							<option <c:if test="${entity.channel.id == item.id}">selected="selected"</c:if> value="<c:out value="${item.id}"/>"><c:out value="${item.title}"/></option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
		  		</div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Title</label>
			    <input type="text" class="form-control required" id="title" name="title" placeholder="Enter title" value="${entity.title}">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Describe</label>
			 		<textarea style="width: 100% !important;" class="required" rows="5" placeholder="Enter content" name="content" id="kindeditorContent" >${entity.content}</textarea>
					<label id="kindeditorContentError" ></label>
			  </div>
		     <button type="submit" class="btn btn-default">Submit</button>
	</form>
	<%@ include file="/WEB-INF/content/base/kindeditor.jsp"%>
</body>
</html>