<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ImEthan</title>
	<!-- bootstrap begin -->
	<script src="${root}/theme/js/jquery-1.11.0.min.js"></script>
	<link href="${root}/theme/css/bootstrap.css" rel="stylesheet">
	<script src="${root}/theme/js/jquery.validate.js"></script>
	<script src="${root}/theme/js/messages-cn.js"></script>
	<script src="${root}/theme/js/bootstrap.min.js"></script>
	<script src="${root}/theme/js/popover.js"></script>
	<script src="${root}/theme/js/tooltip.js"></script>
	<script src="${root}/theme/js/alert.js"></script>
	<script src="${root}/theme/js/transition.js"></script>
	<!-- bootstrap end -->
	
	<!-- custom defin begin -->
	<link href="${root}/theme/css/console/common.css" rel="stylesheet">
	<script src="${root}/theme/js/console/common.js"></script>
	<!-- custom defin end -->
	
    <!-- jqgrid begin-->
	<link href="${root}/theme/jquery.jqGrid-4.6.0/css/jqGrid.bootstrap.css" rel="stylesheet" type="text/css" />
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
</head>
<body>
	<jsp:include page="/WEB-INF/content/base/decorators/console/header.jsp"></jsp:include>
	<div class="container">
		<!-- 面包屑导航 -->
<!-- 		<ol class="breadcrumb"> -->
<!-- 			<li><a href="#">Home</a></li> -->
<!-- 			<li><a href="#">Library</a></li> -->
<!-- 			<li class="active">Data</li> -->
<!-- 		</ol> -->
		
		<!-- 提醒信息 -->
		<div id="topWarn" class="alert alert-success alert-dismissable" style="display: none">
			<button type="button" class="close" onclick="closeTopWarn(this)">&times;</button>
			<strong></strong>
			<p style="display: inline;"></p>
		</div>
		
		<decorator:body></decorator:body>
		
	</div>
	<jsp:include page="/WEB-INF/content/base/decorators/console/footer.jsp"></jsp:include>
	
	
	<!-- common element -->
	
	<!-- common warn Modal -->
	<div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Warning</h4>
				</div>
				<div class="modal-body">Sure you want to delete?</div>
				<div class="modal-footer">
					<button id="deleteConfirmModalClick" type="button" class="btn btn-primary" data-dismiss="modal">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>