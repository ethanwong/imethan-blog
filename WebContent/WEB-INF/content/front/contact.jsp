<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Contact|ImEthan|Full Stack Engineer</title>
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
				$(".contact").find(".qq").html(result.qq);
			}
		});
	};
	
	//保存消息
	function saveMessage(){
		if($("#inputForm").valid()){
			var name = $("#name").val();
			var email = $("#email1").val();
			var content = $("#content").val();
			$.ajax({
				type:"POST",
				url:"${root}/contact/save",
				data: "name="+name+"&email="+email+"&content="+encodeURIComponent(content),
			    dateType:"json",
				success:function(data){
					
					var result = eval("(" + data + ")");
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					}else{
						$("#name").val("");
						$("#email1").val("");
						$("#content").val("");
					};
					
					showMsg(messageType,result.message);
					
	
				}
			});
		};
	};

</script>
</head>
<body>
	<font style="font-size:30px;">Contact</font>
	<small style="padding-top: 20px;padding-left: 10px;">可以发消息给我</small>
	<hr>
	<div class="row">
		<div class="col-md-9" >
			<div class="panel panel-default contact" >
				<div class="panel-body">
					<h2 style="margin-top: 0px;">Can you leave a message</h2>
					<form role="form" action="#" method="post" id="inputForm">
					  <div class="form-group">
					    <label for="name">Name</label>
					    <input type="text" class="form-control required" id="name"  name='name' placeholder="Enter you name" maxlength="60">
					  </div>
					  <div class="form-group">
					    <label for="email1">Email</label>
					    <input type="email" class="form-control required" id="email1" name="email1" placeholder="Enter you email">
					  </div>
					  <div class="form-group">
					    <label for="content">Message</label>
					    <textarea rows="6" cols="20"  class="form-control required" id="content" name="content" placeholder="Enter you message" ></textarea>
					  </div>
					  <button type="button" class="btn btn-info" onclick="saveMessage()">Save message</button>
					</form>
				</div>
			</div>
		</div>
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
				  <img src="${root}/theme/images/QQ-ICO.jpg" width="12px;" height="13px;" /> &nbsp;<span class="qq"></span>
				</address>
				<address>
					<span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="email"></span>
				</address>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>