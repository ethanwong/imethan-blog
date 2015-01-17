<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<script src="${root}/theme/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		
		
		$('#tooltip1').tooltip();
		$('#tooltip2').tooltip();
		$('#tooltip3').tooltip();
		$('#tooltip4').tooltip();
		$('#tooltip5').tooltip();
		
		loadTodo(1);
	});
	
	//保存todo信息
	function saveTodo(){
		if($("#todoForm").valid()){
			var todo = $("#todo").val();
			console.log("todo:"+todo);
			
			$.ajax({
				type:"POST",
				url:"${root}/todo/save",
				data: "content="+encodeURIComponent(todo),
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					
					showMsg(messageType,result.message);
					$("#todo").val("");
					
					loadTodo(1);
					
				}
			});
		}
s	};
	
	function loadTodo(page){
		$("#todo-list").html("");
		$.ajax({
			url:"${root}/todo/json/"+page,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				$.each(result.rows, function(i, item) {
					var todo = generateTodo(item.content,item.createTime);
					$("#todo-list").append(todo);
				});
				
				if(result.records>result.size){
					// 处理上页和下页按钮
					var next = result.next;
					var previous = result.previous;
					var page = result.page;
					
		 			console.log("---next:"+next);
		 			console.log("---previous:"+previous);
					
					$(".pager").html("");
					var disabled = "class='disabled'";
					var nextButton = "";
					var previousButton = "";
					
					if(previous ==  true){
						previousButton ="<li><a href='#' onclick='loadTodo("+(page-1)+")'>Previous</a></li>";
//		 				 console.log("---previousButton:"+previsousButton);
					}else{
						previousButton ="<li class='disabled'><a href='#'>Previous</a></li>";
//		 				console.log("---previousButton:"+previousButton);
					}
					
					if(next == true){
					    nextButton = "<li><a href='#' onclick='loadTodo("+(page+1)+")'>Next</a></li>";
//		 			    console.log("---nextButton:"+nextButton);
					}else{
						nextButton ="<li class='disabled'><a href='#'>Next</a></li>";
//		 				console.log("---nextButton:"+nextButton);
					}
					
					$(".pager").append(previousButton);
					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append(nextButton);
					
				}
				if(result.records==0){
					$("#todo-list").append("暂无todo信息");
				}

			}
		});
		
	};
	
	function generateTodo(content,createTime){
		var todo = ""+
					"<tr>"+
						"<td width='20px;'><span class='glyphicon glyphicon-star'></span></td>"+
						"<td>"+content+"</td>"+
						"<td width='80px;'>"+createTime+"</td>"+
						"<td width='20px;'><span class='glyphicon glyphicon-arrow-up'></span></td>"+
						"<td width='20px;'><span class='glyphicon glyphicon-arrow-down'></span></td>"+
						"<td width='20px;'><span class='glyphicon glyphicon-remove'></span></td>"+
					"</tr>";
	
		return todo;
	};
	
	
</script>

</head>
<body>

	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default">
<!-- 				<div class="panel-heading">Todo</div> -->
				<div class="panel-body">
					<h4><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp; Add todo</h4>
					<form action="" id="todoForm">
						<div class="input-group">
						      <input type="text" class="form-control required" name="todo" value="" id="todo">
						      <span class="input-group-btn">
						        <button  onclick="saveTodo()" class="btn btn-info" type="button" style="display: inline-block;"><span class="glyphicon glyphicon-ok"></span></button>
						      </span>
					    </div>
				    </form>
				    <br>
					<h4><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Todo list</h4>
					<div class="row">
					  <div class="col-md-4">
					  		<a href="#" onclick=""><span onclick="" id="tooltip1" class="label label-primary" data-placement="bottom" title="查看今天的todo列表">今天</span></a>
							<span id="tooltip2" class="label label-info" data-placement="bottom" title="查看昨天的todo列表">昨天</span>
							<span id="tooltip3" class="label label-success" data-placement="bottom" title="查看前天的todo列表">前天</span>
							<span id="tooltip4" class="label label-default" data-placement="bottom" title="查看已完成的todo列表"><span class="glyphicon glyphicon-star"></span></span>
							<span id="tooltip5" class="label label-warning" data-placement="bottom" title="查看未完成的todo列表"><span class="glyphicon glyphicon-star-empty"></span></span>
					  </div>
					  <div class="col-md-8">
							<form class="form-inline" role="form"  style="float: right;display: inline;">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
								    <input type="text" class="form-control" placeholder="Begin Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								</div>
								<div class="input-group">
								    <input type="text" class="form-control" placeholder="End Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								      <div class="input-group-btn">
								        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">All <span class="caret"></span></button>
								        <ul class="dropdown-menu" role="menu">
								          <li><a href="">All</a></li>
								          <li><a href="">Another action</a></li>
								          <li><a href="">Something else here</a></li>
								        </ul>
								      </div>
								</div>
							    <button class="btn btn-info" type="button">Search</button>
							</form>
					  </div>
					</div>
					<br>
					<table class="table table-striped table-bordered todo-list" >
						<tbody id="todo-list">
							<tr>	
								<td  width="20px;"><span class="glyphicon glyphicon-star-empty"></span></td>
								<td>独立开发一个todo模块</td>
								<td width="80px;">2015/01/14</td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-up"></span></td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-down"></span></td>
								<td width="20px;"><span class="glyphicon glyphicon-remove"></span></td>
							</tr>
							<tr>	
								<td width="20px;"><span class="glyphicon glyphicon-star"></span></td>
								<td>完成编辑器中的图片以及附件上传功能</td>
								<td width="80px;">2015/01/14</td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-up"></span></td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-down"></span></td>
								<td width="20px;"><span class="glyphicon glyphicon-remove"></span></td>
							</tr>
						</tbody>
					</table>
					<nav>
					  <ul class="pager">
					  </ul>
					</nav>
				</div>
			</div>
		</div>
		
<!-- 		<div class="col-md-3" > -->
			
<!-- 		</div> -->
	</div>
</body>
</html>