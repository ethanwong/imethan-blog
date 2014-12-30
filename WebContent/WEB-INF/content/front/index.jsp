<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>ImEthan | Full Stack Engineer</title>
	<jsp:include page="/WEB-INF/content/base/meta.jsp"></jsp:include>
	<link rel="shortcut icon" href="${root}/theme/images/favicon.ico" type="image/x-icon" />
	<!-- bootstrap begin -->
	<script src="${root}/theme/js/jquery-1.11.0.min.js"></script>
	<link href="${root}/theme/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet">
	<script src="${root}/theme/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
	<!-- bootstrap end -->
	
	<!-- custom defin begin -->
	<link href="${root}/theme/css/common.css" rel="stylesheet">
	<link href="${root}/theme/css/index.css" rel="stylesheet">
	<script src="${root}/theme/js/common.js"></script>
	<!-- custom defin end -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${root}/theme/bootstrap-3.3.0/other/ie10-viewport-bug-workaround.js"></script>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<jsp:include page="/WEB-INF/content/base/decorators/front/header.jsp"></jsp:include>
	<div class="banner blur">
		<div class="container" style="width: 980px">
			<div class="indexInfo">
				<div class="title">Hello ImEthan</div>
				<div class='content'>A blog named imethan,based java.</div>
				<a href="${root}/blog/article/25"><button type="submit" class="btn btn-info">Learn more</button></a>
			</div>
		</div>
	</div>

	<div class="container linkBox">
		<div class="row">
			<div class="col-md-3 icoAlign">
				<a href="#">
					<span class="glyphicon glyphicon-picture" style="color: #5cb85c"></span>
				</a>
				<p class="help-block">This is photo album.</p>
			</div>
			<div class="col-md-3 icoAlign">
				<a href="${root}/blog/8">
					<span class="glyphicon glyphicon-facetime-video" style="color: #5bc0de"></span>
				</a>
				<p class="help-block">Some video about me.</p>
			</div>
			<div class="col-md-3 icoAlign">
				<a href="${root}/blog/3">
					<span class="glyphicon glyphicon-list" style="color: #f0ad4e"></span>
				</a>
				<p class="help-block">Todo list in site.</p>
			</div>
			<div class="col-md-3 icoAlign">
				<a href="${root}/about">
					<span class="glyphicon glyphicon-magnet" style="color: #d9534f;"></span>
				</a>
				<p class="help-block">More about me.</p>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/content/base/decorators/front/footer.jsp"></jsp:include>
</body>
</html>

