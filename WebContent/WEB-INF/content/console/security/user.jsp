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
			autoheight : true,
			height : 230,
			rowNum: 10,
			rowList: [10, 20, 30],
			colNames: ['Nickname','Username', 'Rolename','Password', 'CreateTime','操作'],
			colModel: [	
			           	{ name: 'nickname',  width: 150, align: "center" },
			           	{ name: 'username',  width: 150, align: "center" },
			           	{ name: 'roles', width: 150, align: "center",formatter:operationRoles },
						{ name: 'password', width: 150, align: "center" },
						{ name: 'createTime', width: 150, align: "center"},
						{ name: 'id', width: 200, align: "center",formatter:operation}
					  ],
			pager: jQuery('#pager'),
// 			viewrecords: true,
// 			multiselect : true,
			rownumbers : true,
			caption: "User"
		});
		
		function operationRoles(cellvalue, options, rowObject){
			var rolenames = "";
			$.each(cellvalue, function(i, item) {
				if(i != 0){
					rolenames += ",";
				}
				rolenames += item.name;
			});
			return rolenames;
		};
		
		function operation(cellvalue, options, rowObject) {
			var modifyOperation = "<shiro:hasPermission name='user:modify'><a id='operation1' href='javascript:;' onclick='modifyUser("+cellvalue+")' >Modify</a></shiro:hasPermission>";
			var deleteOPeration = "<shiro:hasPermission name='user:delete'><a id='operation2' href='javascript:;' onclick='deleteUser("+cellvalue+")' >Delete</a></shiro:hasPermission>";
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
	
	//修改
	function modifyUser(id){
		//记载用户信息
		$.ajax({
			url:"${root}/console/security/user/detail/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				var roleId = result.roleId;
				
				$('#modifyUserModal').modal(
					$("#modifyUserModal").find("#id").val(result.id),
					$("#modifyUserModal").find("#nickname").val(result.nickname),
					$("#modifyUserModal").find("#username").val(result.username),
					$("#modifyUserModal").find("#password").val(result.password)
				);
				
				//加载角色信息
				$.ajax({
					url:"${root}/console/security/role/json",
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						$("#roleId").html("");
						$.each(result, function(i, item) {
							if(roleId == item.id){
								$("#roleId").append("<option selected='selected' value='"+item.id+"'>"+item.name+"</option>");
							}else{
								$("#roleId").append("<option value='"+item.id+"'>"+item.name+"</option>");
							}
							
						});
					}
				});
			}
		});
	};
	
	//添加
	function inputUser(){
		$('#modifyUserModal').modal(
				$("#modifyUserModal").find("#id").val(""),
				$("#modifyUserModal").find("#nickname").val(""),
				$("#modifyUserModal").find("#username").val(""),
				$("#modifyUserModal").find("#password").val("")
			);
			
			//加载角色信息
			$.ajax({
				url:"${root}/console/security/role/json",
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$("#roleId").html("");
					$.each(result, function(i, item) {
// 						$("#roleinfo").append("<input type='checkbox' name='roleId' value='"+item.id+"'>"+item.name);
						$("#roleId").append("<option value='"+item.id+"'>"+item.name+"</option>");
					});
				}
			});
	}
	
	//保存
	function saveUser(){
		if($("#inputForm").valid()){
			var id = $("#modifyUserModal").find("#id").val();
			var nickname = $("#modifyUserModal").find("#nickname").val();
			var username = $("#modifyUserModal").find("#username").val();
			var password = $("#modifyUserModal").find("#password").val();
			var roleId = $("#modifyUserModal").find("#roleId").val();
			
			$.ajax({
				url:"${root}/console/security/user/save?roleId="+roleId+"&id="+id+"&username="+username+"&password="+password+"&nickname="+nickname,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$('#modifyUserModal').modal('toggle');
					showMsg("success",result.message);
					//重新加载用户恓
					//update jqGrid date
// 					$('#list').setGridParam({
// 						postData:{'resourceId':treeNode.id},
// 						url: '${root}/console/security/permission/json',
// 						datatype: "json",
// 					});
					$('#list').trigger('reloadGrid');
					
				}
			});
		}
	}
	
	//删除
	function deleteUser(id){
		$('#deleteConfirmModal').modal({
		 	 keyboard: true
		});
		$("#deleteConfirmModalClick").click(function(){
			$.ajax({
				url:"${root}/console/security/user/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					//加载用户列表
					$('#list').trigger('reloadGrid');
					showMsg("success",result.message);
				}
			});
		});
	}
	
	
	</script>
	
	
	
	<div class="row">
		<div class="col-md-12">
			<shiro:hasPermission name="user:input">  
				<button type="button" class="btn btn-primary btn-sm" onclick="inputUser(this)" >Add User</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="user:list">  
				<div style="height: 10px;"></div>
				<table id="list"></table>
				<div id="pager"></div>
			</shiro:hasPermission>
		</div>
	</div>
	
	
	<div class="modal fade" id="modifyUserModal" tabindex="-1" role="dialog" aria-labelledby="modifyUserModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modify user</h4>
				</div>
				<div class="modal-body">
					<form role="form"  method="post" action="" id="inputForm">
						<input type="hidden"  name="id" id="id" value="">
						<div class="modal-body">
								<div class="form-group">
							    <label for="exampleInputEmail1">Nickname</label>
							    <input type="text" class="form-control required" id="nickname" name="nickname" placeholder="Enter nickname" value="">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail1">Username</label>
							    <input type="text" class="form-control required" id="username" name="username" placeholder="Enter username" value="">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail1">Password</label>
							    <input type="text" class="form-control required" id="password" name="password" placeholder="Enter password" value="">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail1">Rolename</label>
							    <select id="roleId" name="roleId" class="form-control required">
							    </select>
							  </div>
<!-- 							  <div class="checkbox"> -->
<!-- 							    <label id="roleinfo"> -->
<!-- 							      <input type="checkbox" name="roleId" value=""> -->
							    </label>
<!-- 							  </div> -->
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"  onclick="saveUser()" >Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>