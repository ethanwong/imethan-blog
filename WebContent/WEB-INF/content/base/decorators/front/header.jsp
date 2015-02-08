<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
$('.glyphicon-log-in').tooltip();

});
</script>
<nav class="navbar navbar-default navbar-fixed-top " role="navigation">
     <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
			<a class="navbar-brand" href="${root}/index"><img style="display: inline;" class="img-circle" src="${root}/theme/images/20131110-ethan.jpg" alt="" width="26px" height="26px" /> ImEthan</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${module eq 'index'}">class="active"</c:if>><a href="${root}/index">Home</a></li>
				<li <c:if test="${module eq 'blog'}">class="active"</c:if>><a href="${root}/blog">Blog</a></li>
				<li <c:if test="${module eq 'todo' || module eq 'todoitem'}">class="active"</c:if>><a href="${root}/todo">Todo</a></li>
				<li <c:if test="${module eq 'contact'}">class="active"</c:if>><a href="${root}/contact">Contact</a></li>
				<li <c:if test="${module eq 'about'}">class="active"</c:if>><a href="${root}/about">About</a></li>
			</ul>
	        
        	<div class="navbar-right" >
				<shiro:guest>  
					<div class="loginsetting">
						<a href="${root}/login" ><span class="glyphicon glyphicon-log-in" data-placement="bottom" title="Member login"></span></a>
					</div>
				</shiro:guest>
				<shiro:user>  
					<div class="loginsetting">
						<span class="glyphicon glyphicon-user"></span> <shiro:principal/>
						<a href="${root}/setting/profile" ><span class="glyphicon glyphicon-cog"></span></a>
						<a href="${root}/login/out" ><span class="glyphicon glyphicon-log-out"></span></a>
					</div>
				</shiro:user>
			</div>
		</div>
	</div>
</nav>