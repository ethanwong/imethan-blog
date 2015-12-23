<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title><decorator:title></decorator:title></title>
	<jsp:include page="/WEB-INF/content/base/meta.jsp"></jsp:include>
	<link rel="shortcut icon" href="${root}/theme/images/favicon.ico" type="image/x-icon" />
	<link href="${root}/theme/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${root}/theme/css/common.css" rel="stylesheet">
	<link href="${root}/theme/css/footer.css" rel="stylesheet">
	
	<!-- bootstrap begin -->
	<script src="${root}/theme/js/jquery-1.11.0.min.js"></script>
	<script src="${root}/theme/bootstrap-3.3.0/dist/js/bootstrap.min.js"></script>
	<!-- bootstrap end -->
	<script src="http://cdn.bootcss.com/scrollup/2.4.0/jquery.scrollUp.min.js"></script>
	
	<script src="${root}/theme/js/popover.js"></script>
	<script src="${root}/theme/js/tooltip.js"></script>
	<script src="${root}/theme/js/alert.js"></script>
	<script src="${root}/theme/js/transition.js"></script>
	
	<script src="${root}/theme/js/jquery.validate.js"></script>
	<script src="${root}/theme/js/jquery.metadata.js"></script>
	<script src="${root}/theme/js/messages-cn.js"></script>
	
	<script src="${root}/theme/js/readmore.js"></script>
	<script src="${root}/theme/js/jquery.infinitescroll.js"></script>
<%-- 	<script src="${root}/theme/js/debug.js"></script> --%>
	<!-- custom defin begin -->
	<script src="${root}/theme/js/common.js"></script>
	<!-- custom defin end -->
	
	 <!-- jqgrid begin-->
    <script type="text/ecmascript" src="${root}/theme/jqGrid/grid.locale-cn.js"></script>
    <script type="text/ecmascript" src="${root}/theme/jqGrid/jquery.jqGrid.min.js"></script>
    <link href="${root}/theme/jqGrid/ui.jqgrid-bootstrap.css" rel="stylesheet" type="text/css"  />
	<!-- jqgrid end-->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<%--     <script src="${root}/theme/bootstrap-3.3.0/other/ie10-viewport-bug-workaround.js"></script> --%>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <decorator:head></decorator:head>
    
    <!-- 新版访问分析代码（异步加载） -->
    <script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?b481918f832e6abc5cb27d566569d940";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
	
	<!-- 移动版的不固定头部样式处理 -->
	<style type="text/css">
		<c:if test="${!isNormal}">
			body>.container {
			  padding-top: 10px !important;
			}
		</c:if>
	</style>
    
</head>

<body>
	<div id="loader">
		<div id='loading-mask'></div>
		<div id="loading">
		    <div class="loading-indicator">
		       <img src="${root}/theme/css/ajax-loader.gif" width="41" height="31" style="padding-left: 10px;" /> 
		       <div class="loading-msg">Loading...</div>
		    </div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/content/base/decorators/front/header.jsp"></jsp:include>
	<div class="container">
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
	
	<jsp:include page="/WEB-INF/content/base/decorators/front/footer.jsp"></jsp:include>

	<script type="text/javascript">
		//页面加载时初始化脚本
		$(document).ready(function () {
			$('#loader').hide();
		});
	</script>
</body>
</html>