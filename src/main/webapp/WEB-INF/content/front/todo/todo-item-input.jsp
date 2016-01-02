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
	function saveTodoItem(){
		if($("#todoItemForm").valid()){
			var publish = $("#publish:checked").val();
			var todoItem = $("#todoItem").val();
			$.ajax({
				type:"POST",
				url:"${root}/todoitem/save",
				data: "name="+encodeURIComponent(todoItem)+"&publish="+publish,
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					
					$("#todoItem").val("");
					showMsg("success",result.message);
					setTimeout(function(){
						location.href = "${root}/todoitem";
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
						<div class="col-md-3">
							<h4><span class="icon-plus"></span>&nbsp;&nbsp;New todo item</h4>
						</div>
						<div class="col-md-9"></div>
					</div>
					<br>
					<form action="" id="todoItemForm">
						<div class="form-group">
							<label for="exampleInputEmail1">Item</label>
							<input type="text" class="form-control required" name="todoItem" value="" id="todoItem">
						</div>
						<div class="radio">
							  <label>
								    <input type="radio" name="publish" id="publish" value="true" />
								    Publish
							  </label>
							  <label>
								    <input type="radio" name="publish" id="publish" value="false" checked="checked"  />
								    Hidden
							  </label>
						 </div>
						 <br>
						<button type="button" class="btn btn-info"  onclick="saveTodoItem()" >Save todo item</button>
					</form>
				</div>
				<br>
			</div>
		</div>
	</div>
</div>
</body>
</html>