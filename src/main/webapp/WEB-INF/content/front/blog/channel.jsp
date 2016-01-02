<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Channel:ImEthan独立博客:Full Stack Engineer</title>
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
			colNames: ['Name','IsPublish', 'ArticleAmount','OrderNo', 'CreateTime','操作'],
			colModel: [	
			           	{ name: 'name',  width: 200 },
			           	{ name: 'publish', width: 80, formatter:operationPublish},
			           	{ name: 'articleAmount',  width: 100  },
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
				return "<span class='label label-info'>公开</span>";
			}else{
				return "<span class='label label-danger'>隐私</span>";
			}
		}
		
		function operation(cellvalue, options, rowObject) {
			var modifyOperation = "<shiro:hasPermission name='user:modify'><a id='operation1' href='${root}/blog/channel/input/"+cellvalue+"' ><i class='icon-edit'></i></a></shiro:hasPermission>";
			var deleteOPeration = "<shiro:hasPermission name='user:delete'><a id='operation2' href='javascript:;' onclick='deleteChannel("+cellvalue+")' ><i class='icon-trash'></i></a></shiro:hasPermission>";
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
		layer.confirm('确定要删除吗？', {title: false, closeBtn: 0,icon:0,btn: ['确定','关闭']},
		function(){
				$.ajax({
					url:"${root}/cms/channel/delete/"+id,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						//加载角色列表
						showMsg("success",result.message);
						
						setTimeout(function(){
							location.href = "${root}/blog/channel";
						},1500);
					},
					error:function(){
						showMsg("error","删除失败");	
					}
				});
			}, function(){layer.close();}
		);

	};

</script>
</head>
<body>
<div class="container main">
	  <div class="row">
		    <div class="col-sm-9">
		    	<span class="main-title">Channel Manage</span>
	    		<small class="main-second-title">栏目管理</small>
		    	<shiro:user>
					<a title="添加栏目" class="blog-manage-button" href="${root}/blog/channel/input/0">
						<i class="icon-plus"></i> 添加栏目
					</a>
		    	</shiro:user>
		    </div>
		    <div class="col-sm-3" >
		    	<form class="form-horizontal searchform" role="form">
		    		<input  name="search_title" value="" type="search" class="form-control" placeholder="Search channel" />
		    	</form>
		    </div>
	  </div>
	
	<hr>
	<div class="row">
		<div class="col-md-12" >
			<table id="list"></table>
			<div id="pager"></div>
		</div>
	</div>
</div>
</body>
</html>