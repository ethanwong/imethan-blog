<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<%@ include file="/WEB-INF/content/base/umeditor.jsp"%>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		//实例化编辑器
		var um = UM.getEditor('editor');
	});
	
	function saveArticle(){
		
		if(!UM.getEditor('editor').hasContents()){
			$("#editorContentError").html("This field is required.");
		};

		if($("#inputForm").valid()){
			var id = $("#id").val();
			var title = $("#title").val();
			var channelId = $("#channelId").val();
			var content = UM.getEditor('editor').getContent();
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
						    <!--  
						    <script type="text/plain" id="editor"  style="width:924px!important;height: 260px;">${article.content}</script>
 							-->
 							<textarea id="editor"  style="width:924px!important;height: 260px;" >${article.content}</textarea>
							<label id="editorContentError" ></label>
						  </div>
						  
						  <button type="button" class="btn btn-info" onclick="saveArticle()">Submit</button>
						  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">Return</button>
						</form>
				  </div>
			</div>
		</div>
	</div>
</body>
</html>