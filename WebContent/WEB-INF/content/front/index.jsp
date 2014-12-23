<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
		//加载用户信息
		loadUserInfo("imethan");
		
		//加载第一页文章
// 		loadPageOneArticle();
		
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
	
	//加载用户信息
	function loadUserInfo(username){
		$.ajax({
			url:"${root}/userinfo/getUserInfoByUsername/"+username,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				var avatar = "default-avatar-ethan.jpg";
				if(result.avatar!=null && result.avatar!=''){
					avatar = result.avatar;
				};
				$(".userinfo").find(".img-thumbnail").attr("src","${root}/upload/avatar/"+avatar);
				$(".userinfo").find(".nickname").html(result.nickname);
				$(".userinfo").find(".locate").html(result.locate);
				var email = "<a href='mailto:"+result.email+"'>"+result.email+"</a>"
				$(".userinfo").find(".email").html(email);
				$(".userinfo").find(".phone").html(result.phone);
			}
		});
	};
	
	//加载第一页文章
	function loadPageOneArticle(){
		$.ajax({
			url:"${root}/index/article/1",
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				generateArticle(result);
			}
		});
	};
	
	//加载文章信息
	function generateArticle(json){
		$.each(json, function(i, item) {
			var article = ""+
			"<div class='article'>"+
			"<h3 class='title'>"+
			"<a href='${root}/blog/article/"+item.id+"'>"+
				item.title+
			"</a>"+
			"</h3>"+
			"<hr>"+
			"<a href='${root}/blog/"+item.channelId+"'><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>"+item.channelName+"</strong></small></a>"+
			"&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;"+item.createTime+"</small>"+
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
	}

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3">
			<div class="userinfo">
				<p style="line-height: 36px;">
						<img class="img-thumbnail" src="${root}/upload/avatar/default-avatar-ethan.jpg" alt="${userInfo.nickname}" style="width: 180px;height: 180px;" >
<%-- 					<c:if test="${userInfo.avatar == null || userInfo.avatar == ''}"> --%>
<%-- 						<img class="img-thumbnail" src="${root}/upload/avatar/default-avatar-ethan.jpg" alt="${userInfo.nickname}" style="width: 180px;height: 180px;" > --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${userInfo.avatar != null && userInfo.avatar != ''}"> --%>
<%-- 						<img class="img-thumbnail" src="${root}/upload/avatar/${userInfo.avatar}" alt="${userInfo.nickname}" style="width: 180px;height: 180px;" > --%>
<%-- 					</c:if> --%>
				</p>
				<font size="4" class='nickname'>${userInfo.nickname}</font>
				<hr>
				<address style="line-height: 36px;">
					<span class="glyphicon glyphicon-map-marker"></span>&nbsp;<span class="locate">${userInfo.locate}</span><br>
					<span class='glyphicon glyphicon-phone'></span>&nbsp;<span class="phone">${userInfo.phone}</span><br>
					<span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="email"><a href="mailto:${userInfo.email}">${userInfo.email}</a></span>
				</address>
			</div>
			<div class="tag">
				<strong>Tag</strong>
				<hr>
				<p style="line-height: 30px;">
					<span class="label label-default">Default</span>
					<span class="label label-primary">Primary</span>
					<span class="label label-success">Success</span>
					<span class="label label-info">Info</span>
					<span class="label label-warning">Warning</span>
					<span class="label label-danger" >Danger</span>
				</p>
			</div>
		</div>
		
		<div class="col-md-9" >
			<div class="articleList">
				<c:if test="${articleList == null || fn:length(articleList) == 0}">
					暂时没有内容
				</c:if>
				<c:forEach var="article" items="${articleList}" varStatus="status">
					<div class='article'>
						<h3 class='title'><a href="${root}/blog/article/${article.id}">${article.title}</a></h3>
						<hr>
						<a href="${root}/blog/${article.channelId}"><span class='glyphicon glyphicon-link'></span> <small class='channel'><strong>${article.channelName}</strong></small></a>
						&nbsp;&nbsp;<span class='glyphicon glyphicon-calendar'></span><small>&nbsp;<fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/></small>
						<div class='content'>${article.content}</div>
					</div>
				</c:forEach>
				
			</div>
			
			<div id="navigation" align="center">
        		<a href="${root}/index/article/2"></a>  
   			 </div>
   			
		</div>
	</div>
	
<%-- 	<script src="${root}/theme/js/jquery.pin.js"></script> --%>
<!-- 	<script type="text/javascript"> -->
<!-- // 		$(".rightBox").pin({ -->
<!-- // 		      containerSelector: ".row" -->
<!-- // 		}); -->
<!-- 	</script> -->
</body>
</html>