<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Label|ImEthan|Full Stack Engineer</title>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		//初始化jqGrid
		jQuery("#list").jqGrid({
			url: '${root}/blog/label/json',
			datatype: "json",
			mtype: 'POST',
			styleUI : 'Bootstrap',
			autowidth : true,
			autoheight : true,
			height : 760,
			rowNum: 20,
			rowList: [10, 20, 30],
			colNames: ['Name','OrderNo', 'CreateTime','操作'],
			colModel: [	
			           	{ name: 'name',  width: 200 },
						{ name: 'orderNo', width: 100 },
						{ name: 'createTime', width: 150},
						{ name: 'id', width: 100,formatter:operation}
					  ],
			pager: jQuery('#pager'),
// 			viewrecords: true,
// 			multiselect : true,
			rownumbers : true,
// 			caption: "Blog Channel Mange"
		});
		
		function operation(cellvalue, options, rowObject) {
			var modifyOperation = "<shiro:hasPermission name='user:modify'><a id='operation1' href='${root}/blog/label/input?id="+cellvalue+"' ><span class='glyphicon glyphicon-edit'></a></shiro:hasPermission>";
			var deleteOPeration = "<shiro:hasPermission name='user:delete'><a id='operation2' href='javascript:;' onclick='deleteOne("+cellvalue+")' ><span class='glyphicon glyphicon-trash'></span></a></shiro:hasPermission>";
			return modifyOperation + " " + deleteOPeration;
		};
		
		// Setup buttons
		jQuery("#list").jqGrid('navGrid', '#pager', {
			edit : false,
			add : false,
			del : false,
			search : false
		}, {
			reloadAfterSubmit : true
		});
		$(".ui-jqgrid-titlebar-close*").remove();
	});
	
	
	//删除栏目
	function deleteOne(id){
		$('#deleteConfirmModal').modal({
		 	 keyboard: true
		});
		$("#deleteConfirmModalClick").click(function(){
			$.ajax({
				url:"${root}/blog/label/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					//加载角色列表
					showMsg("success",result.message);
					
					setTimeout(function(){
						location.href = "${root}/blog/label";
					},1500);
				}
			});
		});
	};

</script>
</head>
<body>
	<form class="form-horizontal" role="form">
	  <div class="form-group">
		    <div class="col-sm-9">
		    	<font style="font-size:30px;float: left;">Label Manage</font>
		    	<small style="float: left;padding-top: 20px;padding-left: 10px;">标签管理</small>
		    	<shiro:user>
					<a title="添加标签"  style="padding:12px 0px 0px 20px;float: right;" href="${root}/blog/label/input">
						<span class="glyphicon glyphicon-plus"></span> 添加标签
					</a>
		    	</shiro:user>
		    </div>
		    <div class="col-sm-3" >
		    	<input  name="search_title" value="" type="search" class="form-control" placeholder="Search label" />
		    </div>
	  </div>
	</form>
	<hr>
	<div class="row">
		<div class="col-md-12" >
			<table id="list"></table>
			<div id="pager"></div>
		</div>
	</div>
</body>
</html>