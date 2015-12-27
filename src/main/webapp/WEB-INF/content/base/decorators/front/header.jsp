<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
// $('.glyphicon-log-in').tooltip();
// $('.glyphicon-cog').tooltip();
// $('.glyphicon-log-out').tooltip();
});
</script>

	<!-- 移动版的不固定头部处理 -->
	<c:if test="${!isNormal}">
		<nav class="navbar navbar-default  navbar-static-top " role="navigation">
	</c:if>
	<c:if test="${isNormal}">
		<nav class="navbar navbar-default  navbar-fixed-top " role="navigation">
	</c:if>
     <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
		  <a class="navbar-brand" href="${root}/index"><img style="display: inline;" class="img-circle" src="${root}/theme/images/e-rgb(76, 142, 250).png" alt="" width="26px" height="26px" /> ImEthan</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${module eq 'index'}">class="active"</c:if>><a href="${root}/index">Home</a></li>
				<li <c:if test="${module eq 'blog'}">class="active"</c:if>><a href="${root}/blog">Blog</a></li>
				<li <c:if test="${module eq 'todo' || module eq 'todoitem'}">class="active"</c:if>><a href="${root}/todo">Todo</a></li>
				<li <c:if test="${module eq 'contact'}">class="active"</c:if>><a href="${root}/contact">Contact</a></li>
				<li ><a href="https://github.com/ethanwong" target="_blank">GitHub</a></li>
				<li <c:if test="${module eq 'about'}">class="active"</c:if>><a href="${root}/about">About</a></li>
			</ul>
	        
        	<ul class="nav navbar-nav navbar-right" >
				<shiro:guest>  
					<li>
						<!-- <span class="glyphicon glyphicon-log-in" data-placement="bottom" title="Member login"></span> -->
						<a href="${root}/login" title="Member login" > Login</a>
					</li>
				</shiro:guest>
				
				<shiro:user>
					<li>
						<a><span class="glyphicon glyphicon-user"></span> <shiro:principal/></a>
					</li>
					<li>
						<a href="${root}/setting/profile"><span class="glyphicon glyphicon-cog" data-placement="bottom" title="Setting"></span></a>
					</li>
					<li>
						<a href="${root}/login/out"><span class="glyphicon glyphicon-log-out" data-placement="bottom" title="Logout"></span></a>
					</li>
				</shiro:user>
			</ul>
		</div>
	</div>
</nav>