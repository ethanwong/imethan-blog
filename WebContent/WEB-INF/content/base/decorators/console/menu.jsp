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
<title>ImEthan Example</title>

<!-- Bootstrap core CSS -->
<link href="${root}/theme/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${root}/theme/css/console/common.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- Static navbar -->
	<div class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container" style="width: 970px;">
			<div class="navbar-header">
				<!--           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> -->
				<!--             <span class="sr-only">Toggle navigation</span> -->
				<!--             <span class="icon-bar"></span> -->
				<!--             <span class="icon-bar"></span> -->
				<!--             <span class="icon-bar"></span> -->
				<!--           </button> -->
				<a class="navbar-brand" href="${root}/console/home">ImEthan</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="${root}/console/home">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">CMS <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${root}/console/cms/channel">Channel</a></li>
							<li><a href="${root}/console/cms/article">Article</a></li>
							<!--                 <li class="divider"></li> -->
							<!--                 <li class="dropdown-header">Nav header</li> -->
							<!--                 <li><a href="#">Separated link</a></li> -->
							<!--                 <li><a href="#">One more separated link</a></li> -->
						</ul>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">SECURITY<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${root}/console/security/user">User</a></li>
							<li><a href="${root}/console/security/role">Role</a></li>
							<li><a href="${root}/console/security/permission">Permission</a></li>
							<li><a href="${root}/console/security/resource">Resource</a></li>
						</ul>
					</li>
				</ul>
<!-- 				          <ul class="nav navbar-nav navbar-right"> -->
<!-- 				            <li><a href="#">Default</a></li> -->
<!-- 				            <li><a href="#">Static top</a></li> -->
<!-- 				            <li><a href="#">Fixed top</a></li> -->
<!-- 				          </ul> -->

				<div class="navbar-form navbar-right" >
					<shiro:guest>  
						<a type="submit" class="btn btn-default" href="${root}/console/toSignin">Sign in</a>
					</shiro:guest>
					<shiro:user>  
						Hello, <shiro:principal/>!  
						<a type="submit" class="btn btn-default" href="${root}/console/signout">Sign out</a>
					</shiro:user>
				</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

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

<!-- 		面包屑导航 -->
<!-- 				<ol class="breadcrumb"> -->
<!-- 					<li><a href="#">Home</a></li> -->
<!-- 					<li><a href="#">Library</a></li> -->
<!-- 					<li class="active">Data</li> -->
<!-- 				</ol> -->
		<decorator:body></decorator:body>
	</div>
	<!-- /container -->

	<div class="footer">
		<div class="container" style="width: 970px;">
			<p class="text-muted">A simple website by ethan.</p>
		</div>
	</div>

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
	<%@ include file="/WEB-INF/content/base/js.jsp"%>
	
</body>
</html>

