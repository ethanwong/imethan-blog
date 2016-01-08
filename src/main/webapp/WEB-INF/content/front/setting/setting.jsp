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
				  		Setting
				  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>