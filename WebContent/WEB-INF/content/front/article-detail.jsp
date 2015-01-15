<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<script type="text/javascript">
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
					
					setTimeout(function(){
						location.href = "${root}/blog";
					},2000);
				}
			});
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
		    <div class="col-sm-9">
		    	<font style="font-size:30px;float: left;"><a href="${root}/blog/article/${article.id}">${article.title}</a></font>
		    </div>
		    <div class="col-sm-3" style="padding-right: 14px;" >
		      	<input onchange="searchArticle(this)" name="search_title" value="${search_title}" style="float: right;width: 215px;" type="search" class="form-control" placeholder="Search blog" >
		    </div>
	  </div>
	</form>
	<hr>
	<div class="row">
		<div class="col-md-9" >
			<div class='articleList'>
				<div class='article'>
					<a href="${root}/blog/${article.channelId}"><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>${article.channelName}</strong></small></a>
					&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;<fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/></small>
					
					<shiro:user>
						<div class='blog-article-toolbar'>
							<a href="#" onclick="deleteArticle(${article.id},this)"><span class='glyphicon glyphicon-minus'></span></a>
							<a href="${root}/blog/article/input/${article.channelId}/${article.id}" ><span class='glyphicon glyphicon-pencil'></span></a>
						</div>
					</shiro:user>
					<div class='content'>${article.content}</div>
				</div>
				<jsp:include page="/WEB-INF/content/front/comment-input.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="col-md-3" >
			<jsp:include page="/WEB-INF/content/front/blog-channel.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>