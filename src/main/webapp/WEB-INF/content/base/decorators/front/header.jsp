<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script src="${root}/theme/js/headroom.js"></script>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
	<c:if test="${isNormal}">
	//向下滚动时将导航隐藏，想上滚动式展示
	// 获取页面元素
	var myElement = document.querySelector(".navbar-fixed-top");
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
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
</c:if>
     <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
		  <a class="navbar-brand" href="${root}/index" title="Hello I'm Ethan."><img style="display: inline;vertical-align: top;" class="img-rounded" src="${root}/theme/images/e-rgb(76, 142, 250).png" width="22px" height="22px" /> ImEthan</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${module eq 'index'}">class="active"</c:if>><a href="${root}/index">Home</a></li>
				<li <c:if test="${module eq 'blog'}">class="active"</c:if>><a href="${root}/blog">Blog</a></li>
				<li <c:if test="${module eq 'todo' || module eq 'todoitem'}">class="active"</c:if>><a href="${root}/todo">Todo</a></li>
				<li <c:if test="${module eq 'contact'}">class="active"</c:if>><a href="${root}/contact">Contact</a></li>
				<li <c:if test="${module eq 'about'}">class="active"</c:if>><a href="${root}/about">About</a></li>
			</ul>
			<!-- 
			<form class="navbar-form navbar-left" role="search" action="${root}/blog">
			  <div class="form-group">
			    <input type="text" class="form-control" name="search_title" placeholder="Search" style="height: 30px;vertical-align: text-top;width: 200px;">
			  </div>
			</form>
			 -->
	        
        	<ul class="nav navbar-nav navbar-right" >
				<li ><a href="https://github.com/ethanwong" target="_blank"><i class="icon-github"></i> GitHub</a></li>
				<shiro:guest>  
					<li>
						<a href="${root}/login" title="Member login" ><i class="icon-signin"></i> Login</a>
					</li>
				</shiro:guest>
				<shiro:user>
					<li>
						<a><i class="icon-user"></i> <shiro:principal/></a>
					</li>
					<li>
						<a href="${root}/setting/profile"><i class="icon-cogs" data-placement="bottom" title="Setting"></i></a>
					</li>
					<li>
						<a href="${root}/login/out"><i class="icon-signout" data-placement="bottom" title="Logout"></i></a>
					</li>
				</shiro:user>
			</ul>
		</div>
	</div>
</nav>
