<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<hr style="margin-top: 20px;">
<div class="footer">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-6" style="padding-bottom: 10px;">
				<h3 class="color-primary" style="margin-top: 0px;">
					<img style="display: inline;vertical-align: top;" class="img-rounded" src="${root}/theme/images/e-rgb(76, 142, 250).png" width="24px" height="24px" /> ImEthan独立博客
				</h3>
				<p>基于JAVA企业级开源框架开发的独立博客，设计风格简约但功能不简陋，开放源代码，功能不断迭代开发，博客内容持续更新。</p>
			</div>
			<div class="col-sm-6  col-lg-5 col-lg-offset-1" >
				<p class="color-primary" style="margin-top: 0px;">最新文章</p>
				<div id="newBlogBox" style="line-height: 18px;"></div>
			</div>
		</div>
	</div>
</div>
<div class="container" style="padding-top: 0px;">
	<hr>
	<div class="copyright">
		<c:if test="${!isNormal}">Copyright © 2014-${year} ImEthan 黄应锋 </c:if>
		<c:if test="${isNormal}">Copyright © 2014-${year} ImEthan 黄应锋  闽ICP备15016601号-1</c:if>
	</div>
</div>
<a href="#" id="back-to-top" ></a>

<script type="text/javascript">
	$(document).ready(function () {
		
		//加载最新文章
		$.ajax({
			url:"${root}/cms/article/top",
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$.each(result, function(i, item) {
					$("#newBlogBox").append("<p><a href='${root}/blog/article/"+item.id+"'>"+item.title+"</a></p>");
				});
				
			}		
		});
		
		//返回顶部超链接
		$.scrollUp({
		    scrollName:'back-to-top',// 元素ID
		    topDistance:'300',// 顶部距离显示元素之前 (px)
		    topSpeed:300,// 回到顶部的速度 (ms)
		    animation:'fade',// 动画类型Fade, slide, none
		    animationInSpeed:200,
		    animationOutSpeed:200,
		    scrollText:'<i class="glyphicon glyphicon-chevron-up"></i>',// 元素文本
		    activeOverlay:false,// 显示scrollUp的基准线，false为不显示, e.g '#00FFFF'
		  });
			
	})
</script>