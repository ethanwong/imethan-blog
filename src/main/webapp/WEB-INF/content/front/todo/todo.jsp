<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Todo:ImEthan独立博客:Full Stack Engineer</title>
<jsp:include page="/WEB-INF/content/front/todo/todo-js.jsp"></jsp:include>
</head>
<body>
<div class="container main">
	<div class="row" id="todoList">
		<div class="col-md-12" >
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row" style="padding-top: 0px;padding-bottom: 10px;">
						<div class="col-md-6">
							<h4>
								<i class="icon-tasks"></i>&nbsp;&nbsp;My Todo
							</h4>
						</div>
						<div class="col-md-6"></div>
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
								    <li><a href="${root}/todoitem/input"><span class="icon-plus"></span>&nbsp;New todo item<p>New a todo item</p></a></li>
								    <li><a href="${root}/todoitem"><span class="icon-list-alt"></span>&nbsp;Modify item<p>Manage todo item</p></a></li>
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
						</form>
					  </div>
					</div>
					<br>
					<table class="table table-bordered todo-list table-hover" >
						<tbody id="todo-list">
						</tbody>
					</table>
					<span class='icon-star'>表示完成</span>  <span class='icon-star-empty'>表示未完成</span>
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
</div>
</body>
</html>