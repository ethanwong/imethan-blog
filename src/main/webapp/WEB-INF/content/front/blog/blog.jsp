<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Blog:ImEthan独立博客:Full Stack Engineer</title>
<script type="text/javascript"  src="${root}/theme/ueditor1_4_3_1-utf8-jsp/ueditor.parse.js"> </script>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
	//代码展现
    uParse('.content',{
        rootPath : '${root}/theme/ueditor1_4_3_1-utf8-jsp/',
        chartContainerHeight:500
    });
	
	//更多内容
	$('.content').readmore({
		  speed: 2000,
		  maxHeight: 110,
		  moreLink:"<a href='#'>Read More</a>",
		  lessLink:"<a href='#'>Close More</a>"
	});
	
	//滚动加载文章
	$(".articleList").infinitescroll({  
        navSelector: "#navigation",
        nextSelector: "#navigation a",  
        itemSelector: ".articleList" , 
        loading:{
            finishedMsg: '没有更多内容了...',//结束显示信息
            msgText: "正在加载内容...",
            img: '${root}/theme/images/ajax-loader.gif'//loading图片
        },
        dataType: 'json',
        appendCallback: false,
        animate: true,  
        maxPage: 100,
        extraScrollPx: 50,  
		template: function(data) {
            return data;
        }
    }, 
    function(data,opt) {
    	generateArticle(data);
     });
	
});

//加载文章信息
function generateArticle(json){
	$.each(json, function(i, item) {
		var publish = item.publish;
		var titleIco = "";
		if(publish == "true"){
			titleIco = "<a href='#' onclick='publishArticle(this,"+item.id+")'><i class='icon-star' ></i></a>";
		}else{
			titleIco = "<a href='#' onclick='publishArticle(this,"+item.id+")'><i class='icon-star-empty'></i></a>";
		}
		
		var labels = "";
		
		var length = item.labels.length;
		if(length >0 ){
			labels = "<i class='icon-tags'> ";
			$.each(item.labels, function(j, label) {
				labels += "<a href='${root}/blog/tag/"+label.id+"' >"+label.name+"</a>";
				if(length != (j+1)){
					labels += ",";
				}
			})
			labels += "</i>";
		}
		
		var article = ""+
		"<div class='article'>"+
			"<p class='title'>"+"<a href='${root}/blog/article/"+item.id+"'>"+item.title+"</a>"+"</p>"+
			"<p class='info'>"+
				"<a href='${root}/blog/"+item.channelId+"'><i class='icon-link'> "+item.channelName+"</i></a>"+
				"<i class='icon-calendar'> "+item.createTime+"</i>"+labels+
				"<shiro:user>"+
					"<span class='blog-article-toolbar'>"+
						titleIco+
						"<a id='article"+item.id+"' href='#' onclick='deleteArticle("+item.id+",this)'><i class='icon-trash'></i></a>"+
						"<a href='${root}/blog/article/input/"+item.channelId+"/"+item.id+"' ><i  class='icon-edit'></i></a>"+
					"</span>"+
				"</shiro:user>"+
			"</p>"+
			"<div class='content'>"+item.content+"</div>"+
		"</div>";
		
		$(".articleList").append(article);
		
		$('.content').readmore({
			  speed: 1000,
			  maxHeight: 200,
			  moreLink:"<a href='#'>Read More</a>",
			  lessLink:"<a href='#'>Close More</a>"
		});
		
	});
};

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
					$(object).parent().parent().parent().remove();
					showMsg("success",result.message);
				},
				error:function(){
					showMsg("error","删除失败");
				}
			});
		}, function(){
		layer.close();
	});
	
// 	setDeleteModal().bind('click',function(){
// 		$.ajax({
// 			url:"${root}/cms/article/delete/"+id,
// 			type:"POST",
// 			dateType:"json",
// 			success:function(data){
// 				var result = eval("(" + data + ")");
// 				showMsg("success",result.message);
				
// 				$(object).parent().parent().parent().remove();
// 			},
// 			error:function(){
// 				showError("删除失败");	
// 			}
// 		});
// 	});
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
		<!-- 移动版显示 -->
		<c:if test="${!isNormal}">
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/content/front/blog/blog-channel.jsp"></jsp:include>
			</div>
		</c:if>
		
		<!-- BLOG内容 -->
		<div class="col-md-9" >
			<span class="main-title">My Blog</span>
	    	<small class="main-second-title">我的工作和学习笔记</small>
	    	<shiro:user>
	    		<a title="管理栏目" class="blog-manage-button" href="${root}/blog/channel"><span class="icon-list-alt"></span> 栏目管理</a>
	    		<a title="管理标签" class="blog-manage-button" href="${root}/blog/tag"><span class="icon-tags"></span> 标签管理</a>
	    		<a title="发布文章" class="blog-manage-button" href="${root}/blog/article/input/${channelId}/0"><span class="icon-plus"></span> 发布文章</a>
	    	</shiro:user>
	    	<hr>
		    	
			<!-- 默认加载 -->
			<div class="articleList">
				<c:if test="${articleList == null || fn:length(articleList) == 0}">
					暂时没有内容
				</c:if>
				<c:forEach var="article" items="${articleList}" varStatus="status">
					<div class='article'>
						<p class='title'>
							<a href='${root}/blog/article/${article.id}'>${article.title}</a>
						</p>
						<p class="info">
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
								  <a href="javescript:;" onclick="publishArticle(this,${article.id})">
									 <c:if test="${article.publish eq true}"><i class="icon-star" ></i></c:if>
									 <c:if test="${article.publish eq false}"><i class="icon-star-empty"></i></c:if>
								   </a>
								   <a href="javescript:;" onclick="deleteArticle(${article.id},this)"><i class='icon-trash'></i></a>
								   <a href="${root}/blog/article/input/${article.channelId}/${article.id}" ><i class='icon-edit'></i></a>
								</span>
							</shiro:user>
						</p>
						<div class='content'>${article.content}</div>
					</div>
				</c:forEach>
			</div>
			<!-- 加载更多 -->
			<div id="navigation" align="center">
        		<a href="${root}/blog/article/${channelId}/${labelId}/2<c:if test="${search_title !=null}">?search_title=${search_title}</c:if>">
        		</a>  
   			</div>
		</div>
		
		<!-- 电脑版显示 -->
		<c:if test="${isNormal}">
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/content/front/blog/blog-channel.jsp"></jsp:include>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>