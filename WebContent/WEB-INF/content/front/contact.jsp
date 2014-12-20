<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan:Contact</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
	}

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default" >
			  <div class="panel-heading">Contact</div>
			  <div class="panel-body">
				<address>
				  <span class='glyphicon glyphicon-phone'></span>&nbsp;15960203283<br>
				</address>
				<address>
				  <span class='glyphicon glyphicon-envelope'></span>&nbsp;<a href="mailto:ethanwong@qq.com">ethanwong@qq.com</a>
				</address>
			  </div>
			</div>
		</div>
		<div class="col-md-9" >
			<h2 style="margin-top: 0px;">Can you leave a message</h2>
			<form role="form" action="#" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email" class="form-control" id="email" placeholder="Enter you email">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Message</label>
			    <textarea  class="form-control" id="message" placeholder="Enter you message" rows="6"></textarea>
			  </div>
			  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>