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
					$('#inputModal').modal('toggle');
					
					addWarm(result.success,result.message);
					setTimeout(function(){
						$(".addWarm").html("");
						location.href = "${root}/todo";
					},2000);
				}
			});
		}
	};
	
	//添加提醒
	function addWarm(isSuccess,message){
		var messageType = "info";
		if(isSuccess == 'false'){
			messageType = "danger";
		};
		$(".addWarm").html("<p class='bg-"+messageType+"' style='padding: 8px;display: inline;float: right;margin:0px;width:100%;'>"+message+"</p>");
// 		$(".addWarm").html("<div class='alert alert-"+messageType+"' role='alert'  style='padding: 8px;display: inline;float: right;margin:0px;width:100%;'>"+message+"</div>");
	};

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default contact" >
<!-- 				<div class="panel-heading"> -->
<!-- 					 <h3 class="panel-title">New todo</h3> -->
<!-- 				</div> -->
				<div class="panel-body">
					<div class="row" style="padding-top: 0px;">
						<div class="col-md-2">
							<h4><span class="icon-plus"></span>&nbsp;&nbsp;New todo</h4>
						</div>
						<div class="col-md-10 addWarm"></div>
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
<!-- 		<div class="col-md-3"> </div> -->
	</div>
</body>
</html>