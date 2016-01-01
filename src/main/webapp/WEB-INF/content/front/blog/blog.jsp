<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Blog|ImEthan|Full Stack Engineer</title>
<script type="text/javascript"  src="${root}/theme/ueditor1_4_3_1-utf8-jsp/ueditor.parse.js"> </script>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
	
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
//         debug        : true,  
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
			titleIco = "<a href='#' onclick='publishArticle(this,"+item.id+")'><span style='color:#357ebd;' class='glyphicon glyphicon-flag'></span></a>";
		}else{
			titleIco = "<a href='#' onclick='publishArticle(this,"+item.id+")'><span class='glyphicon glyphicon-flag'></span></a>";
		}
		
		var labels = " ";
		$.each(item.labels, function(j, label) {
			labels += "<a href='${root}/blog/tag/"+label.id+"' ><span class='label label-default' style='padding: 0.1em;'>"+label.name+"</span></a>  "
		})
		
		var article = ""+
		"<div class='article' >"+
		"<h3 class='title'>"+
		"<a href='${root}/blog/article/"+item.id+"'>"+
			item.title+
		"</a>"+
		"</h3>"+
		"<a href='${root}/blog/"+item.channelId+"'><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>"+item.channelName+"</strong></small></a>"+
		"&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;"+item.createTime+"</small>"+
		"&nbsp;&nbsp;"+labels+
		"<shiro:user>"+
		"<div class='blog-article-toolbar'>"+
		"<shiro:user>&nbsp;&nbsp;"+titleIco+"</shiro:user>"+
		"	<a id='article"+item.id+"' href='#' onclick='deleteArticle("+item.id+",this)'><span  class='glyphicon glyphicon-trash'></span></a>"+
		"	<a href='${root}/blog/article/input/"+item.channelId+"/"+item.id+"' ><span  class='glyphicon glyphicon-edit'></span></a>"+
		"</div>"+
		"</shiro:user>"+
		
		"<div class='content'>"+
		item.content+
		"</div>"+
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
	
	setDeleteModal().bind('click',function(){
		$.ajax({
			url:"${root}/cms/article/delete/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				showMsg("success",result.message);
				$(object).parent().parent().remove();
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
	location.href = "${root}/blog?search_title="+search_title;
};
</script>
</head>
<body>
  <div class="row">
	    <div class="col-sm-9">
	    	<font style="font-size:30px;float: left;">All Blog</font>
	    	<small style="float: left;padding-top: 20px;padding-left: 10px;">我的工作和学习笔记</small>
	    	<shiro:user>
	    		<a title="管理栏目" class="manageButton" href="${root}/blog/channel"><span class="glyphicon glyphicon-list-alt"></span> 栏目管理</a>
	    		<a title="管理标签" class="manageButton" href="${root}/blog/tag"><span class="glyphicon glyphicon-tags"></span> 标签管理</a>
	    		<a title="发布文章" class="manageButton" href="${root}/blog/article/input/${channelId}/0"><span class="glyphicon glyphicon-plus"></span> 发布文章</a>
	    	</shiro:user>
	    </div>
	    <div class="col-sm-3" >
	    	<c:if test="${isNormal}">
	    		<form class="form-horizontal searchform" role="form" >
	    			<input onchange="searchArticle(this)" name="search_title" value="${search_title}" 
	      	 		type="search" class="form-control" placeholder="Search blog" />
	      	 	</form>
	    	</c:if>
	    </div>
  </div>
	
	<hr class="modelhr">
	<div class="row">
		<!-- 移动版显示 -->
		<c:if test="${!isNormal}">
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/content/front/blog/blog-channel.jsp"></jsp:include>
			</div>
		</c:if>
		
		<!-- BLOG内容 -->
		<div class="col-md-9" >
			<!-- 默认加载 -->
			<div class="articleList">
				<c:if test="${articleList == null || fn:length(articleList) == 0}">
					暂时没有内容
				</c:if>
				<c:forEach var="article" items="${articleList}" varStatus="status">
					<div class='article'>
						<h3 class='title'>
							<a href='${root}/blog/article/${article.id}'>${article.title}</a>
						</h3>
						<a href="${root}/blog/${article.channelId}"><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>${article.channelName}</strong></small></a>
						&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;<fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/></small>
						&nbsp;&nbsp;
						<c:forEach items="${article.labels}" var="label">
							<a href='${root}/blog/tag/${label.id}' ><span class="label label-default" style="padding: 0.2em;">${label.name}</span></a>
						</c:forEach>
						
						<shiro:user>
						<div class='blog-article-toolbar'>
							  <a href="javascript:;" onclick="publishArticle(this,${article.id})">
								 <c:if test="${article.publish eq true}"><span style="color:#357ebd;" class="glyphicon glyphicon-flag" ></span></c:if>
								 <c:if test="${article.publish eq false}"><span class="glyphicon glyphicon-flag" ></span></c:if>
							   </a>
								<a href="javascript:;" onclick="deleteArticle(${article.id},this)"><span  class='glyphicon glyphicon-trash'></span></a>
								<a href="${root}/blog/article/input/${article.channelId}/${article.id}" ><span  class='glyphicon glyphicon-edit'></span></a>
							</div>
						</shiro:user>
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
</body>
</html>