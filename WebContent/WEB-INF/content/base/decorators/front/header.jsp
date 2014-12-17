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
			<a class="navbar-brand" href="${root}/index"><img style="display: inline;" class="img-circle" src="${root}/theme/images/20131110-ethan.jpg" alt="" width="26px" height="26px" /> ImEthan</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${module eq 'index'}">class="active"</c:if>><a href="${root}/index">Home</a></li>
				<li <c:if test="${module eq 'blog'}">class="active"</c:if>><a href="${root}/blog">Blog</a></li>
				<li <c:if test="${module eq 'contact'}">class="active"</c:if>><a href="${root}/contact">Contact</a></li>
				<li <c:if test="${module eq 'about'}">class="active"</c:if>><a href="${root}/about">About</a></li>
			</ul>
	         <form class="nav navbar-form navbar-right" role="search">
				  <div class="form-group">
				    	<input type="text" class="form-control" placeholder="Search" style="width: 260px;height: 30px;">
				  </div>
				  <button type="submit" class="btn btn-default btn-sm" >Submit</button>
			</form>
		</div>
	</div>
</nav>