<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Blog:ImEthan独立博客:Full Stack Engineer</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
	});
	
	//保存栏目
	function saveChannel(object){
		if($("#inputForm").valid()){
			var id = $("#id").val();
			var name = $("#name").val();
			var intro = $("#intro").val();
			var orderNo = $("#orderNo").val();
			var isPublish = $("#isPublish:checked").val();
			$.ajax({
				url:"${root}/cms/channel/save?id="+id+"&name="+name+"&intro="+intro+"&publish="+isPublish+"&orderNo="+orderNo,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					
					showMsg(messageType,result.message);
					
					setTimeout(function(){
// 						location.href = "${root}/blog/${channelId}";
						location.href = "${root}/blog/channel";
					},1500);
					
				}
			});
		};
	};

</script>
</head>
<body>
<div class="container main">
	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default">
				  <div class="panel-heading">
				    <h4 class="panel-title">Input channel</h4>
				  </div>
				  <div class="panel-body">
					  	<form role="form" method="post" action="" id="inputForm">
					  	  <input id="id"  type="hidden" name="id" value="${channel.id}">
					  	  
						  <div class="form-group">
						    <label for="name">Name</label>
						    <input id="name"  type="text" class="form-control required" placeholder="Enter name" value="${channel.name}">
						  </div>
						  <div class="radio">
							  <label>
								    <input type="radio" name="isPublish" id="isPublish" value="true" <c:if test="${channel.publish eq true }">checked="checked"</c:if>/>
								    Publish
							  </label>
							  <label>
								    <input type="radio" name="isPublish" id="isPublish" value="false" <c:if test="${channel.publish eq false }">checked="checked"</c:if>/>
								    Hidden
							  </label>
						  </div>
						  
						  <div class="form-group">
						    <label for="intro">OrderNo</label>
						    <input id="orderNo"  type="text" class="form-control required" placeholder="Enter OrderNo" value="${channel.orderNo}">
						  </div>
						  <div class="form-group">
						    <label for="intro">Intro</label>
						    <textarea rows="3" cols="20" class="form-control required" id="intro" placeholder="Enter intro" name="intro">${channel.intro}</textarea>
						  </div>
						  
						  <button type="button" class="btn btn-primary" onclick="saveChannel()">Save</button>
						  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">Back</button>
						</form>
				  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>