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
	
	function saveArticle(){
		var content = $("#kindeditorContent").val();
		if(content == "" || $.trim(content) == ""){
			$("#kindeditorContentError").html("This field is required.");
		};

		if($("#inputForm").valid()){
			var id = $("#id").val();
			var title = $("#title").val();
			var channelId = $("#channelId").val();
			$.ajax({
				type:"POST",
				url:"${root}/console/cms/article/save",
				data: "id="+id+"&title="+title+"&channel.id="+channelId+"&content="+encodeURIComponent(content),
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
				  <div class="panel-heading">
				    <h3 class="panel-title">Input article</h3>
				  </div>
				  <div class="panel-body">
					  	<form role="form" method="post" action="" id="inputForm">
					  	  <input id="id"  type="hidden" name="id" value="${article.id}">
					  	  
						  <div class="form-group">
						    <label for="title">Title</label>
						    <input id="title"  type="text" class="form-control required" placeholder="Enter title" value="${article.title}">
						  </div>
						  
						  <div class="form-group">
						    <label for="title">Channel</label>
						    <select id="channelId" name="channelId" class="form-control required">
						    	<c:forEach items="${channelList}" var="channel" varStatus="status">
						    		<option value="${channel.id}" <c:if test="${channelId eq  channel.id}">selected="selected"</c:if>>${channel.name}</option>
						    	</c:forEach>
							</select>
						  </div>
						  
						  <div class="form-group">
						    <label for="content">Content</label>
						    <textarea id="kindeditorContent" style="height: 260px;" class="form-control required" placeholder="Enter content">${article.content}</textarea>
						  	<label id="kindeditorContentError" ></label>
						  </div>
						  
						  <button type="button" class="btn btn-primary" onclick="saveArticle()">Submit</button>
						  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">Return</button>
						</form>
				  </div>
			</div>
		</div>
	</div>
</body>
</html>