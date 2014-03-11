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
	<div class="row">
		<div class="col-md-3">

			<!-- 			<ul class="nav nav-pills nav-stacked "> -->
			<!-- 				<li><a href="#">Home</a></li> -->
			<!-- 				<li><a href="#">Profile</a></li> -->
			<!-- 				<li><a href="#">Messages</a></li> -->
			<!-- 			</ul> -->

			<div class="list-group">
				<a href="#" class="list-group-item active">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a> <a href="#"
					class="list-group-item">Link</a>
			</div>


		</div>
		<div class="col-md-9">
			<!--   <div class="table-responsive"> -->

			<label class="col-sm-1 control-label"> <a
				href="${root}/console/cms/channel/input"><button type="button"
						class="btn btn-primary">Add</button></a>
			</label>
			<div class="col-sm-11">
				<form class="form-inline" role="form"
					action="${root}/console/cms/channel/list" method="post">
					<input type="text" class="form-control" name="search_like_title"
						placeholder="Enter title">
					<button type="submit" class="btn btn-default">Search</button>
				</form>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Title</th>
						<th>Create Time</th>
						<th>Manage</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${result.content}" varStatus="status">
						<tr>
							<td><c:out value="${item.title}" /></td>
							<td><fmt:formatDate value="${item.createTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>modify
								<button type="button" class="btn btn-default btn-xs"
									onclick="showDetailModal('channel-detail-modal','<strong>Title</strong><br>${item.title}<br><strong>Describe</strong><br>${item.describe}<br><strong>CreateTime</strong><br>${item.createTime}')">View</button>
								<%-- 								<button type="button" class="btn btn-default btn-xs" onclick="showDetail('jsondetail','${item.id}','channel-detail-modal', --%>
								<%-- 								'<strong>Title</strong><br>${item.title}<br><strong>Describe</strong><br>${item.describe}<br><strong>CreateTime</strong><br>${item.createTime}')" >View</button> --%>

								<button type="button" class="btn btn-default btn-xs"
									onclick="deleteOne('delete','${item.id}',this)">Delete</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination" style="margin-bottom: 100px;">
				<li><a href="#">&laquo;</a></li>
				<c:forEach var="item" begin="0" end="${result.totalPages-1}">
					<li <c:if test="${item eq result.number}">class="active"</c:if>>
						<a
						href="${root}/console/cms/channel/list?page=${item}&size=${result.size}">${item+1}</a>
					</li>
				</c:forEach>
				<li><a href="#">&raquo;</a></li>
			</ul>

			<!-- Modal -->
			<div class="modal fade" id="channel-detail-modal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
</body>
</html>
