<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan:Blog</title>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
	//更多内容
	$('.content').readmore({
		  speed: 1000,
		  maxHeight: 200,
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
		
		var article = ""+
		"<div class='article' >"+
		"<h3 class='title'>"+
		"<a href='${root}/blog/article/"+item.id+"'>"+
			item.title+
		"</a>"+
		"</h3>"+
		"<a href='${root}/blog/"+item.channelId+"'><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>"+item.channelName+"</strong></small></a>"+
		"&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;"+item.createTime+"</small>"+
		"<shiro:user>&nbsp;&nbsp;"+titleIco+"</shiro:user>"+
		"<shiro:user>"+
		"<div class='blog-article-toolbar'>"+
		"	<a id='article"+item.id+"' href='#' onclick='deleteArticle("+item.id+",this)'><span class='glyphicon glyphicon-minus'></span></a>"+
		"	<a href='${root}/blog/article/input/"+item.channelId+"/"+item.id+"' ><span class='glyphicon glyphicon-pencil'></span></a>"+
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
	$('#deleteConfirmModal').modal({
	 	 keyboard: true
	});
	$("#deleteConfirmModalClick").click(function(){
		$.ajax({
			url:"${root}/console/cms/article/delete/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				showMsg("success",result.message);
				
				$(object).parent().parent().remove();
			}
		});
	});
};

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

//更改文章发布状态
function publishArticle(object,id){
	$.ajax({
		url:"${root}/console/cms/article/publish/"+id,
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
	<form class="form-horizontal" role="form">
	  <div class="form-group">
		    <div class="col-sm-8">
		    	<font style="font-size:30px;float: left;">Blog</font>
		    	<shiro:user>
		    		<a style="padding-top:12px;padding-left: 20px;margin:0px;float: left;" href="${root}/blog/article/input/${channelId}/0"><span class="glyphicon glyphicon-plus"></span></a>
		    	</shiro:user>
		    </div>
		    <div class="col-sm-4" style="padding-right: 14px;" >
		      	<input onchange="searchArticle(this)" name="search_title" value="${search_title}" style="float: right;width: 215px;" type="search" class="form-control" placeholder="Search blog" >
		    </div>
	  </div>
	</form>
	<hr>
	<div class="row">
		<div class="col-md-9" >
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
						<shiro:user>
								&nbsp;<a href="#" onclick="publishArticle(this,${article.id})"><c:if test="${article.publish eq true}"><span style="color:#357ebd;" class="glyphicon glyphicon-flag" ></span></c:if>
								<c:if test="${article.publish eq false}"><span class="glyphicon glyphicon-flag" ></span></c:if></a>
						</shiro:user>
						<shiro:user>
							<div class='blog-article-toolbar'>
								<a href="#" onclick="deleteArticle(${article.id},this)"><span class='glyphicon glyphicon-minus'></span></a>
								<a href="${root}/blog/article/input/${article.channelId}/${article.id}" ><span class='glyphicon glyphicon-pencil'></span></a>
							</div>
						</shiro:user>
						<div class='content'>${article.content}</div>
					</div>
				</c:forEach>
			</div>
			
			<div id="navigation" align="center">
				
        		<a href="${root}/blog/article/${channelId}/2<c:if test="${search_title !=null}">?search_title=${search_title}</c:if>"></a>  
   			</div>
		</div>
		
		<div class="col-md-3">
			<div class="list-group">
				<c:forEach var="channel" items="${channelList}" varStatus="status">
					<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">selected</c:if>">
						<shiro:user>
<%-- 							<a href="#" onclick="publishChannel(this,${channel.id})"> --%>
								<c:if test="${channel.publish eq true}"><span style="color:#357ebd;" class="glyphicon glyphicon-flag"></span></c:if>
								<c:if test="${channel.publish eq false}"><span class="glyphicon glyphicon-flag"></span></c:if>
<!-- 							</a> -->
						</shiro:user>
						${channel.name}
						<span class='badge'>${channel.articleAmount}</span>
					</a>
				</c:forEach>
			</div>
			<shiro:user>
				<div class="blog-channel-toolbar">
					<a href="${root}/blog/channel/input/${channelId}"><span class="glyphicon glyphicon-pencil"></span></a>
					<a href="#" onclick="deleteChannel(${channelId})"><span class="glyphicon glyphicon-minus"></span></a>
					<a href="${root}/blog/channel/input/0"><span class="glyphicon glyphicon-plus"></span></a>
				</div>
			</shiro:user>
		</div>
		
	</div>
</body>
</html>