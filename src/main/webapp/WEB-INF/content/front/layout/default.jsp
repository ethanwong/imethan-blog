<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<!-- 	<title>ImEthan独立博客 | Full Stack Engineer</title> -->
	<title>${SITENAME}</title>
	<jsp:include page="/WEB-INF/content/base/meta.jsp"></jsp:include>
	
	<link rel="shortcut icon" href="${root}/theme/images/favicon.ico" type="image/x-icon" />
	<link href="${root}/theme/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${root}/theme/animation/animate.css" rel="stylesheet">
	<link href="${root}/theme/animation/source/attention_seekers/headShake.css" rel="stylesheet">
	
	<link href="${root}/theme/css/buttons.css" rel="stylesheet">
	<link href="${root}/theme/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet">
	
	<link href="${root}/theme/css/common.css" rel="stylesheet">
	<link href="${root}/theme/css/article.css" rel="stylesheet">
	<link href="${root}/theme/css/footer.css" rel="stylesheet">
	
	<script src="${root}/theme/js/jquery-1.11.0.min.js"></script>
	<script src="${root}/theme/bootstrap-3.3.0/dist/js/bootstrap.min.js"></script>
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
	<script src="${root}/theme/js/common.js"></script>
	<script src="${root}/theme/js/buttons.js"></script>
	<script src="${root}/theme/layer/layer.js"></script>
	
	
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
			body>.main {
 			  padding-top: 10px !important;
			}
			.main-banner{
				 margin-top: 0px !important;
			}
		</c:if>
	</style>
</head>
<body>
	<!-- loading -->
	<div id="loader">
		<div id='loading-mask'></div>
		<div id="loading">
		    <div class="loading-indicator">
		       <img src="${root}/theme/css/ajax-loader.gif" width="41" height="31" style="padding-left: 10px;" /> 
		       <div class="loading-msg">Loading...</div>
		    </div>
		</div>
	</div>
	<!-- header -->
	<jsp:include page="/WEB-INF/content/front/layout/header.jsp"></jsp:include>
	
	<!-- main -->
	<decorator:body></decorator:body>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/content/front/layout/footer.jsp"></jsp:include>

	<script type="text/javascript">
		//页面加载时初始化脚本
		$(document).ready(function () {
			$('#loader').hide();
		});
	</script>
</body>
</html>