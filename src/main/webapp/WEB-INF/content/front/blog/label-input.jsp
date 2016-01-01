<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Label:ImEthan独立博客:Full Stack Engineer</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		
	});
	
	//保存栏目
	function save(object){
		if($("#inputForm").valid()){
			var id = $("#id").val();
			var name = $("#name").val();
			var orderNo = $("#orderNo").val();
			$.ajax({
				url:"${root}/blog/tag/save?id="+id+"&name="+name+"&orderNo="+orderNo,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					
					showMsg(messageType,result.message);
					
					setTimeout(function(){
						location.href = "${root}/blog/tag";
					},1500);
					
				}
			});
		};
	};

</script>
</head>
<body>
	
	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default">
				  <div class="panel-heading">
				    <h4 class="panel-title">Input label</h4>
				  </div>
				  <div class="panel-body">
					  	<form role="form" method="post" action="" id="inputForm">
					  	  <input id="id"  type="hidden" name="id" value="${entity.id}">
					  	  
						  <div class="form-group">
						    <label for="name">Name</label>
						    <input id="name" name="name" type="text" class="form-control required" placeholder="Enter name" value="${entity.name}">
						  </div>
		
						  
						  <div class="form-group">
						    <label for="orderNo">OrderNo</label>
						    <input id="orderNo" name="orderNo"  type="text" class="form-control" placeholder="Enter OrderNo" value="${entity.orderNo}">
						  </div>

						  
						  <button type="button" class="btn btn-primary" onclick="save()">Save</button>
						  <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);">Back</button>
						</form>
				  </div>
			</div>
		</div>
	</div>
</body>
</html>