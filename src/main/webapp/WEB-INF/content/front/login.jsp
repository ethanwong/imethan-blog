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
	};
	
    function errors(message){
   	 $("#errorBox").html(message);
	 setTimeout(function(){
		 $("#errorBox").html("");
	  },1500);
    };
    
    function reloadValidateCode(){
        $("#validateCodeImg").attr("src","${root}/login/validateCode?data=" + new Date() + Math.floor(Math.random()*24));
    };
	
</script>
</head>
<body>
	<div class="container">
	    <div class="row" >
	    	<div class="col-sm-4" ></div>
	    	<div class="col-sm-4" >
   				<h2 class="form-signin-heading" style="text-align: center;margin-top: 20px;"><span style="font-size: 24px;" class="glyphicon glyphicon-user"></span> Member login</h2>
	    		<br>
	    		<div class="panel panel-default">
					<div class="panel-body" >
 						<form class="form-signin" role="form" action="${root}/login/in" id="inputForm" method="post" onsubmit="return login();" >
						    <input style="margin-bottom: 10px;" type="text" class="form-control required" id="username" name="username" value="" placeholder="Enter username"/>
				    		<input style="margin-bottom: 10px;"  type="password" class="form-control required" id="password"  name="password" value="" placeholder="Enter password" />
				    		
							<input  type="text" class="form-control required col-sm-7" style="width: 140px;"  name="validateCode" placeholder="Validate code"  />
							<img style="display: inline;" class="col-sm-5" id="validateCodeImg" src="${root}/login/validateCode" onclick="javascript:reloadValidateCode();" />
						    <div class="row col-md-12">
							   <input style="margin-bottom: 10px;" type="checkbox" value="1" name="remember" > Remember me
							</div>
							<br>
							 <button style="margin-bottom: 10px;" class="btn  btn-primary  col-md-12" type="submit">Login</button> 
							 <br>
							 <div id="errorBox" class="label label-danger" style="font-size: 14px;"></div>
							 <c:if test="${error != null && error !=''}">
							 	<script type="text/javascript">errors('${error}');</script>
						     </c:if>
						 </form>
		     		</div>
    			</div>
			</div>
			<div class="col-sm-3" ></div>
	    </div>
	 </div>
</body>
</html>