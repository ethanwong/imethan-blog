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
			<p style="padding-top: 22px;">
				<img src="${root}/theme/images/20131110-ethan.jpg" alt="..." class="img-thumbnail" width="180px">
			</p>
			<font size="4">ImEthan</font>
			<hr width='200px;' size='2' style='margin-top: 4px;margin-bottom: 4px;margin-left: 0px;'/>
			<p style="line-height: 30px;">
				<address>
				  <strong>Phone</strong><br>
				  15960203283<br>
				</address>
				<address>
				  <strong>Email</strong><br>
				  <a href="mailto:#">ethanwong@qq.com</a>
				</address>
			</p>
			
		</div>
		
		<div class="col-md-9" >
			<h3>You can leave a message</h3>
			<form role="form" action="#" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email" class="form-control" id="email" placeholder="Enter email">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Message</label>
			    <textarea  class="form-control" id="message" placeholder="Enter message" rows="6"></textarea>
			  </div>
			  <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>