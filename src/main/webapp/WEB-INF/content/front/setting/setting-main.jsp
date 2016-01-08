<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Setting:ImEthan独立博客:Full Stack Engineer</title>
<script type="text/javascript">
	function updateSiteInfo(){
		if ($("#form").valid()) {
			var sitename = $("#sitename").val();
			var copyright = $("#copyright").val();
			
			$.ajax({
				url : "${root}/setting/updateSiteInfo",
				data: "copyright="+encodeURIComponent(copyright)+"&sitename="+encodeURIComponent(sitename),
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
		}
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
			  			<form role="form" id="form" method="post">
							 <div class="form-group">
							    <label for="sitename">${sitename.name}</label>
							    <input type="text" class="form-control" id="sitename" name="sitename" placeholder="Enter site name" value="${sitename.content}">
							  </div>
							 <div class="form-group">
							    <label for="copyright">${copyright.name}</label>
							    <input type="text" class="form-control" id="copyright" name="copyright" placeholder="Enter copyright" value="${copyright.content}">
							  </div>
							 <button type="button" class="btn btn-info" onclick="updateSiteInfo()">Update</button>
						</form>
				  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>