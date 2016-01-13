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
					<div class="row">
					  <div class="col-md-12" style="padding-bottom: 10px;">
							<h4><i class="icon-tasks"></i> My Todo</h4>
					  </div>
					  <div class="col-md-4">
					  		<!-- 按钮开始 -->
						  	<shiro:user>
								<div class="btn-group">
								  <button id="newTodo" type="button" class="btn btn-primary" onclick="inputTodo(this)">Add imethan todo</button>
								  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								  	<c:forEach items="${todoItems}" var="item"  varStatus="status">
								  		<li><a href="javascript:;" onclick="checkItem(this,${item.id},'${item.name}')">${item.name}</a></li>
								  	</c:forEach>
								    <li class="divider"></li>
								    <li><a href="${root}/todoitem/input">Add todo item</a></li>
								    <li><a href="${root}/todoitem">Manage item</a></li>
								  </ul>
								</div>
						  	</shiro:user>
						  	<shiro:guest>
						  		<div class="btn-group">
								  <button id="newTodo" type="button" class="btn btn-primary" >imethan todo</button>
								  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								  	<c:forEach items="${todoItems}" var="item"  varStatus="status">
								  		<c:if test="${item.publish eq true}">
								  			<li><a href="javascript:;" onclick="checkGuestItem(this,${item.id},'${item.name}')">${item.name}</a></li>
								  		</c:if>
								  	</c:forEach>
								  </ul>
								</div>
						  	</shiro:guest>
						  	<!-- 按钮结束 -->
					  </div>
					  <div class="col-md-8">
					    <!-- 时间检索开始 -->
						<form id="searchFrom" class="form-inline" role="form"  style="float: right;display: inline;">
							<input type="hidden" id="page" name="page" value="1" />
							<input type="hidden" id="itemId" name="itemId" value="1" />
							
							<!-- 移动版不显示检索框 -->
							<c:if test="${isNormal}">
								<div class="input-from" style="display: inline;">
								    <input type="text" id="beginTime" name="beginTime" class="form-control" placeholder="Begin Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								</div>
								<div class="input-group">
								    <input type="text"  id="endTime" name="endTime"  class="form-control" placeholder="End Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
								      <div class="input-group-btn">
								      	<input type="hidden" id="finishValue" name="finish" value="all" />
								        <button id="finish" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >All&nbsp;<span class="caret"></span></button>
								        <ul class="dropdown-menu " role="menu" >
								          <li><a href="javascript:;" onclick="changeType(this,'all')">All</a></li>
								          <li><a href="javascript:;" onclick="changeType(this,'finish')"><i class='icon-star'></i></a></li>
								          <li><a href="javascript:;" onclick="changeType(this,'unfinished')"><i class='icon-star-empty'></i></a></li>
								        </ul>
								      </div>
								</div>
							</c:if>
						</form>
						<!-- 时间检索结束 -->
					  </div>
					</div>
					<br>
					<!-- 内容开始 -->
					<table class="table table-bordered todo-list table-hover" >
						<tbody id="todo-list"></tbody>
					</table>
					<i class='icon-star'>表示完成</i>  <i class='icon-star-empty'>表示未完成</i>
					<nav><ul class="pager"></ul></nav>
					<!-- 内容结束 -->
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>