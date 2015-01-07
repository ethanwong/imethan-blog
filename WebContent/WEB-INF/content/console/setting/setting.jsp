<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ImEthan Example</title>
<script type="text/javascript">

	function updateMain(){
		
	};
	
	function updateMeta(){
		
	};
	
</script>
</head>
<body>
<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Settings</h3>
				  </div>
				  <div class="list-group" >
					<a href="${root}/console/setting/main" class="list-group-item <c:if test="${type eq 'main'}">selected</c:if>">Main</a>
					<a href="${root}/console/setting/other" class="list-group-item <c:if test="${type eq 'other'}">selected</c:if>">Other</a>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<c:if test="${type eq 'main' }">
				<div class="panel panel-default">
				  	<div class="panel-heading">Main</div>
				  	<div class="panel-body">
			  			<form role="form" id="profileForm" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Title</label>
							    <input type="text" class="form-control required" id="nickname" placeholder="Enter name" name="nickname" value="${user.nickname}">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Copyright</label>
							    <input type="text" class="form-control required" id="locate" placeholder="Enter locate" name="locate" value="${user.locate}">
							  </div>
	
							  <button type="button" class="btn btn-info" onclick="updateMain()">Update main</button>
						</form>
				  	</div>
				</div>
				
				<div class="panel panel-default">
				  	<div class="panel-heading">Meta</div>
				  	<div class="panel-body">
			  			<form role="form" id="profileForm" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Author</label>
							    <input type="text" class="form-control required" id="nickname" placeholder="Enter name" name="nickname" value="${user.nickname}">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Describe</label>
							    <input type="text" class="form-control required" id="locate" placeholder="Enter locate" name="locate" value="${user.locate}">
							  </div>
	
							  <button type="button" class="btn btn-info" onclick="updateMeta()">Update meta</button>
						</form>
				  	</div>
				</div>
			</c:if>
			<c:if test="${type eq 'other' }">
				<div class="panel panel-default">
				  	<div class="panel-heading">Other</div>
				  	<div class="panel-body">
			  			Other
				  	</div>
				</div>
			</c:if>
		</div>
</div>

	
</body>
</html>
