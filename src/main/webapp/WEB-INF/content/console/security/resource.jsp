<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Resource|ImEthan|Full Stack Engineer</title>
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
			//加载资源信息
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
			reloadPermission(treeNode.id);//加载授权信息
		};
		
		//页面加载时初始化脚本
		$(document).ready(function () {
			initZtree();//初始化ztree
		});
		
		//点击添加根节点
		function inputRootResource(){
			$("font").text("Add root");
			$("#isRoot").val("true");
			$('#input-title').css("display","block");
			clearForm();//清除表单
		};
		
		//提交保存资源表单
		function submitForm(){
			if($("#input-form").valid()){
				var id = $("#id").val();
				var name = $("#name").val();
				var module = $("#module").val();
				var url = $("#url").val();
				var intro = $("#intro").val();
				var root = $("#isRoot").val();
				var parentId = $("#parentId").val();
				$.ajax({
					url:"${root}/console/security/resource/save?name="+name+"&module="+module+"&url="+url+"&intro="+intro+"&root="+root+"&id="+id+"&parentId="+parentId,
					type:"POST",
					dateType:"json",
					success:function(msg){
						showMsg("success","操作成功");
						//初始化ztree
						initZtree();
						//清除操作表单
						if(id == ""){
							$("#name").val("");
							$("#module").val("");
							$("#url").val("");
							$("#intro").val("");
						}
					},
					error:function(){
						showMsg("error","操作失败");
					}
				});
			}
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
		
		//删除一条资源记录
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
						var messageType = "success";
						if(result.success == false){
							messageType = "error";
						}
						showMsg(messageType,result.message);
						//初始化ztree
						initZtree();
						if(result.success == true){
							$("#id").val("");
							$("#name").val("");
							$("#module").val("");
							$("#url").val("");
							$("#intro").val("");
						}
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
		
		//加载授权信息
		function reloadPermission(resourceId){
			$("#permission").css("display","block");
			$.ajax({
				url:"${root}/console/security/permission/json/"+resourceId,
				type:"POST",
				dateType:"json",
				success:function(data){
					$("#permissionRow").html("");
					var result = eval("(" + data + ")");
					$.each(result, function(i, item) {
			            $("#permissionRow").append(
			            	"<tr>"+
								"<td>"+item.permission+"</td>"+
								"<td><button type='button' class='btn btn-default btn-xs' onclick='modifyPermission("+item.id+")'>Modify</button> <button type='button' class='btn btn-default btn-xs' onclick='deletePermission("+item.id+")'>Delete</button></td>"+
							"</tr>");
			        });
				},
				error:function(data){
					var result = eval("(" + data + ")");
				}
			});
		};
		
		//修改授权
		function modifyPermission(id){
			$.ajax({
				url:"${root}/console/security/permission/detail/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$('#modifyPermissionModal').modal(
						$("#modifyPermissionModal").find("#id").val(result.id),
						$("#modifyPermissionModal").find("#name").val(result.name),
						$("#modifyPermissionModal").find("#permission").val(result.permission)
					);
				}
			});
		};
		
		//添加授权信息
		function inputPermission(){
			$('#modifyPermissionModal').modal(
				$("#modifyPermissionModal").find(".modal-title").html("Add Permission"),
				$("#modifyPermissionModal").find("#id").val(""),
				$("#modifyPermissionModal").find("#name").val(""),
				$("#modifyPermissionModal").find("#permission").val("")
			);
		}
		
		//保存或者更新授权信息
		function savePermission(){
			if($("#inputForm").valid()){
				var id = $("#modifyPermissionModal").find("#id").val();
				var name = $("#modifyPermissionModal").find("#name").val();
				var permission = $("#modifyPermissionModal").find("#permission").val();
				var resourceId = $("#id").val();
				
				$.ajax({
					url:"${root}/console/security/permission/save?id="+id+"&name="+name+"&permission="+permission+"&resourceId="+resourceId,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						reloadPermission(resourceId);//重新加载授权信息
						$('#modifyPermissionModal').modal('toggle');
						showMsg("success",result.message);
					}
				});
			}
		}
		
		//删除授权
		function deletePermission(id){
			$('#deleteConfirmModal').modal({
			 	 keyboard: true
			});
			$("#deleteConfirmModalClick").click(function(){
				var resourceId = $("#id").val();
				$.ajax({
					url:"${root}/console/security/permission/delete/"+id,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						reloadPermission(resourceId);//重新加载授权信息
						showMsg("success",result.message);
					}
				});
			});
		};
	</script>
	
	<div class="row">
		<div class="col-md-3">
			<button type="button" class="btn btn-primary" onclick="inputRootResource(this)">Add Root</button>
			<div id="resource-tree" class="ztree"></div>
		</div>
		<div class="col-md-5">
			<h3 style="display: block;margin-top: 0px;"><font>Add root</font> resource</h3>
			<form id="input-form" role="form" action="${root}/console/security/resource/save" method="post">
				<input type="hidden" id="id" name="id" value="">
				<input type="hidden" id="parentId" name="parentId" value="">
				<input type="hidden" id="isRoot" name="root" value="true">
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
		<div class="col-md-4">
			<div id="permission" style="display: none">
				<button type="button" class="btn btn-primary btn-sm" onclick="inputPermission()">Add Permission</button>
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="200px;">Permission</th>
							<th width="160px;">Manage</th>
						</tr>
					</thead>
					<tbody id="permissionRow">
						
					</tbody>
				</table>
			</div>
		</div>
		
	</div>	
	
	
	<div class="modal fade" id="modifyPermissionModal" tabindex="-1" role="dialog" aria-labelledby="modifyPermissionModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modify permission</h4>
				</div>
				<div class="modal-body">
					<form role="form"  method="post" action="" id="inputForm">
						<input type="hidden"  name="id" id="id" value="">
						<div class="modal-body">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Name</label>
							    <input type="text" class="form-control required" id="name" name="name" placeholder="Enter name" value="">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail1">Permission</label>
							    <input type="text" class="form-control required" id="permission" name="permission" placeholder="Enter permission" value="">
							  </div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"  onclick="savePermission()" >Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>