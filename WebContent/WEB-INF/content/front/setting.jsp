<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan:About</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
	})

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Personal settings</h3>
				  </div>
				  <div class="list-group" >
					<a href="${root}/setting/profile" class="list-group-item <c:if test="${type eq 'profile'}">selected</c:if>">Profile</a>
					<a href="${root}/setting/account" class="list-group-item <c:if test="${type eq 'account'}">selected</c:if>">Account</a>
					<a href="#" class="list-group-item">Other</a> 
				</div>
			</div>
		</div>
		
		<div class="col-md-9" >
			  <div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Profile</h3>
				  </div>
				  <div class="panel-body">
				  		<!-- profile -->
				  		<c:if test="${type eq 'profile'}">
						  	<form role="form" id="inputForm" method="post">
								  <div class="form-group">
								  	<label for="exampleInputEmail1">Avatar</label>
								  	<br>
								  	<img class="img-thumbnail" src="${root}/theme/images/pic.jpg" alt="www.imethan.cn" width="100px" height="100px" >
								  </div>
								  <div class="form-group">
								    <label for="exampleInputEmail1">Name</label>
								    <input type="text" class="form-control" id="name" placeholder="Enter name">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Locate</label>
								    <input type="text" class="form-control" id="locate" placeholder="Enter locate">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Phone</label>
								    <input type="text" class="form-control" id="phone" placeholder="Enter phone">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Email</label>
								    <input type="email" class="form-control" id="email" placeholder="Enter email">
								  </div>
		
								  <button type="submit" class="btn btn-primary">Update profile</button>
							</form>
						</c:if>
						
						<c:if test="${type eq 'account' }">
							<form role="form" id="inputForm" method="post">
								 <div class="form-group">
								    <label for="oldPassword">Old password</label>
								    <input type="password" class="form-control required" id="oldPassword" placeholder="Enter old password">
								  </div>
								 <div class="form-group">
								    <label for="newPassword">New password</label>
								    <input type="password" class="form-control required" id="newPassword" placeholder="Enter new password">
								  </div>
								 <div class="form-group">
								    <label for="confirmNewPassword">Confirm new password</label>
								    <input type="password" class="form-control required" id="confirmNewPassword" placeholder="Enter new password">
								  </div>
								 <button type="submit" class="btn btn-primary">Update password</button>
							</form>
							
						</c:if>
				  </div>
			</div>
		</div>
	</div>
</body>
</html>