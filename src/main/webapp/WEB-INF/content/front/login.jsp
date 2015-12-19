<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login|ImEthan|Full Stack Engineer</title>
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
	<div class="container" style="width: 400px;">
		<form class="form-signin" role="form" action="${root}/login/in" id="inputForm" method="post" onsubmit="return login();" >
		    <h2 class="form-signin-heading" style="text-align: center;"><span style="font-size: 24px;" class="glyphicon glyphicon-user"></span> Member login</h2>
		    <br>
		    <div class="panel panel-default">
	  		<div class="panel-body" >
	  	
		    <div class="row">
		    	<div class="col-sm-12" >
				    <input type="text" class="form-control required" id="username" name="username" value="" placeholder="Enter username"/>
		    	</div>
		    </div>
		    <div class="row">
		    	<div class="col-sm-12" >
		    		<input type="password" class="form-control required" id="password"  name="password" value="" placeholder="Enter password" />
		    	</div>
		    </div>
		    <div class="row">
				 <div class="col-sm-7" >
					<input type="text" class="form-control required" style="width: 140px;"  name="validateCode" placeholder="Validate code"  />
				 </div>
				 <div class="col-sm-5" >
					<img style="display: inline;" id="validateCodeImg" src="${root}/login/validateCode" onclick="javascript:reloadValidateCode();" />
				 </div>
			</div>
			<div style="padding-left: 22px;">
			    <label class="checkbox">
			       <input type="checkbox" value="1" name="remember" > Remember me
			    </label>
			</div>
		     <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			<br>
			 <c:if test="${error != null && error !=''}">
			 <script type="text/javascript">showMsg("error",'${error}');</script>
<%-- 		     	<p class='bg-danger' style='padding: 15px;width: 270px !important;'>${error}</p> --%>
		     </c:if>
		     
		     </div>
		     </div>
		     
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