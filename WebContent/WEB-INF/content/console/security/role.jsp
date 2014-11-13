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
			loadRoleList();
		});
		
		//加载角色列表
		function loadRoleList(){
			$.ajax({
				url:"${root}/console/security/role/json",
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$.each(result, function(i, item) {
						if(i==0){
							 $(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
							 setDetail(item.id);//默认展开第一个角色信息
						}else{
							 $(".list-group").append("<a id='a"+i+"' href='javascript:;s' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
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
					showLine: true
				},
				check: {
					enable: true
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
					var resources = result.resources;
					var zNodes = resources;
						
					$.fn.zTree.init($("#role-resource-tree"), setting, eval(zNodes));
				}
			});
		};
		
		//点击节点复选框事件
		function onCheck(e, treeId, treeNode) {
			$(".panel-title").html("");
			var zTree = $.fn.zTree.getZTreeObj("role-resource-tree");
			
			var checkedNodes = zTree.getCheckedNodes(true);
			$.each(checkedNodes, function(i, item) {
				var info = "("+item.nodeType+"-"+item.name+"-"+item.name+")";
	 			$(".panel-title").append(info);
	 			$(".panel-title").append(",");
			});
		}	
		
	</script>
	
	<div class="row">
		<div class="col-md-3">
			<button type="button" class="btn btn-primary btn-sm" onclick="">Add Role</button>
			<br>
			<div class="list-group" style="padding-top: 10px;">
			
			</div>
		</div>
		<div class="col-md-9">
			<h3 style="display: block;margin-top: 0px;">Modify role</h3>
				<input type="text" id="id" name="id" value="">
				<div class="form-group">
					<label for="exampleInputTitle">Name</label>
					<input type="text" class="form-control required" id="name" placeholder="Enter name" name="name" >
				</div>
				<div class="form-group">
					<label for="exampleInputTitle">Intro</label>
					<input type="text" class="form-control required" id="intro" placeholder="Enter intro" name="intro" >
				</div>
				<div class="form-group">
					<label for="exampleInputTitle">Resource And Permission</label>
					
					<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 class="panel-title">
						    
						    </h3>
						  </div>
						  <div class="panel-body">
						   <div id="role-resource-tree" class="ztree"></div>
						  </div>
					</div>
					
				</div>
				<button type="button" class="btn btn-default" onclick="">Submit</button>
				<button type="button" class="btn btn-danger" onclick="">Delete</button>
		</div>
	</div>

</body>
</html>