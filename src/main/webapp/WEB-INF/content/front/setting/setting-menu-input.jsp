<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class='radio'>
		  <label>
			    <input type='radio' name="isPublishResume" class="isPublishResume" value="true" <c:if test="${isPublishResume == null || isPublishResume eq true }">checked="checked"</c:if>/>
			    Show
		  </label>
		  <label>
			    <input type="radio" name="isPublishResume" class="isPublishResume" value="false" <c:if test="${isPublishResume eq false }">checked="checked"</c:if> />
			    Hidden
		  </label>
	  </div>
</body>
</html>