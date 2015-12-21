<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Todo|ImEthan|Full Stack Engineer</title>
<script src="${root}/theme/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		//加载todo列表
		loadTodo(1);
	});
	
	//添加todo
	function inputTodo(object){
		location.href = "${root}/todo/input/"+$("#itemId").val();
	};
	
	//设置item列表
	function setItemList(checkItemId){
		$("#todoItemId").html("");
		$.ajax({
			url:"${root}/todoitem/json",
			type:"POST",
			dateType:"json",
			success:function(data){
				
				var result = eval("(" + data + ")");
				$.each(result, function(i, item) {
					if(checkItemId == item.id){
						$("#todoItemId").append("<option value='"+item.id+"' selected='selected'>"+item.name+"</option>");
					}else{
						$("#todoItemId").append("<option value='"+item.id+"'>"+item.name+"</option>");
					}
					
				});
			}
		});
	}
	
	//保存todo信息
	function saveTodo(){
		if($("#todoForm").valid()){
			var todo = $("#todo").val();
			var todoItemId = $('#inputModal').find("#todoItemId").val();
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
						loadTodo(1);
						$(".addWarm").html("");
					},2000);
				}
			});
		}
	};
	
	//加载todo列表
	function loadTodo(page){
		$('#loader').show();
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
		var finish = $("#finishValue").val();
		var itemId = $("#itemId").val();
		
		$("#todo-list").html("");
		$.ajax({
			url:"${root}/todo/json/"+page+"?beginTime="+beginTime+"&endTime="+endTime+"&finish="+finish+"&itemId="+itemId,
			type:"POST",
			dateType:"json",
			success:function(data){
				
				var result = eval("(" + data + ")");
				
				$.each(result.rows, function(i, item) {
					var todo = generateTodo(item.id,item.content,item.createTime,item.finish,item.nextOrderNo,item.previousOrderNo);
					$("#todo-list").append(todo);
				});
				console.log("result.records:"+result.records);
				console.log("result.size:"+result.size);
				$(".pager").html("");
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
					
					<c:if test="${isNormal}">
						$(".pager").append("&nbsp;&nbsp;");
						$(".pager").append("<li><a>Total:"+result.records+"</a></li>");
						$(".pager").append("&nbsp;&nbsp;");
						$(".pager").append("<li><a>Page:"+page+"/"+result.total+"</a></li>");
					</c:if>
					
					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append(nextButton);
				}
				if(result.records==0){
					$("#todo-list").append("<tr class='warning'><td>暂无todo信息</td></tr>");
				}
				
				$("#page").val(result.page);
				
				$('#loader').hide();
			}
		});
	};
	
	//生成todo行
	function generateTodo(id,content,createTime,finish,nextOrderNo,previousOrderNo){
		var star = "<span class='glyphicon glyphicon-star'></span>";
		if(finish == false){
			star = "<span class='glyphicon glyphicon-star-empty'></span>";
		}
		var todo = ""+
					"<tr id='tr"+id+"' onclick='active(this)' onmouseenter='showMenu(this)' onmouseleave='hiddenMenu(this)' >"+
						"<td width='20px;' id="+id+" finish="+finish+">"+star+"</td>"+
						"<td id='content' previousOrderNo='"+previousOrderNo+"' nextOrderNo='"+nextOrderNo+"'><span>"+content+"</span></td>"+
						"<td width='80px;'>"+createTime+"</td>"+
					"</tr>";
		return todo;
	};
	
	//管理菜单
	var menu = "<shiro:user>"+
				"<span class='btn-group' style='float:right' >"+
				   	"<a href='#todoList' onclick='changeFinish(this)'><span class='glyphicon glyphicon-ok' style='color:#5cb85c;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='orderUp(this)'><span class='glyphicon glyphicon-arrow-up' style='color:#337ab7;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='orderDown(this)'><span class='glyphicon glyphicon-arrow-down' style='color:#f0ad4e;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='updateOne(this)'><span class='glyphicon glyphicon-edit' style='color:#5bc0de;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='deleteTodo(this)'><span class='glyphicon glyphicon-trash' style='color:#d9534f;'></span></a>"+
				"</span>"+
				"</shiro:user>";
	
	//展现菜单
	function showMenu(object){
		$(object).find("#content").append(menu);
	};
	
	//隐藏菜单
	function hiddenMenu(object){
		$(object).find("#content").find(".btn-group").remove();
	}
	
	//检索todo
	//选中todo类型
	function changeType(object){
		var finish = $(object).html();
		$("#finish").html(finish+"&nbsp;<span class='caret'></span>");
		$("#finishValue").val(finish);
		
		loadTodo(1);
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
				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
	};

	//删除todo
	function deleteTodo(object){
		var id = $(object).parent().parent().parent().find("td:first").attr("id");
		$('#deleteTodoConfirmModal').modal({
		 	 keyboard: true
		},$("#deleteTodoId").val(id));
	};

	//执行删除todo
	function deleteOne(){
		var id = $("#deleteTodoId").val();
		$.ajax({
			url:"${root}/todo/delete/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$(".info").remove();
				
				$('#deleteTodoConfirmModal').modal('toggle');

				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
	};
	
	//更新todo内容
	function updateOne(object){
		var id = $(object).parent().parent().parent().find("td:first").attr("id");
		location.href = "${root}/todo/edit/"+id;
	};
	
	//提升排序
	function orderUp(){
		var id = $(".info").find("td:first").attr("id");
		var nextOrderNo = $(".info").find("#content").attr("nextOrderNo");
		var previousOrderNo = $(".info").find("#content").attr("previousOrderNo");
		
		$.ajax({
			type:"POST",
			url:"${root}/todo/up",
			data: "id="+id+"&nextOrderNo="+nextOrderNo+"&previousOrderNo="+previousOrderNo,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");

				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
	};
	
	//降低排序
	function orderDown(){
		var id = $(".info").find("td:first").attr("id");
		var nextOrderNo = $(".info").find("#content").attr("nextOrderNo");
		var previousOrderNo = $(".info").find("#content").attr("previousOrderNo");
		
		$.ajax({
			type:"POST",
			url:"${root}/todo/down",
			data: "id="+id+"&nextOrderNo="+nextOrderNo+"&previousOrderNo="+previousOrderNo,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
		
				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
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
	
	//重置检索
	function resetPage(){
		location.reload();
	};
	
	//选择item
	function checkItem(object,itemId,itemName){
		$("#newTodo").html("New "+itemName+" todo");//替换New item信息
		$("#itemId").val(itemId);//设置item参数
		loadTodo($("#page").val());
	};
	
	//选择Guestitem
	function checkGuestItem(object,itemId,itemName){
		$("#newTodo").html(""+itemName+" todo");//替换New item信息
		$("#itemId").val(itemId);//设置item参数
		loadTodo($("#page").val());
	};

</script>

</head>
<body>
	<div class="row" id="todoList">
		<div class="col-md-12" >
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row" style="padding-top: 0px;">
						<div class="col-md-2">
							<h4>
								<span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Todo list
							</h4>
						</div>
						<div class="col-md-10 addWarm"></div>
					</div>
					<div class="row">
					  <div class="col-md-4" style="padding-bottom: 4px;">
					  	<shiro:user>
								<div class="btn-group">
								  <button id="newTodo" type="button" class="btn btn-info" onclick="inputTodo(this)">New imethan todo</button>
								  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								  	<c:forEach items="${todoItems}" var="item"  varStatus="status">
								  		<li><a href="#" onclick="checkItem(this,${item.id},'${item.name}')">${item.name}</a></li>
								  	</c:forEach>
								    <li class="divider"></li>
								    <li><a href="${root}/todoitem/input"><span class="glyphicon glyphicon-plus"></span>&nbsp;New todo item<p>New a todo item</p></a></li>
								    <li><a href="${root}/todoitem"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;Modify item<p>Manage todo item</p></a></li>
								  </ul>
								</div>
					  	</shiro:user>
					  	<shiro:guest>
					  		<div class="btn-group">
								  <button id="newTodo" type="button" class="btn btn-info" >imethan todo</button>
								  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								  	<c:forEach items="${todoItems}" var="item"  varStatus="status">
								  		<c:if test="${item.publish eq true}">
								  			<li><a href="#" onclick="checkGuestItem(this,${item.id},'${item.name}')">${item.name}</a></li>
								  		</c:if>
								  	</c:forEach>
								  </ul>
							</div>
					  	</shiro:guest>
					  </div>
					  <div class="col-md-8" style="padding-bottom: 4px;">
						<form id="searchFrom" class="form-inline" role="form"  style="float: right;display: inline;">
							<input type="hidden" id="page" name="page" value="1" />
							<input type="hidden" id="itemId" name="itemId" value="1" />
								<div class="input-from" style="display: inline;">
								    <input type="text" id="beginTime" name="beginTime" class="form-control" placeholder="Begin Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								</div>
								<div class="input-group">
								    <input type="text"  id="endTime" name="endTime"  class="form-control" placeholder="End Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								      <div class="input-group-btn">
								      	<input type="hidden" id="finishValue" name="finish" value="all" />
								        <button id="finish" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" >All&nbsp;<span class="caret"></span></button>
								        <ul class="dropdown-menu " role="menu" >
								          <li><a href="#" onclick="changeType(this)">All</a></li>
								          <li><a href="#" onclick="changeType(this)">Finish</a></li>
								          <li><a href="#" onclick="changeType(this)">Unfinished</a></li>
								        </ul>
								      </div>
								     
								</div>
								<c:if test="${isNormal}">
									 <button class="btn btn-default" type="reset" onclick="resetPage()">Reset</button>
							 	</c:if>
						</form>
					  </div>
					</div>
					<br>
					<table class="table table-bordered todo-list table-hover" >
						<tbody id="todo-list">
						</tbody>
					</table>
					<span class='glyphicon glyphicon-star'>表示完成</span>  <span class='glyphicon glyphicon-star-empty'>表示未完成</span>
					<nav>
						<ul class="pager">
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	
	<!-- 添加todo -->
	<div class="modal fade" id="inputModal"  tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;New todo</h4>
				</div>
				<div class="modal-body">
					<form action="" id="todoForm">
						<div class="form-group">
							<label for="exampleInputEmail1">Item</label>
							<select id="todoItemId" name="todoItemId" class="form-control required">
						    </select>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Todo</label>
							<input type="text" class="form-control required" name="todo" value="" id="todo">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info"  onclick="saveTodo()" >Save todo</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 编辑todo -->
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
	
	<!-- 删除todo确定框 -->
	<div class="modal fade" id="deleteTodoConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteTodoConfirmModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Warning</h4>
				</div>
				<div class="modal-body">
					Sure you want to delete?
					<input type="hidden" id="deleteTodoId" name="deleteTodoId" value=""/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="deleteOne()">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>