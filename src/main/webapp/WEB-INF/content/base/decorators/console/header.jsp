<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
     <div class="container">
	        <div class="navbar-header">
	 			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
	          	</button>
	          	<a class="navbar-brand" href="${root}/console/home"><img style="display: inline;" class="img-circle" src="${root}/theme/images/e-rgb(76, 142, 250).png" alt="" width="26px" height="26px" /> ImEthan Console</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<shiro:hasRole name="系统管理员">  
						<li><a href="${root}/console/home">Home</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Security<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${root}/console/security/user">User</a></li>
								<li><a href="${root}/console/security/role">Role</a></li>
								<li><a href="${root}/console/security/resource">Resource</a></li>
							</ul>
						</li>
						<li><a href="${root}/console/setting">Setting</a></li>
					</shiro:hasRole>
				</ul>
				<ul class="nav navbar-nav navbar-right" >
					<shiro:guest>  
						<li>
							<a href="${root}/console/toSignin" ><span class="glyphicon glyphicon-log-in"></span></a>
						</li>
					</shiro:guest>
					<shiro:user>  
						<li>
							<a><span class="glyphicon glyphicon-user"></span> Hello,<shiro:principal/></a>
						</li>
						<li>
							<a href="${root}/console/signout" ><span class="glyphicon glyphicon-log-out"></span></a>
						</li>
					</shiro:user>
				</ul>
			</div>
		</div>
	</nav>