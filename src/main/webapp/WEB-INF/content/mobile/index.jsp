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
	<script src="http://cdn.bootcss.com/scrollup/2.4.0/jquery.scrollUp.min.js"></script>
	
	<!-- custom defin begin -->
	<link href="${root}/theme/css/common.css" rel="stylesheet">
	<link href="${root}/theme/css/footer.css" rel="stylesheet">
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
	<div class="jumbotron" style="padding-top: 60px;">
	  <div class="container">
	  	<h1>Hello I'm Ethan</h1>
	  	<p>我的代码我的国，欢迎访问我的技术部落格。</p>
	  	<p><a href="${root}/blog/article/104"><button style="width: 160px;" type="submit" class="btn btn-primary">Learn more</button></a></p>
	  </div>
	</div>
	<div class="container linkBox" >
		<div class="media">
		  <div class="media-left">
				<a href="${root}/blog">
					<span class="glyphicon glyphicon-book" style="color: #5bc0de;font-size: 60px;"></span>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/blog"><h4 class="media-heading">Blog</h4></a>
		  	  博客文章模块，ImEthan的所有干货都在这里
		  </div>
		</div>
		
		<div class="media">
		  <div class="media-left">
				<a href="${root}/todo">
					<span class="glyphicon glyphicon-tasks" style="color: #f0ad4e;font-size: 60px;"></span>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/todo"><h4 class="media-heading">Todo</h4></a>
		  	 我的todo列表，记录待办事项，包括技能学习等事项的记录
		  </div>
		</div>
		
		<div class="media">
		  <div class="media-left">
				<a href="${root}/blog/23">
					<span class="glyphicon glyphicon-gift" style="color: #5cb85c;font-size: 60px;"></span>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/blog/23"><h4 class="media-heading">Item</h4></a>
		  	 闲暇时间开发和整理的开放源代码项目介绍
		  </div>
		</div>
		
		<div class="media linkWrap">
		  <div class="media-left">
				<a href="${root}/about">
					<span class="glyphicon glyphicon-magnet" style="color: #d9534f;font-size: 60px;"></span>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/about"><h4 class="media-heading">About</h4></a>
		  	 个人信息展示页面，正常情况下，将简历详情隐藏，待到派上用场的时候再设置公开
		  </div>
		</div>
	</div>
	
	<div class="container labelBox" >
		<div class="row">
			<div class="col-md-12">
				<label><span class="glyphicon glyphicon-tags"></span>  Tag Cloud</label>
				<br>
				<c:forEach items="${allLabel}" var="label" varStatus="status">
					<a href="${root}/blog/tag/${label.id}" >
						<span class='label label-info indexLabel'>
							${label.name}
						</span>
					</a>
					&nbsp;
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/content/base/decorators/front/footer.jsp"></jsp:include>
</body>
</html>

