<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
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
					<p>
						<span class="label label-primary">今天</span>
						<span class="label label-info">昨天</span>
						<span class="label label-success">前天</span>
					</p>
					<table class="table table-striped table-bordered todo-list" >
						<tbody>
<!-- 							<tr>	 -->
<!-- 								<td width="20px;"><span class="glyphicon glyphicon-star-empty"></span></td> -->
<!-- 								<td colspan="4" width="980px;"> -->
<!-- 									<div class="input-group"> -->
<!-- 									      <input type="text" class="form-control"> -->
<!-- 									      <span class="input-group-btn"> -->
<!-- 									        	<button class="btn btn-info" type="button" style="display: inline-block;">Save</button> -->
<!-- 									      </span> -->
<!-- 								    </div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
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