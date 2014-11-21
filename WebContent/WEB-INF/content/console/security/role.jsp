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
		
		//页面加载时初始化脚本
		$(document).ready(function () {
			//加载角色列表
			reloadRoleList();
		});
		
		//加载角色列表
		function reloadRoleList(checkedId){
			$(".list-group").html("");
			$.ajax({
				url:"${root}/console/security/role/json",
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$.each(result, function(i, item) {
						if(checkedId != undefined){
							if(item.id == checkedId){
								$(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
								 setDetail(item.id);//展开选中角色信息
							}else{
								$(".list-group").append("<a id='a"+i+"' href='javascript:;' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
							}
						}else{
							if(i==0){
								 $(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
								 setDetail(item.id);//默认展开第一个角色信息
							}else{
								 $(".list-group").append("<a id='a"+i+"' href='javascript:;' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
							};
						}

						
						//绑定点击事件
						$('#a'+i).bind('click', function() { 
							//设置选中样式
							$.each(result, function(j, item2) {
								if(j != i){
									$("#a"+j).attr("class","list-group-item");
								}else{
									$("#a"+j).attr("class","list-group-item active");
								}
							});
							//展开右侧信息
							setDetail(item.id);
						}); 
			        });
				},
				error:function(data){
				}
			});
		};
		
		//ztree参数设置
		var setting = {
				view: {
					showLine: true,
					fontCss : {size:"14"}
				},
				check: {
					enable: true
				},
				data: {
					key: {
						children: "childrens",
						checked: "checked"
					},
					simpleData: {
						enable: true
					}
				},
				callback:{
// 					onClick:clickNode,
					onCheck: onCheck
				}
		};
		
		//设置角色详情
		function setDetail(id){
			$.ajax({
				url:"${root}/console/security/role/view/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$("#id").val(result.id);
					$("#name").val(result.name);
					$("#intro").val(result.intro);
					$("#deleteButton").css("display","inline");
					setResourcePermissionZtree(result.id);
				}
			});
		};
		
		//设置资源授权树
		function setResourcePermissionZtree(roleId){
			$.ajax({
				url:"${root}/console/security/role/resourcepermission/"+roleId,
				type:"POST",
				dateType:"json",
				success:function(data){
					var zNodes = eval("(" + data + ")");
					var zTree = $.fn.zTree.init($("#role-resource-tree"), setting, eval(zNodes));
					
					//设置已经选中节点表单隐藏域信息
					var checkedNodes = zTree.getCheckedNodes(true);
					$.each(checkedNodes, function(i, item) {
						var node = item.nodeType+"-"+item.id;
			 			var source = $("#resourcePermission").val();
			 			var target = source+","+node;
			 			$("#resourcePermission").val(target);
					});
				}
			});
			
		}
		
		//点击节点复选框事件
		function onCheck(e, treeId, treeNode) {
			$("#resourcePermission").val("");
			var zTree = $.fn.zTree.getZTreeObj("role-resource-tree");
			
			var checkedNodes = zTree.getCheckedNodes(true);
			$.each(checkedNodes, function(i, item) {
				var node = item.nodeType+"-"+item.id;
	 			var source = $("#resourcePermission").val();
	 			var target = source+","+node;
	 			$("#resourcePermission").val(target);
			});
		};
		
		//提交表单
		function submitForm(object){
			if($("#input-form").valid()){
				var id = $("#id").val();
				var name = $("#name").val();
				var intro = $("#intro").val();
				var resourcePermission = $("#resourcePermission").val();
				$.ajax({
					url:"${root}/console/security/role/save?id="+id+"&name="+name+"&intro="+intro+"&resourcePermission="+resourcePermission,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						var messageType = "success";
						if(result.success == false){
							messageType = "error";
						};
						var checkedId = id;
						//加载角色列表
						reloadRoleList(checkedId);
						
						showMsg(messageType,result.message);
						
					}
				});
			};
		};
		
		//添加角色
		function inputRole(object){
			$("h3").text("Add role");
			$("#deleteButton").css("display","none");
			$("#id").val("");
			$("#name").val("");
			$("#intro").val("");
			$("#resourcePermission").val("");
			setResourcePermissionZtree(0);
		};
		
		//删除角色
		function deleteRole(){
			$('#deleteConfirmModal').modal({
			 	 keyboard: true
			});
			$("#deleteConfirmModalClick").click(function(){
				var id = $("#id").val();
				$.ajax({
					url:"${root}/console/security/role/delete/"+id,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						//加载角色列表
						reloadRoleList();
						showMsg("success",result.message);
					}
				});
			});
		};
		
		
	</script>
	
	<div class="row">
		<div class="col-md-3">
			<button type="button" class="btn btn-primary btn-sm" onclick="inputRole(this)">Add Role</button>
			<br>
			<div class="list-group" style="padding-top: 10px;">
			
			</div>
		</div>
		<div class="col-md-9">
			<h3 style="display: block;margin-top: 0px;">Modify role</h3>
			<form id="input-form" action="" method="post">
				<input type="hidden" id="id" name="id" value="">
				<div class="form-group">
					<label for="exampleInputTitle">Name</label>
					<input type="text" class="form-control required" id="name" placeholder="Enter name" name="name" >
				</div>
				<div class="form-group">
					<label for="exampleInputTitle">Intro</label>
					<textarea rows="3" cols="20" class="form-control required" id="intro" placeholder="Enter intro" name="intro"></textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputTitle">Resource And Permission</label> 
					<input type="hidden" class="form-control required" id="resourcePermission" name="resourcePermission"  value="">
					<div class="panel panel-default">
						<div class="panel-body">
							<div id="role-resource-tree" class="ztree"></div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-default" onclick="submitForm(this)">Submit</button>
				<button id="deleteButton" type="button" class="btn btn-danger" onclick="deleteRole(this)">Delete</button>
			</form>
		</div>
	</div>

</body>
</html>