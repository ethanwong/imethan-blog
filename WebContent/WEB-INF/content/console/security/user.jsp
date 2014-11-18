<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	//jqGrid生成脚本
	$(document).ready(function () {
		//初始化jqGrid
		jQuery("#list").jqGrid({
			url: '${root}/console/security/user/json',
			datatype: "json",
			mtype: 'POST',
			autowidth : true,
			rowNum: 10,
			rowList: [10, 20, 30],
			colNames: ['Username', 'Password', 'CreateTime','操作'],
			colModel: [	{ name: 'username',  width: 150, align: "center" },
						{ name: 'password', width: 150, align: "center" },
						{ name: 'createTime', width: 150, align: "center"},
						{ name: 'id', width: 200, align: "center",formatter:operation}
					  ],
			pager: jQuery('#pager'),
			viewrecords: true,
// 			multiselect : true,
			rownumbers : true,
			caption: "User"
		});
		
		function operation(cellvalue, options, rowObject) {
			return "查看"+cellvalue+rowObject.id;
		};
		
		// Setup buttons
		jQuery("#list").jqGrid('navGrid', '#pager', {
			edit : true,
			add : false,
			del : false,
			search : false
		}, {
			height : 200,
			reloadAfterSubmit : true
		});
		$(".ui-jqgrid-titlebar-close*").remove();
	});
	</script>
	
	<div class="row">
		<div class="col-md-12">
			<table id="list"></table>
			<div id="pager"></div>
		</div>
	</div>
</body>
</html>