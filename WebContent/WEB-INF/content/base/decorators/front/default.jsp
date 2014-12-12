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
	<script src="${root}/theme/js/jQuery.md5.js"></script>
	<link href="${root}/theme/css/bootstrap.css" rel="stylesheet">
	<script src="${root}/theme/js/jquery.validate.js"></script>
	<script src="${root}/theme/js/messages-cn.js"></script>
	<script src="${root}/theme/js/bootstrap.min.js"></script>
	<script src="${root}/theme/js/popover.js"></script>
	<script src="${root}/theme/js/tooltip.js"></script>
	<script src="${root}/theme/js/alert.js"></script>
	<script src="${root}/theme/js/transition.js"></script>
	<!-- bootstrap end -->
	
	
	
	<link href="${root}/theme/css/console/common.css" rel="stylesheet">

    <decorator:head></decorator:head>
</head>

<body>
	<jsp:include page="/WEB-INF/content/base/decorators/front/header.jsp"></jsp:include>

	<div class="container">
		<!-- 顶部可关闭提醒框 -->
		<c:if test="${WebReturnDto.success=='true'}">
			<div id="topWarn" class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
<!-- 				<strong>Warning!</strong> -->
				<p style="display: inline;">${WebReturnDto.message}</p>
			</div>
		</c:if>
		<c:if test="${WebReturnDto.success=='false'}">
			<div id="topWarn" class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
<!-- 				<strong>Warning!</strong> -->
				<p style="display: inline;">${WebReturnDto.message}</p>
			</div>
		</c:if>

		<!-- 面包屑导航 -->
		<!-- 		<ol class="breadcrumb"> -->
		<!-- 			<li><a href="#">Home</a></li> -->
		<!-- 			<li><a href="#">Library</a></li> -->
		<!-- 			<li class="active">Data</li> -->
		<!-- 		</ol> -->
		<decorator:body></decorator:body>
	</div>
	
	<jsp:include page="/WEB-INF/content/base/decorators/front/footer.jsp"></jsp:include>

	<!-- common -->
	<!-- common warn Modal -->
	<div class="modal fade" id="warnModal" tabindex="-1" role="dialog" aria-labelledby="warnModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Warning</h4>
				</div>
				<div class="modal-body">你真的要删除吗？</div>
				<div class="modal-footer">
					<button id="warnModalClick" type="button" class="btn btn-primary" data-dismiss="modal">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- common result Modal -->
	<div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提示信息</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
</body>
</html>

