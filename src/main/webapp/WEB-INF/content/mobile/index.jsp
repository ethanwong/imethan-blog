<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>ImEthan|Full Stack Engineer</title>
	<link href="${root}/theme/css/index.css" rel="stylesheet">
</head>
<body>
	<div class="jumbotron">
	  <div class="container" style="text-align: center;">
	  	<h1>Hello I'm Ethan</h2>
	  	<p>欢迎访问我的知识部落格</p>
	  	<p></p>
	  	<p><a style="width: 200px;" class="button  button-default" href="${root}/blog/article/104"> Learn more </a></p>
	  </div>
	</div>
	<div class="container linkBox" >
		<div class="media">
		  <div class="media-left">
				<a href="${root}/blog">
					<span class="icon-rss color-primary" style="font-size: 60px;"></span>
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
					<span class="icon-tasks color-success" style="font-size: 60px;"></span>
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
					<span class="icon-suitcase color-warning" style="font-size: 60px;"></span>
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
					<span class="icon-user color-danger" style="font-size: 60px;"></span>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/about"><h4 class="media-heading">About</h4></a>
		  	 个人信息展示页面，正常情况下，将简历详情隐藏，待到派上用场的时候再设置公开
		  </div>
		</div>
	</div>
	<hr>
	<div class="container labelBox" >
		<div class="row">
			<div class="col-md-12">
				<label><span class="glyphicon glyphicon-tags"></span>  Tag Cloud</label>
				<br>
				<c:forEach items="${allLabel}" var="label" varStatus="status">
					<a href="${root}/blog/tag/${label.id}" >
						<span class='label label-primary indexLabel'>
							${label.name}
						</span>
					</a>
					&nbsp;
				</c:forEach>
			</div>
		</div>
	</div>
	<hr>
	<div class="container searchBox">
		<div class="row" style="margin: 0px;">
			<div class="col-md-3" ></div>
			<div class="col-md-6" >
				<h3 class="title" >Search for blog</h3>
				<form role="form"  action="${root}/blog" style="padding: 0px 20px 0px 20px;">
					<div class="input-group">
				      <input style="height: 40px;" type="text" name="search_title" class="form-control" placeholder="Enter the title or content">
				      <span class="input-group-btn">
				        <button style="height: 40px;" class="btn btn-primary" type="button">Search</button>
				      </span>
				    </div>
				</form>
			</div>
			<div class="col-md-3" ></div>
		</div>
	</div>
	<hr>
	<div class="container countBox" >
		<div class="row countTitle" style="margin: 0px;">
			<div class="col-md-12" >
				<span class="title">All Content In Site</span>
				<span>站内发布的所有内容信息量统计</span>
				<div class="icon" ><i class="icon-bar-chart icon-4x"></i></div>
			</div>
		</div>
		<div class="row" style="margin: 0px;">
			<div class="col-md-4" >
				<div class="countInfo">
					<p class="count color-primary">${articles}</p>
					<p>发表的文章数</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="countInfo">
					<p class="count color-primary" style="">${tags}</p>
					<p>云标签数</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="countInfo">
					<p class="count color-primary">${channels}</p>
					<p>归类栏目数</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

