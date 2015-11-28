<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/theme/js/cryptojs/crypto-js-md5.js"></script>
<script type="text/javascript">
	function login(){
		if($("#inputForm").valid()){
			var password = $('#password').val();
			$('#password').val(CryptoJS.MD5(password));
			return true;
		}else{
			return false;
		}
	}
	
</script>
</head>
<body>
	<div class="container" style="width: 300px;">
      <form class="form-signin" role="form" action="${root}/console/signin" id="inputForm" method="post" onsubmit="return login();" >
        <h2 class="form-signin-heading"><span class="glyphicon glyphicon-user"></span>&nbsp;Console login</h2>
         <div class="row">
		    <div class="col-sm-12" >
        		<input type="text" class="form-control" id="username" name="username" value="imethan" placeholder="Enter username" required autofocus>
        	</div>
        </div>
        <div class="row">
		    <div class="col-sm-12" >
        		<input type="password" class="form-control" id="password" name="password" value="imethan" placeholder="Enter password" required>
        	</div>
        </div>
        <div class="row">
			<div class="col-sm-7" >
        		<input type="text" class="form-control" id="validateCode"  style="width: 140px;"  name="validateCode" placeholder="validate code" required />
		    </div>
		    <div class="col-sm-5" >
        		<img style="display: inline;" id="validateCodeImg" src="${root}/console/validateCode" onclick="javascript:reloadValidateCode();" />
		  	</div>
		</div>
		<div style="padding-left: 22px;">
	        <label class="checkbox">
	          <input type="checkbox" value="1" name="remember"> Remember me
	        </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <br>
		 <c:if test="${error != null && error !=''}">
<%-- 	     	<p class='bg-danger' style='padding: 15px;width: 270px !important;'>${error}</p> --%>
	     	<script type="text/javascript">showMsg("error",'${error}');</script>
	     </c:if>
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