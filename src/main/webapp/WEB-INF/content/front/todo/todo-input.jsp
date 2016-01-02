<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan独立博客:Full Stack Engineer</title>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		
	});
	
	//保存item
	function saveTodo(){
		if($("#todoForm").valid()){
			var todo = $("#todo").val();
			var todoItemId = $("#todoItemId").val();
			$.ajax({
				type:"POST",
				url:"${root}/todo/save",
				data: "content="+encodeURIComponent(todo)+"&todoItem.id="+todoItemId,
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					
					$("#todo").val("");
					showMsg("success",result.message);
					setTimeout(function(){
						location.href = "${root}/todo";
					},1500);
				}
			});
		}
	};

</script>
</head>
<body>
<div class="container main">
	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default contact" >
				<div class="panel-body">
					<div class="row" style="padding-top: 0px;">
						<div class="col-md-2">
							<h4><span class="icon-plus"></span>&nbsp;&nbsp;New todo</h4>
						</div>
						<div class="col-md-10"></div>
					</div>
					<br>
					<form action="" id="todoForm">
						<div class="form-group">
							<label for="exampleInputEmail1">Item</label>
							<select id="todoItemId" name="todoItemId" class="form-control required">
								<c:forEach items="${todoItems}" var="item"  varStatus="status">
									<option value="${item.id}" <c:if test="${item.id eq itemId}">selected</c:if>>${item.name}</option>
								</c:forEach>
						    </select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Todo</label>
							<input type="text" class="form-control required" name="todo" value="" id="todo">
						</div>
						<button type="button" class="btn btn-info"  onclick="saveTodo()" >Save todo</button>
					</form>
				</div>
				<br>
			</div>
		</div>
	</div>
</div>
</body>
</html>