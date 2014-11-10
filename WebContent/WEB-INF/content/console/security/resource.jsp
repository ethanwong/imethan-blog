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
		//ztree参数设置
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
					onClick:clickNode
				}
		};
		//初始化ztree
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
		
		//点击节点事件
		function clickNode(event, treeId, treeNode){
// 			$('#input-resource').css("display","block");
			if(treeNode.root==true){
				$("#isRoot").val("true");
			}else{
				$("#isRoot").val("false");
			}
			$("font").text("Modify ");
			
			$("#id").val(treeNode.id);
			$("#parentId").val(treeNode.parentId);
			$("#name").val(treeNode.name);
			$("#module").val(treeNode.module);
			$("#url").val(treeNode.urls);
			$("#intro").val(treeNode.intro);
			
		};
		
		
		//页面加载时初始化脚本
		$(document).ready(function () {
			
			//初始化ztree
			initZtree();
				
		});
		
		//点击添加根节点
		function inputRootResource(){
			$("font").text("Add root");
			$("#isRoot").val("true");
			$('#input-title').css("display","block");
			
			clearForm();

		};
		
		//提交表单
		function submitForm(){
			$.ajax({
				url:"${root}/console/security/resource/save?name="+$("#name").val()+"&module="+$("#module").val()+"&url="+$("#url").val()+"&intro="+$("#intro").val()+"&root="+$("#isRoot").val()+"&id="+$("#id").val()+"&parentId="+$("#parentId").val(),
				type:"POST",
				dateType:"json",
				success:function(msg){
					showMsg("success","操作成功");
					
					//初始化ztree
					initZtree();
				},
				error:function(){
					showMsg("error","操作失败");
				}
			});
		};
		
		//清除表单
		function clearForm(){
			$("#id").val("");
			$("#name").val("");
			$("#module").val("");
			$("#url").val("");
			$("#intro").val("");
			$("#parentId").val("");
		};
		
		//删除一条记录
		function deleteOne(){
			$('#deleteConfirmModal').modal({
			 	 keyboard: true
			});
			$("#deleteConfirmModalClick").click(function(){
				$.ajax({
					url:"${root}/console/security/resource/delete/"+$("#id").val(),
					type:"POST",
					dateType:"json",
					success:function(msg){
						var result = eval("(" + msg + ")");
						showMsg("success",result.message);
						
						//初始化ztree
						initZtree();
						
						$("#id").val("");
						$("#name").val("");
						$("#module").val("");
						$("#url").val("");
						$("#intro").val("");
					},
					error:function(msg){
						var result = eval("(" + msg + ")");
						showMsg("error",result.message);
					}
				});
			});
		};
		
		//添加子节点
		function inputSubResource(){
			
			$("#parentId").val($("#id").val());//设置父亲节点ID
			
			$("#id").val("");
			$("#name").val("");
			$("#module").val("");
			$("#url").val("");
			$("#intro").val("");
			
			$("font").text("Add sub");
			$("#isRoot").val("false");
			$('#input-title').css("display","block");
		};
		
	</script>
	
	<div class="row">
		<div class="col-md-3">
			<button type="button" class="btn btn-primary btn-sm" onclick="inputRootResource(this)">Add Root</button>
			<div id="resource-tree" class="ztree"></div>
		</div>
		<div class="col-md-6">
			<h3 style="display: block;margin-top: 0px;"><font>Add root</font> resource</h3>
			<form id="input-form" role="form" action="${root}/console/security/resource/save" method="post">
				<input type="text" id="id" name="id" value="">
				<input type="text" id="parentId" name="parentId" value="">
				<input type="text" id="isRoot" name="root" value="true">
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
					<input type="text" class="form-control required" id="url" placeholder="Enter url" name="url" >
				</div>
				<div class="form-group">
					<label for="exampleInputDescribe">Intro</label>
					<textarea class="form-control required" rows="3" id="intro" placeholder="Enter intro" name="intro" ></textarea>
				</div>
				<button type="button" class="btn btn-default" onclick="submitForm(this)">Submit</button>
				<button type="button" class="btn btn-default" onclick="inputSubResource(this)">Add Sub</button>
				<button type="button" class="btn btn-danger" onclick="deleteOne(this)">Delete</button>
			</form>
		</div>
		<div class="col-md-3">
			Permission Manage
		</div>
		
	</div>	
</body>
</html>
