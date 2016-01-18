<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>ImEthan独立博客:Full Stack Engineer</title>
	<link href="${root}/theme/css/index.css" rel="stylesheet">
</head>
<body>
	<div class="banner">
		<div class="container" >
			<div class="row">
				<div class="col-md-12">
					<div class="indexInfo">
						<div class="title animated headShake">Hello I'm Ethan</div>
						<div class='content'>A blog named ImEthan,based java and bootstrap.</div>
						<div class='content' style="font-size: 16px;">我的知识我的国，欢迎访问我知识记录和分享的部落格。</div>
						<p></p>
						<p><a style="width: 200px;" class="button  button-default" href="${root}/blog/article/104"> Learn more </a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<span class="glyphicon glyphicon-info-sign bannerInfo"  -->
<!-- 	title="2014年的夏天，在厦门图书馆旁的一家咖啡厅准备开发ImEthan部落格，间隙用手机拍了三张照片，当前您所看到的这张图片，便是这三张照片合成而来，图中的华硕A40J是学生时代就开始陪伴我的电脑,部落格也是凭借它而来~"></span> -->
	
	<div class="container linkBox" >
		<div class="media desktop">
		  <div class="media-left">
				<a href="${root}/blog">
					<i class="icon-rss color-primary" ></i>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/blog"><h3 class="media-heading">Blog</h3></a>
		  	  博客文章模块，ImEthan的所有干货都在这里
		  </div>
		</div>
		
		<div class="media desktop">
		  <div class="media-left">
				<a href="${root}/todo">
					<i class="icon-tasks color-success" ></i>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/todo"><h3 class="media-heading">Todo</h3></a>
		  	 我的todo列表，记录待办事项，包括技能学习等事项的记录
		  </div>
		</div>
		
		<div class="media desktop">
		  <div class="media-left">
				<a href="${root}/blog/23">
					<i class="icon-suitcase color-warning"></i>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/blog/23"><h3 class="media-heading">Item</h3></a>
		  	 闲暇时间开发和整理的开放源代码项目介绍
		  </div>
		</div>
		
		<div class="media desktop">
		  <div class="media-left">
				<a href="${root}/about">
					<i class="icon-user color-danger"></i>
				</a>
		  </div>
		  <div class="media-body">
		    <a href="${root}/about"><h3 class="media-heading">About</h3></a>
		  	 个人信息展示页面，正常情况下，将简历详情隐藏，待到派上用场的时候再设置公开
		  </div>
		</div>
	</div>
	<hr>
	<div class="labelBox">
		<div class="container" >
			<div class="row">
				<div class="col-md-12">
					<label style="padding-bottom: 10px;font-size: 16px;"><span class="icon-cloud"></span>  Tag Cloud</label>
					<br>
					<c:forEach items="${allLabel}" var="label" varStatus="status">
						<a href="${root}/blog/tag/${label.id}" >
							<span class='label label-primary indexLabel'>
								${label.name}
							</span>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="container searchBox">
		<h3 class="title" >Search for blog</h3>
		<div class="row">
			<div class="col-md-3" ></div>
			<div class="col-md-6" >
				<form role="form"  action="${root}/blog">
					<div class="input-group" >
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
		<div class="row countTitle">
			<div class="col-md-12" >
				<span class="title">All Content In Site</span>
				<span>站内发布的所有内容信息量统计</span>
				<div class="icon" ><i class="icon-bar-chart icon-4x"></i></div>
			</div>
		</div>
		<div class="row">
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

	<script type="text/javascript">
	$(document).ready(function () {
		// banner图片描述显示
		$('.bannerInfo').tooltip({
			 placement: 'top',
			 template:'<div class="tooltip" role="tooltip" style="font-size:14px;"><div class="tooltip-arrow"  ></div><div class="tooltip-inner" style="width:400px!important;background-color: #5BC0DE;text-align:left;"></div></div>',
			 delay: { "show": 200, "hide": 200 }
		});
	});
	</script>
</body>
</html>