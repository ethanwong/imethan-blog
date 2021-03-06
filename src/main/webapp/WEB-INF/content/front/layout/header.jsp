<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script src="${root}/theme/js/headroom.js"></script>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
	<c:if test="${isNormal}">
	//向下滚动时将导航隐藏，想上滚动式展示
	// 获取页面元素
	var myElement = document.querySelector("#headroom");
	// 创建 Headroom 对象，将页面元素传递进去
	var headroom  = new Headroom(myElement);	
	headroom.init(); // 初始化
	</c:if>
});
</script>
<!-- 移动版的不固定头部处理 -->
<c:if test="${!isNormal}">
	<nav class="navbar navbar-default navbar-static-top " role="navigation">
</c:if>
<c:if test="${isNormal}">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="headroom">
</c:if>
     <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
		  <a style="font-weight: 600;" class="navbar-brand" href="${root}/index" title="Hello I'm Ethan."> ImEthan</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${module eq 'index'}">class="active"</c:if>><a href="${root}/index">Home</a></li>
				<li <c:if test="${module eq 'blog'}">class="active"</c:if>><a href="${root}/blog">Blog</a></li>
				<li <c:if test="${module eq 'todo' || module eq 'todoitem'}">class="active"</c:if>><a href="${root}/todo">Todo</a></li>
				<li <c:if test="${module eq 'contact'}">class="active"</c:if>><a href="${root}/contact">Contact</a></li>
				<li <c:if test="${module eq 'about'}">class="active"</c:if>><a href="${root}/about">About</a></li>
			</ul>
        	<ul class="nav navbar-nav navbar-right" >
				<li><a href="https://github.com/ethanwong" target="_blank"><i class="icon-github"></i> GitHub</a></li>
				<shiro:guest>  
					<li>
						<a href="${root}/login" title="Member login" ><i class="icon-signin"></i> Login</a>
					</li>
				</shiro:guest>
				<shiro:user>
					<li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
			          aria-haspopup="true" aria-expanded="false"> <i class="icon-plus"></i> <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="${root}/blog/article/input/0/0">Publish Article</a></li>
			            <li><a href="${root}/todo/input/0">Add Todo</a></li>
			            <li class="divider"></li>
			            <li><a href="${root}/blog/channel">Channel Manage</a></li>
			            <li><a href="${root}/blog/tag">Tag Manage</a></li>
			            <li class="divider"></li>
			          </ul>
			        </li>
					<li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
			          	aria-haspopup="true" aria-expanded="false">
			          	<i class="icon-user"></i> <shiro:principal/> <span class="caret"></span>
			          </a>
			          <ul class="dropdown-menu">
			            <li><a href="${root}/setting/profile">Profile</a></li>
			            <li><a href="${root}/setting/account">Account</a></li>
			            <li><a href="${root}/setting/about">About</a></li>
			            <li><a href="${root}/setting/main">Main</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="${root}/login/out"><i class="icon-signout"></i> Log out</a></li>
			          </ul>
			        </li>
				</shiro:user>
			</ul>
		</div>
	</div>
</nav>
