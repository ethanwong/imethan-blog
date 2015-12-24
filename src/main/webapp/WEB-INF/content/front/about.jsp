<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>About|ImEthan|Full Stack Engineer</title>
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
	<div class="row">
		<div class="col-sm-9">
			<font style="font-size:30px;" >About me</font>
			<small style="padding-top: 20px;padding-left: 10px;padding-right: 10px;">我的个人简历</small>
			<shiro:user>
				<a href="${root}/blog/article/24" title="查看简历" ><span  class='glyphicon glyphicon-eye-open'></span></a>
				&nbsp;
				<a href="${root}/blog/article/input/${aboutMe.channelId}/${aboutMe.id}?locate=about" title="编辑简历" ><span  class='glyphicon glyphicon-edit'></span></a>
				&nbsp;
				<a href="${root}/setting/about" title="设置简历" ><span  class='glyphicon glyphicon-cog'></span></a>
			</shiro:user>
		</div>
		<div class="col-sm-3"></div>
	</div>
	

	<hr class="modelhr">
	<div class="row">
		<div class="col-md-3">
			<div class="userinfo"  >
				<p style="line-height: 36px;">
					<img class="img-thumbnail" src="${root}/upload/avatar/default-avatar-ethan.jpg" alt="${userInfo.nickname}" style="height: 180px;" >
				</p>
				<font size="4" class='nickname'>${userInfo.nickname}</font>
				<hr>
				<address style="line-height: 36px;">
					<span class="glyphicon glyphicon-map-marker"></span>&nbsp;<span class="locate">${userInfo.locate}</span><br>
					<span class='glyphicon glyphicon-phone'></span>&nbsp;<span class="phone">${userInfo.phone}</span><br>
				  	<img src="${root}/theme/images/QQ-ICO.jpg" width="12px;" height="13px;" /> &nbsp;<span class="qq"></span>
					<br><span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="email"><a href="mailto:${userInfo.email}">${userInfo.email}</a></span>
				</address>
			</div>
		</div>
		
		<div class="col-md-9 " >
			<div class="articleList article content">
					${aboutMe.content}
			</div>
		</div>
	</div>
</body>
</html>