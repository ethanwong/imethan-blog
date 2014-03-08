<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="sub-header">${message}</h2>
<a href="${root}/console/cms/channel/input"><button type="button" class="btn btn-primary">Add</button></a>
<div class="table-responsive">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Create Time</th>
        <th>Manage</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach var="item" items="${result.content}" varStatus="status" >
	       <tr>
	       	     <td><c:out value="${status.count}"/></td>
	       		 <td><c:out value="${item.title}"/></td>
	       	     <td><fmt:formatDate value="${item.createTime}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
	        	<td>modify</td>
	        </tr>
		</c:forEach>
    </tbody>
  </table>
  <ul class="pagination" style="margin-bottom: 100px;">
	  <li><a href="#">&laquo;</a></li>
	  <c:forEach var="item" begin="0" end="${result.totalPages-1}">
		  <li <c:if test="${item eq result.number}">class="active"</c:if>><a href="${root}/console/cms/channel/${item}/${result.size}">${item+1}</a></li>
	  </c:forEach>
	  <li><a href="#">&raquo;</a></li>
  </ul>  
</div>
</body>
</html>