<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
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
			var isPublish = $("#isPublish:checked").val();
			$.ajax({
				url:"${root}/console/cms/channel/save?id="+id+"&name="+name+"&intro="+intro+"&publish="+isPublish,
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
						location.href = "${root}/blog/${channelId}";
					},3000);
					
				}
			});
		};
	};

</script>
</head>
<body>
	
	<%@ include file="/WEB-INF/content/base/kindeditor.jsp"%>
	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default">
<!-- 				  <div class="panel-heading"> -->
<!-- 				    <h3 class="panel-title">Input channel</h3> -->
<!-- 				  </div> -->
				  <div class="panel-body">
				  		<div class="row" style="padding-top: 0px;">
							<div class="col-md-3">
								<h4><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;Input channel</h4>
							</div>
							<div class="col-md-9"></div>
						</div>
						<br>
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
						    <label for="intro">Intro</label>
						    <textarea rows="3" cols="20" class="form-control required" id="intro" placeholder="Enter intro" name="intro">${channel.intro}</textarea>
						  </div>
						  
						  <button type="button" class="btn btn-info" onclick="saveChannel()">Submit</button>
						  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">Return</button>
						</form>
				  </div>
			</div>
		</div>
	</div>
</body>
</html>