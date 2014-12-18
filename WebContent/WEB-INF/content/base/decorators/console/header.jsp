<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
     <div class="container">
        <div class="navbar-header">
          	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
			<a class="navbar-brand" href="${root}/console/home"><img style="display: inline;" class="img-circle" src="${root}/theme/images/20131110-ethan.jpg" alt="" width="26px" height="26px" />  ImEthan</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="${root}/console/home">Home</a></li>
					<shiro:hasRole name="系统管理员">  
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Cms<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${root}/console/cms/channel">Channel</a></li>
								<li><a href="${root}/console/cms/article">Article</a></li>
							</ul>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Security<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${root}/console/security/user">User</a></li>
								<li><a href="${root}/console/security/role">Role</a></li>
								<li><a href="${root}/console/security/resource">Resource</a></li>
							</ul>
						</li>
					</shiro:hasRole>
				</ul>
				<div class="navbar-form navbar-right" >
					<shiro:guest>  
						<a type="submit" class="btn btn-default btn-sm" href="${root}/console/toSignin">Sign in</a>
					</shiro:guest>
					<shiro:user>  
						<span>Hello,<shiro:principal/>  </span>
						<a type="submit" class="btn btn-default btn-sm" href="${root}/console/signout">Sign out</a>
					</shiro:user>
				</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>