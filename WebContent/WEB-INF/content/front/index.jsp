<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>ImEthan|Full Stack Engineer</title>
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
		<div class="container" >
			<div class="indexInfo">
				<div class="title">Hello ImEthan</div>
				<div class='content'>A blog named imethan,based java.</div>
				<div class='content' style="font-size: 16px;">我的代码我的国，欢迎访问我的技术部落格。</div>
				<a href="${root}/more"><button type="submit" class="btn btn-info">Learn more</button></a>
			</div>
		</div>
	</div>
	<span class="glyphicon glyphicon-info-sign bannerInfo" 
	title="2014年的夏天，在厦门图书馆旁的一家咖啡厅准备开发ImEthan部落格，间隙用手机拍了三张照片，当前您所看到的这张图片，便是这三张照片合成而来，图中的华硕A40J是学生时代就开始陪伴我的电脑,部落格也是凭借它而来~"></span>
	
	<div class="container linkBox" >
		<div class="row">
			<div class="col-md-3 linkWrap" >
				<div class="link">
					<div class="ico">
						<a href="${root}/blog">
							<span class="glyphicon glyphicon-book" style="color: #5bc0de;"></span>
						</a>
						<p class="tx">Read all blogs.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 linkWrap">
				<div class="link">
					<div class="ico">
						<a href="${root}/todo">
							<span class="glyphicon glyphicon-tasks" style="color: #f0ad4e"></span>
						</a>
						<p class="tx">Personal todo list.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 linkWrap">
				<div class="link">
					<div class="ico">
						<a href="${root}/blog/23">
							<span class="glyphicon glyphicon-gift" style="color: #5cb85c"></span>
						</a>
						<p class="tx">Personal item.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 linkWrap">
				<div class="link">
					<div class="ico">
						<a href="${root}/about">
							<span class="glyphicon glyphicon-magnet" style="color: #d9534f;"></span>
						</a>
						<p class="tx" >More about me.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/content/base/decorators/front/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		$('.bannerInfo').tooltip({
			 placement: 'top',
			 template:'<div class="tooltip" role="tooltip" style="font-size:14px;"><div class="tooltip-arrow"  ></div><div class="tooltip-inner" style="width:400px!important;background-color: #5BC0DE;text-align:left;"></div></div>',
			 delay: { "show": 200, "hide": 200 }
		});
	});
	</script>
</body>
</html>

