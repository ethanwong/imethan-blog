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
		//加载用户信息
		loadUserInfo("imethan");
	});
	
	//加载用户信息
	function loadUserInfo(username){
		$.ajax({
			url:"${root}/userinfo/getUserInfoByUsername/"+username,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$(".userinfo").find(".nickname").html(result.nickname);
				$(".userinfo").find(".locate").html(result.locate);
				var email = "<a href='mailto:"+result.email+"'>"+result.email+"</a>"
				$(".userinfo").find(".email").html(email);
				$(".userinfo").find(".phone").html(result.phone);
				
				//判读图片是否可以加载
				if(result.avatar!=null && result.avatar!=''){
					var avatar = "${root}/upload/avatar/"+result.avatar;
					$.ajax({
						url:avatar,
						error:function(xhr, error, ex){
							if (xhr.status == '404') {
								$(".userinfo").find(".img-thumbnail").attr("src","${root}/upload/avatar/default-avatar-ethan.jpg");
							}
						},
						success:function(){
							$(".userinfo").find(".img-thumbnail").attr("src",avatar);
						}
					});
				};
			}
		});
	};

</script>
</head>
<body>
	<font style="font-size:30px;">About me</font>
	<hr>
	<div class="row">
		<div class="col-md-3">
			<div class="userinfo">
				<p style="line-height: 36px;">
						<img class="img-thumbnail" src="${root}/upload/avatar/default-avatar-ethan.jpg" alt="${userInfo.nickname}" style="width: 180px;height: 180px;" >
				</p>
				<font size="4" class='nickname'>${userInfo.nickname}</font>
				<hr>
				<address style="line-height: 36px;">
					<span class="glyphicon glyphicon-map-marker"></span>&nbsp;<span class="locate">${userInfo.locate}</span><br>
					<span class='glyphicon glyphicon-phone'></span>&nbsp;<span class="phone">${userInfo.phone}</span><br>
					<span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="email"><a href="mailto:${userInfo.email}">${userInfo.email}</a></span>
				</address>
			</div>
		</div>
		
		<div class="col-md-9" >
			<p style="display: block;">
				${aboutMe.content}
			</p>
		</div>
	</div>
</body>
</html>