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
					"<h4 style='color: #428bca;''>"+
					item.title+
					"<small style='float: right;' >"+
					item.createTime+
					"</small></h4>"+
					"<hr width='698px;' size='2' style='padding: 0;margin:0;margin-bottom: 10px;'>"+
					
					"<p style='color: #333 !important;line-height: 26px;'>"+
					item.content+
					"</p>"+
// 					"<small>"+item.channelName+"</small>"+
					"<small><span class='label label-info'>"+item.channelName+"</span></small>"+
					"<br><br>";
					$("#article").append(article);
				});
			}
		});
	};

</script>
</head>
<body>


<!-- <div class="jumbotron"> -->
<!--   <h1>Hello, world!</h1> -->
<!--   <p>...</p> -->
<!--   <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p> -->
<!-- </div> -->
<!-- 	<div class="well well-sm">欢迎您百忙之中抽空访问"www.imethan.cn"，这里是一个WEB开发者展现内心独白的的平台，作为一个IT从业者，特别是WEB设计开发人员，没有一个属于自己的站点一直是个遗憾，因为2006年就给自己定下这样的小目标，要有自己的一个小网站，在正式进入IT行业3年后的今天，"imethan"的上线填补了个人的这个遗憾，希望接下来的日子里能好好的开发以及维护，也将其作为一个职业技能训练和巩固的平台。</div> -->
	<div class="row">
		<div class="col-md-3">
			<ul class="list-group" style="width: 210px;">
				<li class="list-group-item" align="middle"><img class="img-thumbnail" src="${root}/theme/images/20131110-ethan.jpg" alt="www.imethan.cn" width="180px" height="180px" ></li>
				<li class="list-group-item"><strong>Name</strong><br>Ethan Wong</li>
				<li class="list-group-item"><strong>Locate</strong><br>XiaMen.China</li>
				<li class="list-group-item"><strong>Email</strong><br>ethanwong@qq.com</li>
				<li class="list-group-item"><strong>Job</strong><br>A developer!</li>
			</ul>
		</div>
		<div class="col-md-9">
<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-heading">这是标题的文字大小 <small style="float: right;">2014-3-31 11:11:12</small></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 					这可以追溯到几十年前第一台分时小型电脑诞生, ARPAnet 实验也刚展开的 -->
<!-- 				年代，那时有一个由程序设计专家和网络名人所组成的, 具有分享特点的文化社群。 这种文化的成员创造了 “hacker” -->
<!-- 				这个名词。黑客们建立了 Internet。 黑客们发明出了现在使用的 UNIX 操作系统。黑客们使 Usenet 运作起来， 黑客们让 -->
<!-- 				WWW 运转起来。如果你是这个文化的一部分，如果你对这种文化有所贡献，而且 这个社群的其它成员也认识你并称你为 hacker, -->
<!-- 				那么你就是一位黑客。 -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-heading">这是标题的文字大小 <small style="float: right;">2014-3-31 11:11:12</small></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 					这可以追溯到几十年前第一台分时小型电脑诞生, ARPAnet 实验也刚展开的 -->
<!-- 				年代，那时有一个由程序设计专家和网络名人所组成的, 具有分享特点的文化社群。 这种文化的成员创造了 “hacker” -->
<!-- 				这个名词。黑客们建立了 Internet。 黑客们发明出了现在使用的 UNIX 操作系统。黑客们使 Usenet 运作起来， 黑客们让 -->
<!-- 				WWW 运转起来。如果你是这个文化的一部分，如果你对这种文化有所贡献，而且 这个社群的其它成员也认识你并称你为 hacker, -->
<!-- 				那么你就是一位黑客。 -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div id="article">
<!-- 				<h4 style="color: #428bca;">这是标题的文字大小 <small style="float: right;">2014-3-31 11:11:12</small></h4> -->
<!-- 				<hr width="698px;" size="2" style="padding: 0;margin:0;margin-bottom: 10px;"> -->
<!-- 				<p style="color: #333 !important;line-height: 26px;"> -->
<!-- 				这可以追溯到几十年前第一台分时小型电脑诞生, ARPAnet 实验也刚展开的 -->
<!-- 				年代，那时有一个由程序设计专家和网络名人所组成的, 具有分享特点的文化社群。 这种文化的成员创造了 “hacker” -->
<!-- 				这个名词。黑客们建立了 Internet。 黑客们发明出了现在使用的 UNIX 操作系统。黑客们使 Usenet 运作起来， 黑客们让 -->
<!-- 				WWW 运转起来。如果你是这个文化的一部分，如果你对这种文化有所贡献，而且 这个社群的其它成员也认识你并称你为 hacker, -->
<!-- 				那么你就是一位黑客。 -->
<!-- 				</p> -->
<!-- 				<small>Someone famous in <cite title="Source Title">Source Title</cite></small> -->
<!-- 				<br><br> -->
			</div>
		</div>
	</div>
</body>
</html>