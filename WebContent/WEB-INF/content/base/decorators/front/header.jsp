<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
		<!-- Static navbar -->
	<div class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container" >
			<div class="navbar-header">
				<!--           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> -->
				<!--             <span class="sr-only">Toggle navigation</span> -->
				<!--             <span class="icon-bar"></span> -->
				<!--             <span class="icon-bar"></span> -->
				<!--             <span class="icon-bar"></span> -->
				<!--           </button> -->
				<a class="navbar-brand" href="${root}/index"><img class="img-circle" src="${root}/theme/images/20131110-ethan.jpg" alt="" width="26px" height="26px" />  ImEthan</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				
				
					<li <c:if test="${module eq 'index'}">class="active"</c:if>><a href="${root}/index">Home</a></li>
					<li <c:if test="${module eq 'blog'}">class="active"</c:if>><a href="${root}/blog">Blog</a></li>
					<li <c:if test="${module eq 'contact'}">class="active"</c:if>><a href="${root}/contact">Contact</a></li>
					<li <c:if test="${module eq 'about'}">class="active"</c:if>><a href="${root}/about">About</a></li>
<%-- 					<li><a href="${root}/portal">Portal</a></li> --%>
<%-- 					<li><a href="${root}/console">Console</a></li> --%>
					
<!-- 					<li class="dropdown"><a href="#" class="dropdown-toggle" -->
<!-- 						data-toggle="dropdown">Dropdown <b class="caret"></b></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a href="#">Separated link</a></li> -->
<!-- 			                <li class="divider"></li> -->
<!-- 			                <li class="dropdown-header">Nav header</li> -->
<!-- 			                <li><a href="#">Separated link</a></li> -->
<!-- 			                <li><a href="#">One more separated link</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
				</ul>
		         <form class="navbar-form navbar-right" role="search">
					  <div class="form-group">
					    	<input type="text" class="form-control" placeholder="Search" style="width: 260px;height: 30px;">
					  </div>
					  <button type="submit" class="btn btn-default btn-sm" >Submit</button>
				</form>
			</div>
		</div>
	</div>