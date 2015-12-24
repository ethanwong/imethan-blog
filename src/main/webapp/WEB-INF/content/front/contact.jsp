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
		loadUserInfo("imethan");//加载用户信息
		loadMessage(1);//加载消息
	});
	
	//隐藏
	function hiddenOne(id){
		$.ajax({
			url:"${root}/contact/hidden/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				var messageType = "success";
				if(result.success == false){
					messageType = "error";
				};
				
				showMsg(messageType,result.message);
				loadMessage(1);
			}
		});
	};
	//删除
	function deleteOne(id){
		$('#deleteConfirmModal').modal({
		 	 keyboard: true
		});
		$("#deleteConfirmModalClick").click(function(){
			$.ajax({
				url:"${root}/contact/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					
					showMsg(messageType,result.message);
					loadMessage(1);
				}
			});
		});
	};
	
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
				url:"${root}/contact/save?name="+name+"&email="+email+"&content="+encodeURIComponent(content),
			    dateType:"json",
				success:function(data){
					
					var result = eval("(" + data + ")");
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					}
					
					$(".addWarm").html("<p class='bg-primary' style='padding: 8px;display: inline;'>"+result.message+"</p>");
					
					 setTimeout(
							  function(){
								  $(".addWarm").html("");
								  $("#name").val("");
									$("#email1").val("");
									$("#content").val("");
							  }
					  , 3000);
					loadMessage(1);
				}
			});
		};
	};
	
	
	//加载消息
	function loadMessage(page){
		$.ajax({
			url:"${root}/contact/json/"+page,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$("#messageList").html("");
				$.each(result.rows, function(i, item) {
				var message = ""+
					"<div class='panel panel-default'>"+
						"<div class='panel-body'>"+
							"<span style='float: left;'><span class='glyphicon glyphicon-user'></span> "+item.name+"</span>"+
							"<span style='float: right;'>"+
								"<span  class='glyphicon glyphicon-calendar'></span> "+item.createTime+
								"<shiro:user>"+
								"&nbsp;&nbsp;<a href='#' onclick='hiddenOne("+item.id+")'><span  class='glyphicon glyphicon-flag' ></span><a>"+
								"&nbsp;&nbsp;<a href='#' onclick='deleteOne("+item.id+")'><span  class='glyphicon glyphicon-trash' ></span><a>"+
								"</shiro:user>"+
								"</span>"+
							"<br>"+
							"<div style='display: inline-block;padding-top: 10px;'>"+
							item.content+
							"</div>"+
						"</div>"+
					"</div>";
					$("#messageList").append(message);
				});
				
				// 处理上页和下页按钮
				var next = result.next;
				var previous = result.previous;
				var page = result.page;
				
				$(".pager").html("");
				var disabled = "class='disabled'";
				var nextButton = "";
				var previousButton = "";
				
				if(previous ==  true){
					previousButton ="<li><a href='#' onclick='loadMessage("+(page-1)+")'>Previous</a></li>";
				}else{
					previousButton ="<li class='disabled'><a href='#'>Previous</a></li>";
				}
				
				if(next == true){
				    nextButton = "<li><a href='#' onclick='loadMessage("+(page+1)+")'>Next</a></li>";
				}else{
					nextButton ="<li class='disabled'><a href='#'>Next</a></li>";
					
				}
				if(!previous && !next){
					previousButton ="";
					nextButton ="";
				}
				
				$(".pager").append(previousButton);
				$(".pager").append("&nbsp;&nbsp;");
				$(".pager").append(nextButton);
			}
		});
	};

</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-9">
			<font style="font-size: 30px;">Contact</font> <small
				style="padding-top: 20px; padding-left: 10px;">发消息联系我</small>
		</div>
		<div class="col-sm-3"></div>
	</div>
	<hr class="modelhr">
	<div class="row">
		<div class="col-md-9" >
			<div id="messageList"></div>
			<nav><ul class="pager"></ul></nav>
			
			<div class="panel panel-default contact" >
				<div class="panel-heading">Leave a message <font color="red">*</font>为必填项</div>
				<div class="panel-body">
					<form role="form" action="#" method="post" id="inputForm">
					  <div class="form-group">
					    <label for="name">Name<font color="red">*</font></label>
					    <input type="text" class="form-control required" id="name"  name='name' placeholder="Enter you name" maxlength="60">
					  </div>
					  <div class="form-group">
					    <label for="email1">Email<font color="red">*</font></label>
					    <input type="email" class="form-control required" id="email1" name="email1" placeholder="Enter you email">
					  </div>
					  <div class="form-group">
					    <label for="content">Message<font color="red">*</font></label>
					    <textarea rows="4" cols="20"  class="form-control required" id="content" name="content" placeholder="Enter you message" ></textarea>
					  </div>
					  <button type="button" class="btn btn-primary" onclick="saveMessage()">Send Message</button>
					  <span class="addWarm"></span>
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