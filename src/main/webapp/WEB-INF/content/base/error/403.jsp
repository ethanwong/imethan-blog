<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>403</title>
<link href="${root}/theme/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet">
<link href="${root}/theme/css/common.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="col-md-12">
			<div class="error_ex" style="text-align: center;">
				<h1>403</h1>
				<h3>Opps, You're lost.</h3>
				<p>Access to this page is forbidden</p>
				<a class="btn btn-warning btn-big" href="${root}/index.jsp">Back
					to Home</a>
			</div>
		</div>
	</div>
	<%@ page session="false"%>
</body>
</html>