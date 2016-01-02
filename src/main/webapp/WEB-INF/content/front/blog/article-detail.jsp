<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>${article.title}:ImEthan独立博客:Full Stack Engineer</title>
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
		layer.confirm('确定要删除吗？', {title: false, closeBtn: 0,icon:0,btn: ['确定','关闭']},
			function(){
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
						showMsg("error","删除失败");
					}
				});
			}, function(){layer.close();}
		);
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
	
</script>
</head>
<body>
<div class="container main">
	<div class="row">
		<div class="col-md-9" >
			<div class='articleList'>
				<div class=' article'>
					<span class="detail-title">${article.title}</span>
					<hr>
					<p class="info" >
						<a href="${root}/blog/${article.channelId}"><i class='icon-link'> ${article.channelName}</i></a>
						<i class='icon-calendar'> <fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/></i>
						<c:if test="${article.labels != null && fn:length(article.labels) > 0}">
						<i class="icon-tags">
							<c:forEach items="${article.labels}" var="label" varStatus="stauts">
								<a href='${root}/blog/tag/${label.id}' >${label.name}</a>
								<c:if test="${stauts.last ne true}">,</c:if>
							</c:forEach>
						</i>
						</c:if>

					
						<shiro:user>
							<span class='blog-article-toolbar'>
							  <a href="#" onclick="publishArticle(this,${article.id})">
								 <c:if test="${article.publish eq true}"><i class="icon-star" ></i></c:if>
								 <c:if test="${article.publish eq false}"><i class="icon-star-empty"></i></c:if>
							   </a>
							   <a href="#" onclick="deleteArticle(${article.id},this)"><i class='icon-trash'></i></a>
							   <a href="${root}/blog/article/input/${article.channelId}/${article.id}" ><i class='icon-edit'></i></a>
							</span>
						</shiro:user>
					</p>
					<div class='content'>${article.content}</div>
				</div>
				<hr>
				<nav style="margin: 10px 0px 10px 0px;">
				  <ul class="pager">
					  <c:if test="${article.prev != null}">
					  		<li class="previous"> <a href="${root}/blog/article/${article.prev.id}"><span aria-hidden="true">&larr;</span> ${article.prev.title}</a></li>
					  </c:if>
					  <c:if test="${article.next != null}">
				      		<li class="next"><a href="${root}/blog/article/${article.next.id}">${article.next.title} <span aria-hidden="true">&rarr;</span></a></li>
				  	  </c:if>
				  </ul>
				</nav>
				<jsp:include page="/WEB-INF/content/front/blog/comment-input.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="col-md-3" >
			<jsp:include page="/WEB-INF/content/front/blog/blog-channel.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>