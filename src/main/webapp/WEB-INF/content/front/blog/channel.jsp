<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Channel|ImEthan|Full Stack Engineer</title>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		//初始化jqGrid
		jQuery("#list").jqGrid({
			url: '${root}/blog/channel/json',
			datatype: "json",
			mtype: 'POST',
			styleUI : 'Bootstrap',
			autowidth : true,
			autoheight : true,
			height : 760,
			rowNum: 20,
			rowList: [10, 20, 30],
			colNames: ['ChannelName','ArticleAmount', 'IsPublish','OrderNo', 'CreateTime','操作'],
			colModel: [	
			           	{ name: 'name',  width: 200 },
			           	{ name: 'articleAmount',  width: 100  },
			           	{ name: 'publish', width: 100, formatter:operationPublish},
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
		
		function operationPublish(cellvalue, options, rowObject){
			if(cellvalue==true){
				return "<span class='label label-success'>公开</span>";
			}else{
				return "<span class='label label-danger'>隐私</span>";
			}
		}
		
		function operation(cellvalue, options, rowObject) {
			var modifyOperation = "<shiro:hasPermission name='user:modify'><a id='operation1' href='${root}/blog/channel/input/"+cellvalue+"' ><span class='glyphicon glyphicon-edit'></a></shiro:hasPermission>";
			var deleteOPeration = "<shiro:hasPermission name='user:delete'><a id='operation2' href='javascript:;' onclick='deleteChannel("+cellvalue+")' ><span class='glyphicon glyphicon-trash'></span></a></shiro:hasPermission>";
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
	function deleteChannel(id){
		$('#deleteConfirmModal').modal({
		 	 keyboard: true
		});
		$("#deleteConfirmModalClick").click(function(){
			$.ajax({
				url:"${root}/console/cms/channel/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					//加载角色列表
					showMsg("success",result.message);
					
					setTimeout(function(){
						location.href = "${root}/blog/channel";
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
		    	<font style="font-size:30px;float: left;">All Channel</font>
		    	<small style="float: left;padding-top: 20px;padding-left: 10px;">栏目管理</small>
		    	<shiro:user>
					<a title="添加栏目" style="padding-top:12px;padding-left: 20px;margin:0px;float: left;" href="${root}/blog/channel/input/0"><span class="glyphicon glyphicon-plus"></span></a>
		    	</shiro:user>
		    </div>
		    <div class="col-sm-3" >
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