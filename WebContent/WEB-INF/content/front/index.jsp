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
		reloadArticle();
		
// 		$("#rightBox").pin();
		

	});
	
	function reloadArticle(){
		$.ajax({
			url:"${root}/index/article/1",
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				$.each(result, function(i, item) {
					var article = ""+
					"<h3 class='title'>"+
						item.title+
// 						"<small>  "+item.createTime+"</small>"+
// 					"<span class='label label-default'>"+item.channelName+"</span>"+
					"</h3>"+
					"<hr width='698px;' size='2' style='padding: 0;margin:0;margin-bottom: 10px;'>"+
					"<small><span class='label label-primary'>"+item.channelName+"</span></small>"+
					"<small>&nbsp;&nbsp;"+item.createTime+"</small>"+
					"<p class='content'>"+
					item.content+
					"</p>"+
// 					"<small><span class='label label-info'>"+item.channelName+"</span></small>"+
					"";
					$("#article").append(article);
				});
			}
		});
	};

</script>
</head>
<body>
<!-- 	<div class="jumbotron" style="padding: 30px;"> -->
<!-- 	  <h2>Hello, world!</h2> -->
<!-- 	  <p style="font-size: 14px;">在2006年某一天就下定决心要做一个属于自己的网站，在进入IT行业摸爬滚打3年后的今天，"imethan"的上线填补了个人的这个空缺，希望接下来的日子里能好好的开发以及维护，也将其作为一个职业技能训练和巩固的平台。</p> -->
<!-- 	  <p><a class="btn btn-primary" role="button">About more</a></p> -->
<!-- 	</div> -->
	<div class="row">
		<div class="col-md-9">
			<div id="article" class="article"></div>
		</div>
		<div class="col-md-3">
			<div class="rightBox">
				<p>
					<img class="img-thumbnail" src="${root}/theme/images/pic.jpg" alt="www.imethan.cn" width="180px" height="180px" >
				</p>
				
				<font size="4">Ethan Wong</font>
				<hr width='200px;' size='2' style='margin-top: 4px;margin-bottom: 4px;margin-left: 0px;'>
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
	</div>
	
	<script src="${root}/theme/js/jquery.pin.js"></script>
	<script type="text/javascript">
		$(".rightBox").pin({
		      containerSelector: ".row"
		});
	</script>
</body>
</html>