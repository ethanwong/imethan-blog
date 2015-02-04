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
		$('#tooltip6').tooltip();
		
		loadTodo(1);
	});
	
	//添加todo
	function inputTodo(object){
		$('#inputModal').modal(
		);
	};
	
	//新建保存todo信息
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
					$('#inputModal').modal('toggle');
					
					loadTodo(1);
					
				}
			});
		}
	};
	
	//加载todo列表
	function loadTodo(page){
		$("#todo-list").html("");
		$.ajax({
			url:"${root}/todo/json/"+page,
			type:"POST",
			dateType:"json",
			success:function(data){
				
				var result = eval("(" + data + ")");
				
				$.each(result.rows, function(i, item) {
					var todo = generateTodo(item.id,item.content,item.createTime,item.finish);
					$("#todo-list").append(todo);
				});
				
				if(result.records>result.size){
					// 处理上页和下页按钮
					var next = result.next;
					var previous = result.previous;
					var page = result.page;
					
					$(".pager").html("");
					var disabled = "class='disabled'";
					var nextButton = "";
					var previousButton = "";
					
					if(previous ==  true){
						previousButton ="<li><a href='#todoList' onclick='loadTodo("+(page-1)+")'>Previous</a></li>";
					}else{
						previousButton ="<li class='disabled'><a href='#todoList'>Previous</a></li>";
					}
					
					if(next == true){
					    nextButton = "<li><a href='#todoList' onclick='loadTodo("+(page+1)+")'>Next</a></li>";
					}else{
						nextButton ="<li class='disabled'><a href='#todoList'>Next</a></li>";
					}
					
					$(".pager").append(previousButton);

					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append("<li><a>Total:"+result.records+"</a></li>");
					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append("<li><a>Page:"+page+"/"+result.total+"</a></li>");
					
					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append(nextButton);
					
				}
				if(result.records==0){
					$("#todo-list").append("暂无todo信息");
				}
			}
		});
		
	};
	
	//生成todo行
	function generateTodo(id,content,createTime,finish){
		console.log(finish);
		var star = "<span class='glyphicon glyphicon-star'></span>";
		if(finish == false){
			star = "<span class='glyphicon glyphicon-star-empty'></span>";
		}
		var todo = ""+
					"<tr onclick='active(this)'>"+
						"<td width='20px;' id="+id+" finish="+finish+">"+star+"</td>"+
						"<td id='content'>"+content+"</td>"+
						"<td width='80px;'>"+createTime+"</td>"+
					"</tr>";
		return todo;
	};
	
	//检索todo
	function searchTodo(page){
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
		var finish = $("#finishValue").val();
		
		$("#todo-list").html("");
		$.ajax({
			url:"${root}/todo/json/"+page+"?beginTime="+beginTime+"&endTime="+endTime+"&finish="+finish,
			type:"POST",
			dateType:"json",
			success:function(data){
				
				var result = eval("(" + data + ")");
				
				$.each(result.rows, function(i, item) {
					var todo = generateTodo(item.id,item.content,item.createTime,item.finish);
					$("#todo-list").append(todo);
				});
				
				if(result.records>result.size){
					// 处理上页和下页按钮
					var next = result.next;
					var previous = result.previous;
					var page = result.page;
					
					$(".pager").html("");
					var disabled = "class='disabled'";
					var nextButton = "";
					var previousButton = "";
					
					if(previous ==  true){
						previousButton ="<li><a href='#todoList' onclick='searchTodo("+(page-1)+")'>Previous</a></li>";
					}else{
						previousButton ="<li class='disabled'><a href='#todoList'>Previous</a></li>";
					}
					
					if(next == true){
					    nextButton = "<li><a href='#todoList' onclick='searchTodo("+(page+1)+")'>Next</a></li>";
					}else{
						nextButton ="<li class='disabled'><a href='#todoList'>Next</a></li>";
					}
					
					$(".pager").append(previousButton);
					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append(nextButton);
					
				}
				if(result.records==0){
					$("#todo-list").append("<tr><td>暂无todo信息</td></tr>");
				}
			}
		});
		
	};
	
	//选中todo类型
	function changeType(object){
		var finish = $(object).html();
		console.log($(object).html());
		$("#finish").html(finish+"&nbsp;<span class='caret'></span>");
		$("#finishValue").val(finish);
	};
	
	//选中todo行
	function active(object){
		$("tr").attr("class","");
		$(object).attr("class","info");
	};
	
	//更新是否完成
	function changeFinish(object){
		var id = $(".info").find("td:first").attr("id");
		var finish = $(".info").find("td:first").attr("finish");
		if($(".info").length > 0){
			$.ajax({
				url:"${root}/todo/finish/"+id+"/"+finish,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					if(finish == 'false'){
						$(".info").find("td:first").html("<span class='glyphicon glyphicon-star'></span>");
						$(".info").find("td:first").attr("finish","true");
					}else{
						$(".info").find("td:first").html("<span class='glyphicon glyphicon-star-empty'></span>");
						$(".info").find("td:first").attr("finish","false");
					};
					
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					showMsg(messageType,result.message);
				}
			});
		}
	};
	
	//删除todo
// 	function deleteOne(){
// 		var id = $(".info").find("td:first").attr("id");
// 		if($(".info").length > 0){
// 			$.ajax({
// 				url:"${root}/todo/delete/"+id,
// 				type:"POST",
// 				dateType:"json",
// 				success:function(data){
// 					var result = eval("(" + data + ")");
// 					$(".info").remove();
// 					var messageType = "success";
// 					if(result.success == false){
// 						messageType = "error";
// 					};
// 					showMsg(messageType,result.message);
// 				}
// 			});
// 		}
// 	};


	//删除todo
	function deleteTodo(){
		var id = $(".info").find("td:first").attr("id");
		if($(".info").length > 0){
			$('#deleteTodoConfirmModal').modal({
			 	 keyboard: true
			});
		}
	};

	//执行删除todo
	function deleteOne(){
		var id = $(".info").find("td:first").attr("id");
		$.ajax({
			url:"${root}/todo/delete/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$(".info").remove();
				var messageType = "success";
				if(result.success == false){
					messageType = "error";
				};
				showMsg(messageType,result.message);
				
				$('#deleteTodoConfirmModal').modal('toggle');
			}
		});
	};
	
	
	//更新todo内容
	function updateOne(){
		var id = $(".info").find("td:first").attr("id");
		var content = $(".info").find("#content").html();
		if($(".info").length > 0){
			$('#editModal').modal(
				$("#todoId").val(id),
				$("#todoContent").val(content)
			);
		}
	};
	
	
	//更新保存todo信息
	function updateTodo(){
		if($("#todoForm").valid()){
			var todo = $("#todoContent").val();
			var id = $("#todoId").val();
			
			$.ajax({
				type:"POST",
				url:"${root}/todo/save",
				data: "content="+encodeURIComponent(todo)+"&id="+id,
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					
					showMsg(messageType,result.message);
					$('#editModal').modal('toggle');
					
					$(".info").find("#content").html(todo);
				}
			});
		}
	};
	
	
	
</script>

</head>
<body>

	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default">
				<div class="panel-body">
					<h4 id="todoList"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Todo list</h4>
					<div class="row">
					  <div class="col-md-3">
					  	<shiro:user>
					  		<button id="tooltip1" data-placement="bottom" title="Add todo"  class="btn btn-primary btn-xs" onclick="inputTodo(this)"><span class="glyphicon glyphicon-plus"></span></button>
					  		<button id="tooltip2" data-placement="bottom" title="Finish todo"  class="btn btn-success btn-xs" onclick="changeFinish(this)"><span class="glyphicon glyphicon-ok"></span></button>
					  		<button id="tooltip3" data-placement="bottom" title="Up todo"  class="btn btn-warning btn-xs" onclick=""><span class="glyphicon glyphicon-arrow-up"></span></button>
					  		<button id="tooltip4" data-placement="bottom" title="Down todo"  class="btn btn-default btn-xs" onclick=""><span class="glyphicon glyphicon-arrow-down"></span></button>
					  		<button id="tooltip5" data-placement="bottom" title="Edit todo"  class="btn btn-info btn-xs" onclick="updateOne(this)"><span class="glyphicon glyphicon-edit"></span></button>
					  		<button id="tooltip6" data-placement="bottom" title="Trash todo"  class="btn btn-danger btn-xs" onclick="deleteTodo(this)"><span class="glyphicon glyphicon-trash"></span></button>
					  	</shiro:user>
					  	<shiro:guest> 
					  		 <span class='glyphicon glyphicon-star'>表示完成</span>
					  		 <span class='glyphicon glyphicon-star-empty'>表示未完成</span>
					  	</shiro:guest>
					  </div>
					  <div class="col-md-9">
							<form class="form-inline" role="form"  style="float: right;display: inline;">
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
								    <input type="text" id="beginTime" class="form-control" placeholder="Begin Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								</div>
								<div class="input-group">
								    <input type="text"  id="endTime"  class="form-control" placeholder="End Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								      <div class="input-group-btn">
								      	<input type="hidden" id="finishValue" name="finishValue" value="all" />
								        <button id="finish" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">All&nbsp;<span class="caret"></span></button>
								        <ul class="dropdown-menu" role="menu">
								          <li><a href="#" onclick="changeType(this)">All</a></li>
								          <li><a href="#" onclick="changeType(this)">Finish</a></li>
								          <li><a href="#" onclick="changeType(this)">Unfinished</a></li>
								        </ul>
								      </div>
								</div>
							    <button class="btn btn-info" type="button" onclick="searchTodo(1)">Search</button>
							</form>
					  </div>
					</div>
					<br>
					<table class="table table-bordered todo-list  table-hover" >
						<tbody id="todo-list"></tbody>
					</table>
					<nav><ul class="pager"></ul></nav>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="inputModal"  tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;New todo</h4>
				</div>
				<div class="modal-body">
					<form action="" id="todoForm">
						<input type="text" class="form-control required" name="todo" value="" id="todo">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info"  onclick="saveTodo()" >Save todo</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="editModal"  tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;Edit todo</h4>
				</div>
				<div class="modal-body">
					<form action="" id="todoForm">
						<input type="hidden" name="id" value="" id="todoId">
						<input type="text" class="form-control required" name="todo" value="" id="todoContent">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info"  onclick="updateTodo()" >Save todo</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="deleteTodoConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteTodoConfirmModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Warning</h4>
				</div>
				<div class="modal-body">Sure you want to delete?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="deleteOne()">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>