<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
		//加载第一页文章
		loadPageOneArticle();
		
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
				item.title+
//					"<small>  "+item.createTime+"</small>"+
//				"<span class='label label-default'>"+item.channelName+"</span>"+
			"</h3>"+
			"<hr width='698px;' size='2' style='padding: 0;margin:0;margin-bottom: 10px;'>"+
			"<small class='channel'><strong>"+item.channelName+"</strong></small>"+
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
<!-- 	<div class="jumbotron" style="padding: 30px;"> -->
<!-- 	  <h2>Hello, world!</h2> -->
<!-- 	  <p style="font-size: 14px;">在2006年某一天就下定决心要做一个属于自己的网站，在进入IT行业摸爬滚打3年后的今天，"imethan"的上线填补了个人的这个空缺，希望接下来的日子里能好好的开发以及维护，也将其作为一个职业技能训练和巩固的平台。</p> -->
<!-- 	  <p><a class="btn btn-primary" role="button">About more</a></p> -->
<!-- 	</div> -->
	<div class="row">
		<div class="col-md-3">
			<div class="userinfo">
				<p>
					<img class="img-thumbnail" src="${root}/theme/images/pic.jpg" alt="www.imethan.cn" width="180px" height="180px" >
				</p>
				<font size="4">Ethan Wong</font>
				<hr width='200px;' size='2' style='margin-top: 4px;margin-bottom: 4px;margin-left: 0px;'/>
				<p style="line-height: 30px;">
					<address>
					  <strong>Locate</strong><br>
					  XiaMen.China<br>
					</address>
					<address>
					  <strong>Email</strong><br>
					  <a href="mailto:#">ethanwong@qq.com</a>
					</address>
					<address>
					  <strong>Job</strong><br>
					  A developer!<br>
					</address>
				</p>
				<strong>Tag</strong>
				<hr width='200px;' size='2' style='margin-top: 4px;margin-bottom: 4px;margin-left: 0px;'>
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