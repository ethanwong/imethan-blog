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
            debug        : true,  
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
			var article = ""+
			"<div class='article'>"+
			"<h3 class='title'>"+
				item.title+
//					"<small>  "+item.createTime+"</small>"+
//				"<span class='label label-default'>"+item.channelName+"</span>"+
			"</h3>"+
			"<hr width='698px;' size='2' style='padding: 0;margin:0;margin-bottom: 10px;'>"+
			"<a href='${root}/blog/"+item.channelId+"'><small class='channel'><strong>"+item.channelName+"</strong></small></a>"+
			"<small>&nbsp;&nbsp;"+item.createTime+"</small>"+
			"<div class='content'>"+
			item.content+
			"</div>"+
//				"<small><span class='label label-info'>"+item.channelName+"</span></small>"+
			"</div>";
			
			$(".articleList").append(article);
			
			$('.content').readmore({
				  speed: 1000,
				  maxHeight: 200,
				  moreLink:"<a href='#'>Read More</a>",
				  lessLink:"<a href='#'>Close More</a>"
			});
		});
	}

</script>
</head>
<body>
	<div class="row">
		<form class="form-horizontal" role="form">
		  <div class="form-group">
		    <label class="col-sm-8 control-label" style="margin: 0px;padding-top: 0px;padding-bottom: 0px;"><h2 style="padding-left: 20px;margin:0px;float: left;">Blog</h2></label>
		    <div class="col-sm-4" style="float: right;margin: 0px;">
		      <input type="text" class="form-control" placeholder="Search" style="width: 300px;">
		    </div>
		  </div>
		</form>
		<div class="col-md-3">
			<div class="list-group">
				<c:forEach var="channel" items="${channelList}" varStatus="status">
					<a href="${root}/blog/${channel.id}" class="list-group-item <c:if test="${channelId eq channel.id }">active</c:if>">${channel.name}<span class='badge'>${channel.articleAmount}</span></a>
				</c:forEach>
				
			</div>
		</div>
		
		<div class="col-md-9" >
			<div class="articleList">
				<c:forEach var="article" items="${articleList}" varStatus="status">
					<div class='article'>
						<h3 class='title'>${article.title}</h3>
						<hr width='698px;' size='2' style='padding: 0;margin:0;margin-bottom: 10px;'>
						<a href="${root}/blog/${article.channelId}"><small class='channel'><strong>${article.channelName}</strong></small></a>
						<small>&nbsp;&nbsp;${article.createTime}</small>
						<div class='content'>${article.content}</div>
					</div>
				</c:forEach>
			</div>
			
			<div id="navigation" align="center">
        		<a href="${root}/blog/article/${channelId}/2"></a>  
   			</div>
		</div>
	</div>
</body>
</html>