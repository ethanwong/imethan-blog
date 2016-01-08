<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Setting:ImEthan独立博客:Full Stack Engineer</title>
<%@ include file="/WEB-INF/content/base/umeditor.jsp"%>
<link rel="stylesheet" type="text/css" href="${root}/theme/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="${root}/theme/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${root}/theme/js/cryptojs/crypto-js-md5.js"></script>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		
		
		//实例化编辑器
		var um = UM.getEditor('editor');
		um.addListener('blur',function(){
			
	    });
	    um.addListener('focus',function(){
	        $('#editorWarn').html('')
	    });
	    
});

	
	//更新简历配置
	function updateAbout(){
		
		var isPublishResume = $(".isPublishResume:checked").val();
// 		var content = $("#resumeReplacement").val();
		var content = UM.getEditor('editor').getContent();
		
		$.ajax({
			url : "${root}/setting/updateAboutSet",
			data: "isPublish="+isPublishResume+"&content="+encodeURIComponent(content),
			type : "POST",
			dateType : "json",
			success : function(data) {
				var result = eval("(" + data + ")");
				var messageType = "success";
				if (result.success == false) {
					messageType = "error";
				}
				showMsg(messageType, result.message);
			}
		});
	};
</script>
</head>
<body>
<div class="container main">
	<div class="row">
		<div class="col-md-3">
			<%@ include file="/WEB-INF/content/front/setting/setting-menu.jsp"%>
		</div>
		
		<div class="col-md-9" >
			  <div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">${type}</h3>
				  </div>
				  <div class="panel-body">
						<c:if test="${type eq 'about' }">
							<div class="well well-sm">简历展现配置，隐藏简历后，编辑简历替代展现内容~</div>
							<form role="form" id="aboutForm" method="post">
							  <div class="radio">
								  <label>
									    <input type="radio" name="isPublishResume" class="isPublishResume" value="true" <c:if test="${isPublishResume == null || isPublishResume eq true }">checked="checked"</c:if>/>
									    Publish Resume
								  </label>
								  <label>
									    <input type="radio" name="isPublishResume" class="isPublishResume" value="false" <c:if test="${isPublishResume eq false }">checked="checked"</c:if> />
									    Hidden Resume
								  </label>
							  </div>
							   
							 <div class="form-group">
						   	 	<label for="content">Replacement</label>
						    	<script type="text/plain" id="editor"  style="width:100%!important;height: 300px;">${description}</script>
								<label id="editorContentError" ></label>
								<p id="editorWarn"></p>
						  	 </div>
							 <button  type="button" class="btn btn-info" onclick="updateAbout()">Update</button>
							</form>
						</c:if>
				  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>