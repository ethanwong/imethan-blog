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
	
	<script src="${root}/theme/js/popover.js"></script>
	<script src="${root}/theme/js/tooltip.js"></script>
	<script src="${root}/theme/js/alert.js"></script>
	<script src="${root}/theme/js/transition.js"></script>
	
	<script src="${root}/theme/js/jquery.validate.js"></script>
	<script src="${root}/theme/js/messages-cn.js"></script>
	
	<script src="${root}/theme/js/readmore.js"></script>
	<script src="${root}/theme/js/jquery.infinitescroll.js"></script>
	<script src="${root}/theme/js/debug.js"></script>
	
	<!-- custom defin begin -->
	<link href="${root}/theme/css/common.css" rel="stylesheet">
	<link href="${root}/theme/css/index.css" rel="stylesheet">
	<script src="${root}/theme/js/common.js"></script>
	<!-- custom defin end -->
	
    <!-- jqgrid begin-->
	<link href="${root}/theme/jquery.jqGrid-4.6.0/css/jquery-ui.css" rel="stylesheet" type="text/css" />
	<link href="${root}/theme/jquery.jqGrid-4.6.0/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
	<script src="${root}/theme/jquery.jqGrid-4.6.0/js/grid.locale-cn.js" type="text/javascript"></script>
	<script src="${root}/theme/jquery.jqGrid-4.6.0/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="${root}/theme/jquery.jqGrid-4.6.0/js/jquery.jqGrid.src.js" type="text/javascript"></script>
	<!-- jqgrid end-->
	
	<!-- ztree begin -->
	<link rel="stylesheet" href="${root}/theme/jtree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${root}/theme/jtree/js/jquery.ztree.all-3.5.js"></script>
	<!-- ztree end -->

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
			<div class="row">
				<div class="col-md-12">
					<div style="padding-left: 0px;">
						<h1 style="font-size: 50px;color: #fff;padding-top: 100px;">Hello ImEthan</h1>
						<p style="font-size: 20px;color: #fff;">A blog named imethan,based java.</p>
						<a href="${root}/about"><button type="submit" class="btn btn-info">Learn more</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="height: 200px;margin-top: 0px;padding-top: 30px;">
		<div class="row">
				<div class="col-md-3" style="text-align: center;">
					<a href="">
						<span class="glyphicon glyphicon-picture" style="font-size: 100px;text-align: center;color: #5cb85c"></span>
					</a>
					<span class="help-block">This is photo album.</span>
				</div>
				<div class="col-md-3" style="text-align: center;">
					<a href="${root}/blog/8">
						<span class="glyphicon glyphicon-facetime-video" style="font-size: 100px;color: #5bc0de"></span>
					</a>
					<span class="help-block">Some video about me.</span>
				</div>
				<div class="col-md-3" style="text-align: center;">
					<a href="${root}/blog">
						<span class="glyphicon glyphicon-list" style="font-size: 100px;color: #f0ad4e"></span>
					</a>
					<span class="help-block">All blogs in site.</span>
				</div>
				<div class="col-md-3" style="text-align: center;">
					<a href="${root}/about">
						<span class="glyphicon glyphicon-magnet" style="font-size: 100px;color: #d9534f;"></span>
					</a>
					<span class="help-block">About me and site.</span>
				</div>
		</div>
	</div>

	
	
	<jsp:include page="/WEB-INF/content/base/decorators/front/footer.jsp"></jsp:include>

</body>
</html>

