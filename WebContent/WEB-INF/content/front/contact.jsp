<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan:Contact</title>
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
				var avatar = "default-avatar-ethan.jpg";
				if(result.avatar!=null && result.avatar!=''){
					avatar = result.avatar;
				}
				var email = "<a href='mailto:"+result.email+"'>"+result.email+"</a>"
				$(".contact").find(".email").html(email);
				$(".contact").find(".phone").html(result.phone);
				$(".contact").find(".locate").html(result.locate);
			}
		});
	};

</script>
</head>
<body>
	<font style="font-size:30px;">Contact</font>
	<hr>
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default contact" >
			  <div class="panel-heading">Contact</div>
			  <div class="panel-body">
			  	<address>
				  <span class='glyphicon glyphicon-map-marker'></span>&nbsp;<span class='locate'></span><br>
				</address>
				<address>
				  <span class='glyphicon glyphicon-phone'></span>&nbsp;<span class='phone'></span><br>
				</address>
				<address>
				  <span class='glyphicon glyphicon-envelope'></span>&nbsp;<span class="email"></span>
				</address>
			  </div>
			</div>
		</div>
		<div class="col-md-9" >
			<h2 style="margin-top: 0px;">Can you leave a message</h2>
			<form role="form" action="#" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email" class="form-control" id="email" placeholder="Enter you email">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Message</label>
			    <textarea  class="form-control" id="message" placeholder="Enter you message" rows="6"></textarea>
			  </div>
			  <button type="submit" class="btn btn-info">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>