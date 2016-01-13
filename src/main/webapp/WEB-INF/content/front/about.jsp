<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>About:ImEthan独立博客:Full Stack Engineer</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		//加载用户信息
		loadUserInfo();
	});
	
	//加载用户信息
	function loadUserInfo(){
		$.ajax({
			url:"${root}/userinfo/getUserInfo",
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$(".userinfo").find(".nickname").html(result.nickname);
				$(".userinfo").find(".locate").html(result.locate);
				var email = "<a href='mailto:"+result.email+"'>"+result.email+"</a>"
				$(".userinfo").find(".email").html(email);
				$(".userinfo").find(".phone").html(result.phone);
				$(".userinfo").find(".qq").html(result.qq);
				
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
<div class="container main">
	<div class="row">
		<div class="col-sm-12">
			<span class="main-title">About me</span>
	    	<small class="main-second-title">我的个人简历</small>
	    	
			<shiro:user>
				<a href="${root}/blog/article/24" title="查看简历" ><i  class='icon-eye-open'></i></a>
				&nbsp;
				<a href="${root}/blog/article/input/${aboutMe.channelId}/${aboutMe.id}?locate=about" title="编辑简历" ><i  class='icon-edit'></i></a>
				&nbsp;
				<a href="${root}/setting/about" title="设置简历" ><i  class='icon-cog'></i></a>
			</shiro:user>
		</div>
	</div>	
	<hr>
	<div class="row">
		<div class="col-md-3">
			<div class="userinfo"  >
				<p style="line-height: 36px;">
					<img class="img-thumbnail" src="${root}/upload/avatar/default-avatar-ethan.jpg" alt="${userInfo.nickname}" style="height: 180px;" >
				</p>
				<font size="4" class='nickname'>${userInfo.nickname}</font>
				<hr>
				<address style="line-height: 36px;">
					<i class="icon-map-marker"></i>&nbsp;<span class="locate">${userInfo.locate}</span><br>
					<i class='icon-phone'></i>&nbsp;<span class="phone">${userInfo.phone}</span><br>
				  	<strong style="font-weight: 600;">qq</strong>&nbsp;<span class="qq"></span><br>
					<i class="icon-envelope"></i>&nbsp;<span class="email"><a href="mailto:${userInfo.email}">${userInfo.email}</a></span>
				</address>
			</div>
		</div>
		
		<div class="col-md-9 " >
			<div class="articleList article content">
					${aboutMe.content}
			</div>
		</div>
	</div>
</div>
</body>
</html>