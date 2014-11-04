<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>
	<!-- ztree begin -->
	<link rel="stylesheet" href="${root}/theme/jtree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${root}/theme/jtree/js/jquery.ztree.all-3.5.js"></script>
	<SCRIPT type="text/javascript">
		var setting = {
				view: {
					showLine: true
				},
				data: {
					key: {
						children: "childrens"
					},
					simpleData: {
						enable: true
					}
				},
				callback:{
					onClick:inputResource
				}
		};
		
		$.ajax({
			url:"${root}/console/security/resource/json",
			type:"POST",
			success:function(msg){
				var zNodes = msg;
				$.fn.zTree.init($("#resource-tree"), setting, eval("(" + zNodes + ")"));
			}
		});

		function inputResource(event, treeId, treeNode){
// 			alert("click"+treeNode.name+"-id:"+treeNode.id+"-isRoot:"+treeNode.root+"-treeId:"+treeId);
			if(treeNode.root == true){
				$('#input-resource').css("display","block");
				$("#parentId").attr("value",treeNode.id);
				$('font').text("child");
				
				$('#permission-table').css("display","none");
			}else{
				$('#input-resource').css("display","none");
				
				//update jqGrid date
				$('#permission-table').css("display","block");
				$('#list').setGridParam({
					postData:{'resourceId':treeNode.id},
					url: '${root}/console/security/permission/json',
					datatype: "json",
				});
				$('#list').trigger('reloadGrid');
			}
		};
	</SCRIPT>
	<!-- ztree end -->
	
	
	<!-- jqgrid begin -->
	<link href="${root}/theme/jqgrid/css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="${root}/theme/jqgrid/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
	<script src="${root}/theme/jqgrid/js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="${root}/theme/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
	<script src="${root}/theme/jqgrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
	<script src="${root}/theme/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			jQuery("#list").jqGrid({
				postData:{'resourceId':''},
				url: '${root}/console/security/permission/json',
				datatype: "json",
				mtype: 'POST',
				colNames: ['Id', 'Name', 'Intro', 'CreateTime'],
				colModel: [{ name: 'id',  width: 40, align: "center"},
							{ name: 'name',  width: 100, align: "center" },
							{ name: 'intro', width: 100, align: "center" },
							{ name: 'createTime', width: 150, align: "center"}],
				rowList: [10, 20, 30],
				viewrecords: true,
				pager: jQuery('#pager'),
				rowNum: 5,
				altclass: 'altRowsColour',
				width: '698px',
				height: 'auto',
				caption: "权限管理"
			}).navGrid('#pager', {add: false, edit: false, del: false,search:false,refresh:true}); 
		});
	</script>
	<!-- jqgrid end -->
	
	<script type="text/javascript">
		function inputRootResource(){
			$('#input-resource').css("display","block");
			$("#parentId").attr("value","");
			$('font').text("root");
			
			$('#permission-table').css("display","none");
		};
		
		function submitForm(){
			  // data: "name=John&location=Boston", //第一种方式传参
			  // data: {name:"John",location:"Boston"}  //第二种方式传参
			  // data: {foo:["bar1", "bar2"]} 转换为 '&foo=bar1&foo=bar2'
			$.ajax({
				url:"${root}/console/",
				type:"POST",
				dateType:"json",
				error:function(){alert('error');},
				date:$("#input-form").serializeArray(),
				success:function(msg){
					alert("success");
					
					showMsg("success","操作成功");
				}
			});
		}
	</script>
	
	<div class="row">
		<div class="col-md-3">
			资源管理
			<div id="resource-tree" class="ztree"></div>
		</div>
		<div class="col-md-9">
			<p><button type="button" class="btn btn-primary btn-sm" onclick="inputRootResource(this)">Add Root Resource</button></p>
				
			<div id="input-resource" style="display: none;">
			
				<h1>Add a <font></font> resource</h1>
				<form id="input-form" role="form" action="${root}/console/security/resource/save" method="post">
					<input type="text" id="parentId" name="parentId" value="">
					<div class="form-group">
						<label for="exampleInputTitle">Name</label>
						<input type="text" class="form-control required" id="name" placeholder="Enter name" name="name" >
					</div>
					<div class="form-group">
						<label for="exampleInputTitle">Module</label>
						<input type="text" class="form-control required" id="module" placeholder="Enter module" name="module" >
					</div>
					<div class="form-group">
						<label for="exampleInputTitle">Url</label>
						<input type="text" class="form-control required" id="module" placeholder="Enter url" name="url" >
					</div>
					<div class="form-group">
						<label for="exampleInputDescribe">Intro</label>
						<textarea class="form-control required" rows="3" placeholder="Enter intro" name="intro" id="intro"></textarea>
					</div>
					<button type="submit" class="btn btn-default" onclick="submitForm(this)">Submit</button>
				</form>
			</div>
			
			<p id="permission-table" style="display: none;">
				<table id="list"></table>
				<div id="pager"></div>
			</p>	
			
		</div>
		
	</div>	
</body>
</html>
