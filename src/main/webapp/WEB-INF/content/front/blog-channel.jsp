<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
//删除栏目
function deleteChannel(id){
	$('#deleteConfirmModal').modal({
	 	 keyboard: true
	});
	$("#deleteConfirmModalClick").click(function(){
		$.ajax({
			url:"${root}/console/cms/channel/delete/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				//加载角色列表
				showMsg("success",result.message);
				
				setTimeout(function(){
					location.href = "${root}/blog";
				},2000);
			}
		});
	});
};

//更改栏目发布状态
function publishChannel(object,id){
	$.ajax({
		url:"${root}/console/cms/channel/publish/"+id,
		type:"POST",
		dateType:"json",
		success:function(data){
			var result = eval("(" + data + ")");
			showMsg("success",result.message);
			
			var color = $(object).children("span").css("color");
			if(color =="rgb(53, 126, 189)"){
				$(object).children("span").css("color","");
			}else{
				$(object).children("span").css("color","rgb(53, 126, 189)");
			}
		}
	});
};
</script>
<div class="list-group">
	<c:forEach var="channel" items="${channelList}" varStatus="status">
		<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">selected</c:if>">
			<shiro:user>
					<c:if test="${channel.publish eq true}"><span style="color:#357ebd;" class="glyphicon glyphicon-flag"></span></c:if>
					<c:if test="${channel.publish eq false}"><span class="glyphicon glyphicon-flag"></span></c:if>
			</shiro:user>
			${channel.name}
			<span class='badge'>${channel.articleAmount}</span>
		</a>
	</c:forEach>
</div>
<shiro:user>
	<div class="blog-channel-toolbar">
		<a href="${root}/blog/channel/input/${channelId}"><span class="glyphicon glyphicon-edit"></span></a>
		<a href="#" onclick="deleteChannel(${channelId})"><span class="glyphicon glyphicon-trash"></span></a>
		<a href="${root}/blog/channel/input/0"><span class="glyphicon glyphicon-plus"></span></a>
	</div>
</shiro:user>
