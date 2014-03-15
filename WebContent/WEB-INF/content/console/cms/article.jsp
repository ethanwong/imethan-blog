<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>

<body>
	<div class="row">
		<div class="col-md-3">

			<!-- 			<ul class="nav nav-pills nav-stacked "> -->
			<!-- 				<li><a href="#">Home</a></li> -->
			<!-- 				<li><a href="#">Profile</a></li> -->
			<!-- 				<li><a href="#">Messages</a></li> -->
			<!-- 			</ul> -->

			<div class="list-group">
				<c:forEach var="item" items="${channelList}" varStatus="status">
					<a href="#" class="list-group-item">
						<c:out value="${item.title}"></c:out>
					</a> 
				</c:forEach>
<!-- 				<a href="#" class="list-group-item active">Link</a> -->
			</div>
		</div>
		<div class="col-md-9">
			<label class="col-sm-1 control-label" style="padding: 0px;" >
				<a href="${root}/console/cms/article/input" ><button type="button" class="btn btn-primary">Add</button></a>
			</label>
			<div class="col-sm-11">
				<form class="form-inline" role="form" action="${root}/console/cms/article/0/10" method="post">
					<input type="text" class="form-control" name="search_LIKE_title" placeholder="Enter title" value="${search_LIKE_title}">
					<button type="submit" class="btn btn-default">Search</button>
				</form>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Title</th>
						<th>Channel</th>
						<th>Create Time</th>
						<th>Manage</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${result.content}" varStatus="status">
						<tr>
							<td><c:out value="${item.title}" /></td>
							<td><c:out value="${item.channel.title}" /></td>
							<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>
								<a class="btn btn-default btn-xs"  href="${root}/console/cms/article/forModify/${item.id}/${result.number}/${result.size}">Modify</a>
								<a class="btn btn-default btn-xs" data-toggle="modal" data-backdrop="static" data-target="#article-view" href="${root}/console/cms/article/noDecorate/view/${item.id}">View</a>
								<button type="button" class="btn btn-default btn-xs" onclick="deleteOne('${root}/console/cms/article/delete/${item.id}/${result.number}/${result.size}')">Delete</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination" style="margin: 10px;">
				<li>
					<c:if test="${result.number > 0}">
						<a href="${root}/console/cms/article/${result.number-1}/${result.size}">&laquo;</a>
					</c:if>
					<c:if test="${result.number <= 0}">
						<a href="#">&laquo;</a>
					</c:if>
				</li>
				<c:if test="${result.totalPages>=1}">
					<c:forEach var="item" begin="0" end="${result.totalPages-1}">
						<li <c:if test="${item eq result.number}">class="active"</c:if>>
							<a href="${root}/console/cms/article/${item}/${result.size}">${item+1}</a>
						</li>
					</c:forEach>
				</c:if>
				<li>
					<c:if test="${result.number < result.totalPages-1}">
						<a href="${root}/console/cms/article/${result.number+1}/${result.size}">&raquo;</a>
					</c:if>
					<c:if test="${result.number >= result.totalPages-1}">
						<a href="#">&raquo;</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
	
	
<div class="modal fade" id="article-view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="article-modify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modify</h4>
			</div>
			<form role="form" method="post" action="${root}/console/cms/article/modify" id="inputForm">
				<input type="hidden" value="" name="id" id="id">
				<div class="modal-body">
					  <div class="form-group">
					    <label for="exampleInputEmail1">Title</label>
					    <input type="text" class="form-control required" id="title" name="title" placeholder="Enter title" value="">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">Content</label>
					    <textarea class="form-control required" rows="3" placeholder="Enter content" name="content" id="describe" ></textarea>
					  </div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary"">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
