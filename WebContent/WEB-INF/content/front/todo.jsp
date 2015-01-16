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

});
</script>

</head>
<body>

	<div class="row">
		<div class="col-md-12" >
			<div class="panel panel-default">
				<div class="panel-heading">Todo</div>
				<div class="panel-body">
					<h4><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp; Add todo</h4>
					<div class="input-group">
					      <input type="text" class="form-control">
					      <span class="input-group-btn">
					        <button class="btn btn-info" type="button" style="display: inline-block;">Save</button>
					      </span>
				    </div>
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
								-
								<div class="input-group">
								    <input type="text" class="form-control" placeholder="End Date" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})">
									<span class="input-group-btn">
								        <button class="btn btn-info" type="button">Search</button>
								    </span>
								</div>
							</form>
					  </div>
					</div>
					<br>
					<table class="table table-striped table-bordered todo-list" >
						<tbody>
							<tr>	
								<td  width="20px;"><span class="glyphicon glyphicon-star-empty"></span></td>
								<td>独立开发一个todo模块</td>
								<td width="100px;">2015/01/14</td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-up"></span></td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-down"></span></td>
							</tr>
							<tr>	
								<td width="20px;"><span class="glyphicon glyphicon-star"></span></td>
								<td>完成编辑器中的图片以及附件上传功能</td>
								<td width="100px;">2015/01/14</td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-up"></span></td>
								<td width="20px;"><span class="glyphicon glyphicon-arrow-down"></span></td>
							</tr>
						</tbody>
					</table>
					<nav>
					  <ul class="pager">
					    <li><a href="#">Previous</a></li>
					    <li><a href="#">Next</a></li>
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