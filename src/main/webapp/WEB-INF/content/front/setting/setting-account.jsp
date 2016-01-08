<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Setting:ImEthan独立博客:Full Stack Engineer</title>
<%@ include file="/WEB-INF/content/base/umeditor.jsp"%>
<link rel="stylesheet" type="text/css" href="${root}/theme/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="${root}/theme/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${root}/theme/js/cryptojs/crypto-js-md5.js"></script>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		//密码校验规则
		$("#passwordForm").validate({
			rules : {
				oldPassword:{
					 required: true,
					 remote:{                                          //验证用户名是否存在
			               type:"POST",
			               url:"${root}/setting/validatePassword", 
			               data:{
			                  password:function(){return CryptoJS.MD5($("#oldPassword").val());}
			               } 
				     } 
			     },
				newPassword : {
					required : true,
					minlength : 5
				},
				confirmNewPassword : {
					required : true,
					minlength : 5,
					equalTo : "#newPassword"
				}
			},
			messages : {
				oldPassword:{
					remote : "密码不正确",
					required : "请输入原密码"
				},
				newPassword : {
					required : "请输入新密码",
					minlength : jQuery.format("密码不能小于{0}个字 符")
				},
				confirmNewPassword : {
					required : "请输入确认密码",
					minlength : "确认密码不能小于5个字符",
					equalTo : "两次输入密码不一致"
				}
			}
		});

});

	
//更新密码
function updatePassword(){
	if ($("#passwordForm").valid()) {
		$.ajax({
			url : "${root}/setting/updatePassword/"+CryptoJS.MD5($("#newPassword").val()),
			type : "POST",
			dateType : "json",
			success : function(data) {
				var result = eval("(" + data + ")");
				var messageType = "success";
				if (result.success == false) {
					messageType = "error";
				}else{
					$("#oldPassword").val("")
					$("#newPassword").val("")
					$("#confirmNewPassword").val("")
				};

				showMsg(messageType, result.message);
			}
		});
	};
};
	
</script>
</head>
<body>
<div class="container main">
	<div class="row">
		<div class="col-md-3">
			<%@ include file="/WEB-INF/content/front/setting/setting-menu.jsp"%>
		</div>
		
		<div class="col-md-9" >
			  <div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">${type}</h3>
				  </div>
				  <div class="panel-body">
						<c:if test="${type eq 'account' }">
							<form role="form" id="passwordForm" method="post">
								 <div class="form-group">
								    <label for="oldPassword">Old password</label>
								    <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Enter old password">
								  </div>
								 <div class="form-group">
								    <label for="newPassword">New password</label>
								    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password">
								  </div>
								 <div class="form-group">
								    <label for="confirmNewPassword">Confirm new password</label>
								    <input type="password" class="form-control " id="confirmNewPassword" name="confirmNewPassword" placeholder="Enter new password">
								  </div>
								 <button type="button" class="btn btn-info" onclick="updatePassword()">Update password</button>
							</form>
							
						</c:if>
				  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>