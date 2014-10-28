<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>::ImEthan:Example::</title>
	<meta name="author" content="ImEthan" />
	<meta name="description" content="ImEthan" />
	<meta name="keywords"  content="ImEthan" />
	<meta name="Resource-type" content="Document" />

	<link rel="stylesheet" type="text/css" href="${root}/theme/js/portal/jquery.pagepiling.css" />
	<link rel="stylesheet" type="text/css" href="${root}/theme/js/portal/examples.css" />

	<script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>

	<script type="text/javascript" src="${root}/theme/js/portal/jquery.pagepiling.min.js"></script>
	<script type="text/javascript">
		var deleteLog = false;

		$(document).ready(function() {
	    	$('#pagepiling').pagepiling({
	    		menu: '#menu',
	    		anchors: ['page1', 'page2', 'page3','page4'],
			    sectionsColor: ['#faf9f9', '#18C8F6', '#3DCC98', '#F73656'],
				scrollingSpeed:100,
			    loopTop: true,
			    loopBottom: true
			});
	    });
    </script>
</head>
<body>
	<ul id="menu">
		<li data-menuanchor="page1" class="active"><a href="#page1">ImEthan</a></li>
		<li data-menuanchor="page2"><a href="#page2">程序员</a></li>
		<li data-menuanchor="page3"><a href="#page3">读书郎</a></li>
		<li data-menuanchor="page4"><a href="#page4">吉他手</a></li>
	</ul>

	<div style="position:fixed;top:50px;left:50px;color:white;z-index:999;" id="callbacksDiv"></div>

	<div id="pagepiling">
	    <div class="section" id="section1">
	    	<h1>我真的是程序员</h1>
			<p>I'm really a programmer.</p>
			<p>Keywords:Programmer,Readboy,Guitarist</p>
	    </div>
	    <div class="section" id="section2">
	    	<div class="intro">
	    		<h1>程序员</h1>
				<p>Most of the time I in programming.</p>
	    	</div>
	    </div>
	    <div class="section" id="section3">
	    	<div class="intro">
	    		<h1>读书郎</h1>
				<p>Sometimes I like to read books.</p>
	    	</div>
	    </div>
		<div class="section" id="section4">
	    	<div class="intro">
	    		<h1>吉他手</h1>
				<p>Sometimes play guitar.</p>
	    	</div>
	    </div>
	</div>
</body>
</html>