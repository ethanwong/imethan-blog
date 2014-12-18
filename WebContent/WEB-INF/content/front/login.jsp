<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%-- <link href="${root}/theme/css/console/signin.css" rel="stylesheet"> --%>
</head>
<body>
	<div class="container" style="width: 300px;">
		<form class="form-signin" role="form" action="${root}/login/in" id="inputForm" method="post"  >
		    <h2 class="form-signin-heading">Member login</h2>
		    <input type="text" class="form-control" name="username" value="imethan" placeholder="Enter username" required autofocus>
		    <input type="password" class="form-control" name="password" value="imethan" placeholder="Enter password" required>
		    <div class="row">
				 <div class="col-lg-6" style="width: 120px;">
					<input type="text" class="form-control" style="width: 110px;"  name="validateCode" placeholder="validateCode" required />
				 </div>
				 <div class="col-lg-6" style="width: 120px;" >
					<img style="display: inline;" id="validateCodeImg" src="${root}/login/validateCode" onclick="javascript:reloadValidateCode();" />
				 </div>
				 
			</div>
			<div style="padding-left: 22px;">
			    <label class="checkbox">
			       <input type="checkbox" value="1" name="remember" > Remember me
			    </label>
			</div>
	
		     <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
	 </div>
    
    <script type="text/javascript">
    <!--
    function reloadValidateCode(){
        $("#validateCodeImg").attr("src","${root}/login/validateCode?data=" + new Date() + Math.floor(Math.random()*24));
    }
    //-->
    </script>
</body>
</html>