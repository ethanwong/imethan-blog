<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<div class="form-group">
	<form class="form-horizontal searchform" role="form"  action="${root}/blog">
		<input type="search" name="search_title" value="${search_title}" 
		 class="form-control" placeholder="Search blog" />
<!-- 		<button class="button button-primary button-small">Submit</button> -->
	</form>
</div>

<div class="list-group">
	<shiro:user>
		<span class="label label-primary" >publish channel</span>
	</shiro:user>
	<c:forEach var="channel" items="${channelList}" varStatus="status">
		<c:if test="${channel.publish eq true}">
			<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">selected</c:if>">
				${channel.name}
				<span class='badge' style="border-radius:10px !important;">${channel.articleAmount}</span>
			</a>
		</c:if>
	</c:forEach>
</div>

<shiro:user>
	<span class="label label-warning" >hidden channel</span>
	<div class="list-group">
		<c:forEach var="channel" items="${channelList}" varStatus="status">
			<c:if test="${channel.publish eq false}">
				<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">selected</c:if>">
					${channel.name}
					<span class='badge' style="border-radius:10px !important;">${channel.articleAmount}</span>
				</a>
			</c:if>
		</c:forEach>
	</div>
</shiro:user>
	
<div class="panel panel-default" >
  	<div class="panel-body">
  		<label><span class="icon-tags"></span>  Tag Cloud</label><br>
 			<c:forEach items="${allLabel}" var="label" varStatus="status">
			<a href="${root}/blog/tag/${label.id}" >
				<span class='label label-default channeltaglabel'>
					${label.name}
				</span>
			</a>
		</c:forEach>
  	</div>
</div>

