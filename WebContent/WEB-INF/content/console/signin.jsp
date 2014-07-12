<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="${root}/theme/css/console/signin.css" rel="stylesheet">
</head>
<body>
	<div class="container" style="width: 300px;">
      <form class="form-signin" role="form" action="${root}/console/signin" id="inputForm" method="post"  >
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="form-control" name="username" value="admin" placeholder="Enter username" required autofocus>
        <input type="password" class="form-control" name="password" value="123456" placeholder="Enter password" required>
        <div class="row">
		  <div class="col-lg-6" >
        	<input type="text" class="form-control" style="width: 120px;"  name="validateCode" placeholder="Enter validateCode" required>
		  </div>
		   <div class="col-lg-6" >
        	<img id="validateCodeImg" src="${root}/console/validateCode" onclick="javascript:reloadValidateCode();" />
		  </div>
		 </div>
        <label class="checkbox">
          <input type="checkbox" value="1" name="remember"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    </div>
    
    <script type="text/javascript">
    <!--
    function reloadValidateCode(){
        $("#validateCodeImg").attr("src","${root}/console/validateCode?data=" + new Date() + Math.floor(Math.random()*24));
    }
    //-->
    </script>
</body>
</html>