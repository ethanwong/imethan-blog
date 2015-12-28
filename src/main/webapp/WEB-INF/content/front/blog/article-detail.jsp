<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>${article.title}|ImEthan|Full Stack Engineer</title>
<meta name="keywords" content="${article.title},EthanWong,ethanwong,黄应锋,ImEthan">
<meta name="description" content="${article.title},EthanWong,ethanwong,黄应锋,ImEthan">

<script type="text/javascript"  src="${root}/theme/ueditor1_4_3_1-utf8-jsp/ueditor.parse.js"> </script>

<script type="text/javascript">

	$(document).ready(function () {
        uParse('.content',{
            rootPath : '${root}/theme/ueditor1_4_3_1-utf8-jsp/',
            chartContainerHeight:500
        })
	});
	

	//删除文章
	function deleteArticle(id,object){
		setDeleteModal().bind('click',function(){
			$.ajax({
				url:"${root}/cms/article/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					showMsg("success",result.message);
					
					var url = "${root}/blog";
					<c:if test="${channelId ne null}">
						url = "${root}/blog/${channelId}";
					</c:if>
					setTimeout(function(){
						location.href = url;
					},1500);
				},
				error:function(){
					showError("删除失败");	
				}
			});
		});
	};
	
	//更改文章发布状态
	function publishArticle(object,id){
		$.ajax({
			url:"${root}/cms/article/publish/"+id,
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
	
	//查询文章信息
	function searchArticle(object){
		var search_title = $(object).val();
		console.log("search_title:"+search_title);
		
		location.href = "${root}/blog?search_title="+search_title;

	};
</script>
</head>
<body>

  <div class="row" <c:if test="${isNormal}">style="padding-top: 16px;"</c:if>>
    <div class="col-sm-9">
    	<a style="font-size:24px;float: left;color: #4183c4;" href="${root}/blog/article/${article.id}">${article.title}</a>
    </div>
    <div class="col-sm-3" >
	    <c:if test="${isNormal}">
	    	<form class="form-horizontal " role="form" >
	      	<input onchange="searchArticle(this)" name="search_title" value="${search_title}" style="float: right;" type="search" class="form-control" placeholder="Search blog" >
	   		 </form>
	    </c:if>
	   
    </div>
  </div>
	
	<hr >
	<div class="row">
		<div class="col-md-9" >
			<div class='articleList'>
				<div class='article'>
					<a href="${root}/blog/${article.channelId}"><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>${article.channelName}</strong></small></a>
					&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;<fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/></small>
					&nbsp;&nbsp;
					<c:forEach items="${article.labels}" var="label">
						<a href='${root}/blog/tag/${label.id}' ><span class="label label-default" style="padding: 0.1em;">${label.name}</span></a>
					</c:forEach>
					<shiro:user>
						<div class='blog-article-toolbar'>
							<a href="javascript:;" onclick="publishArticle(this,${article.id})">
								 <c:if test="${article.publish eq true}"><span style="color:#357ebd;" class="glyphicon glyphicon-flag" ></span></c:if>
								 <c:if test="${article.publish eq false}"><span class="glyphicon glyphicon-flag" ></span></c:if>
							   </a>
							<a href="#" onclick="deleteArticle(${article.id},this)"><span class='glyphicon glyphicon-trash'></span></a>
							<a href="${root}/blog/article/input/${article.channelId}/${article.id}" ><span class='glyphicon glyphicon-edit'></span></a>
						</div>
					</shiro:user>
					<div class='content'>${article.content}</div>
				</div>
				<jsp:include page="/WEB-INF/content/front/blog/comment-input.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="col-md-3" >
			<jsp:include page="/WEB-INF/content/front/blog/blog-channel.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>