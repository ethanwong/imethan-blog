<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
<!--
	$(document).ready(function () {	
	
		
	});
//-->
</script>
<div class="list-group">
	<shiro:user>
		<span class="label label-info" >publish channel</span>
	</shiro:user>
	<c:forEach var="channel" items="${channelList}" varStatus="status">
		<c:if test="${channel.publish eq true}">
			<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">selected</c:if>">
				${channel.name}
				<span class='badge'>${channel.articleAmount}</span>
			</a>
		</c:if>
	</c:forEach>
	
	<shiro:user>
		<br>
		<span class="label label-danger" >hidden channel</span>
		<c:forEach var="channel" items="${channelList}" varStatus="status">
			<c:if test="${channel.publish eq false}">
				<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">selected</c:if>">
					${channel.name}
					<span class='badge'>${channel.articleAmount}</span>
				</a>
			</c:if>
		</c:forEach>
	</shiro:user>
	
	<div class="panel panel-default" style="margin-top: 20px;">
	  	<div class="panel-body" style="padding: 14px;">
	  		<label><span class="icon-tags"></span>  Tag Cloud</label><br>
  			<c:forEach items="${allLabel}" var="label" varStatus="status">
				<a href="${root}/blog/tag/${label.id}" >
					<span class='label label-default channeltaglabel'>
						${label.name}
					</span>
				</a>
				&nbsp;
			</c:forEach>
	  	</div>
	</div>

</div>