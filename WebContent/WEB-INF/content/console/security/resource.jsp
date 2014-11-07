<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
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
		
		function initZtree(){
			$.ajax({
				url:"${root}/console/security/resource/json",
				type:"POST",
				success:function(msg){
					var zNodes = msg;
					$.fn.zTree.init($("#resource-tree"), setting, eval("(" + zNodes + ")"));
				}
			});
		};
		

		function inputResource(event, treeId, treeNode){
			if(treeNode.root == true){
				$('#input-resource').css("display","block");
				$("#parentId").attr("value",treeNode.id);
				$('font').text("child");
				
				$('#table').css("display","none");
			}else{
				$('#input-resource').css("display","none");
				
				//update jqGrid date
				$('#table').css("display","block");
				$('#list').setGridParam({
					postData:{'resourceId':treeNode.id},
					url: '${root}/console/security/permission/json',
					datatype: "json",
				});
				$('#list').trigger('reloadGrid');
			}
		};
		
		//jqGrid生成脚本
		$(document).ready(function () {
			
			//初始化ztree
			initZtree();
			
			//初始化jqGrid
			jQuery("#list").jqGrid({
				postData:{'resourceId':''},
				url: '${root}/console/security/permission/json',
				datatype: "json",
				mtype: 'POST',
				autowidth : true,
				rowNum: 10,
				rowList: [10, 20, 30],
				colNames: ['Name', 'Intro', 'CreateTime','操作'],
				colModel: [	{ name: 'name',  width: 150, align: "center" },
							{ name: 'intro', width: 150, align: "center" },
							{ name: 'createTime', width: 150, align: "center"},
							{ name: 'id', width: 200, align: "center",formatter:operation}
						  ],
				pager: jQuery('#pager'),
				viewrecords: true,
				multiselect : true,
				rownumbers : true,
				caption: "Permission"
			});
			
			function operation(cellvalue, options, rowObject) {
				return "查看"+cellvalue+rowObject.id;
			};
			
			// Setup buttons
			jQuery("#list").jqGrid('navGrid', '#pager', {
				edit : false,
				add : false,
				del : false,
				search : false
			}, {
				height : 200,
				reloadAfterSubmit : true
			});			
		});
		
		//点击添加根节点
		function inputRootResource(){
			$('#input-resource').css("display","block");
			$("#parentId").attr("value","");
			$('font').text("root");
			
			$('#table').css("display","none");
		};
		
		//提交表单
		function submitForm(){
			  // data: "name=John&location=Boston", //第一种方式传参
			  // data: {name:"John",location:"Boston"}  //第二种方式传参
			  // data: {foo:["bar1", "bar2"]} 转换为 '&foo=bar1&foo=bar2'
// 			  alert();
			$.ajax({
				url:"${root}/console/security/resource/save?name="+$("#name").val()+"&module="+$("#module").val()+"&url="+$("#url").val()+"&intro="+$("#intro").val()+"&parentId="+$("#parentId").val(),
				type:"POST",
				dateType:"json",
// 				date:{name:$("#name").val(),module:$("#module").val(),url:$("#url").val(),intro:$("#intro").val()},
				success:function(msg){
					showMsg("success","操作成功");
					
					//初始化ztree
					initZtree();
					$("#name").val("");
					$("#module").val("");
					$("#url").val("");
					$("#intro").val("");
				},
				error:function(){
					showMsg("error","操作失败");
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
				
			<div id="input-resource" style="display: block;">
			
				<h1>Add a <font>root</font> resource</h1>
				<mvcform:form id="input-form" role="form" action="${root}/console/security/resource/save" method="post" commandName="channel">
					<input type="text" id="parentId" name="parentId" value="">
					<div class="form-group">
						<label for="exampleInputTitle">Name</label>
						<input type="text" class="form-control required" id="name" placeholder="Enter name" name="name" >
						<mvcform:errors path="name"></mvcform:errors>
					</div>
					<div class="form-group">
						<label for="exampleInputTitle">Module</label>
						<input type="text" class="form-control required" id="module" placeholder="Enter module" name="module" >
					</div>
					<div class="form-group">
						<label for="exampleInputTitle">Url</label>
						<input type="text" class="form-control required" id="url" placeholder="Enter url" name="url" >
					</div>
					<div class="form-group">
						<label for="exampleInputDescribe">Intro</label>
						<textarea class="form-control required" rows="3" id="intro" placeholder="Enter intro" name="intro" ></textarea>
					</div>
					<button type="button" class="btn btn-default" onclick="submitForm(this)">Submit</button>
				</mvcform:form>
			</div>
			
			<div id="table" style="display: none;">
				<table id="list"></table>
				<div id="pager"></div>
			</div>	
			
		</div>
		
	</div>	
</body>
</html>
