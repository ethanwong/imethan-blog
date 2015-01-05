<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<html>
<head>
	<title>ImEthan | Console | Full Stack Engineer</title>
	<jsp:include page="/WEB-INF/content/base/meta.jsp"></jsp:include>
	<link rel="shortcut icon" href="${root}/theme/images/favicon.ico" type="image/x-icon" />
	<!-- bootstrap begin -->
	<script src="${root}/theme/js/jquery-1.11.0.min.js"></script>
	<link href="${root}/theme/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet">
	<script src="${root}/theme/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
	
	<script src="${root}/theme/js/jquery.validate.js"></script>
	<script src="${root}/theme/js/messages-cn.js"></script>
	<script src="${root}/theme/js/bootstrap.min.js"></script>
	<script src="${root}/theme/js/popover.js"></script>
	<script src="${root}/theme/js/tooltip.js"></script>
	<script src="${root}/theme/js/alert.js"></script>
	<script src="${root}/theme/js/transition.js"></script>
	<!-- bootstrap end -->
	
	<!-- custom defin begin -->
	<link href="${root}/theme/css/common.css" rel="stylesheet">
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
	
	<!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="${root}/theme/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
	<decorator:head></decorator:head>
</head>
<body>
	<jsp:include page="/WEB-INF/content/base/decorators/console/header.jsp"></jsp:include>
	<div class="container">
		<!-- 面包屑导航 -->
		<ol class="breadcrumb">
			<c:forEach var="path" items="${pathList}" varStatus="status">
				<li><a href="#" <c:if test="${status.count eq '3'}">class="active"</c:if>>${path}</a></li>
			</c:forEach>
		</ol>
		
		<!-- 提醒信息 -->
		<div id="topWarn" class="alert alert-success alert-dismissable" style="display: none">
			<button type="button" class="close" onclick="closeTopWarn(this)">&times;</button>
			<strong></strong>
			<p style="display: inline;"></p>
		</div>
		
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
		
		<decorator:body></decorator:body>
		
	</div>
	<jsp:include page="/WEB-INF/content/base/decorators/console/footer.jsp"></jsp:include>
</body>
</html>