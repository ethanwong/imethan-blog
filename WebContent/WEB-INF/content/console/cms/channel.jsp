<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>

<body>
	<script type="text/javascript">
		//页面加载时初始化脚本
		$(document).ready(function () {
			//加载栏目列表
			reloadChannelList();
		});
		
		//加载栏目列表
		function reloadChannelList(checkedId){
			$(".list-group").html("");
			$.ajax({
				url:"${root}/console/cms/channel/json",
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$.each(result, function(i, item) {
						if(checkedId != undefined){
							if(item.id == checkedId){
								$(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
								 setDetail(item.id);//展开选中栏目信息
							}else{
								$(".list-group").append("<a id='a"+i+"' href='javascript:;' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
							}
						}else{
							if(i==0){
								 $(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
								 setDetail(item.id);//默认展开第一个栏目信息
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
		
		//设置栏目详情
		function setDetail(id){
			$.ajax({
				url:"${root}/console/cms/channel/detail/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$("#id").val(result.id);
					$("#name").val(result.name);
					$("#intro").val(result.intro);
					$("#deleteButton").css("display","inline");
				}
			});
		};
		
		function inputChannel(object){
			$("h3").text("Add channel");
			$("#deleteButton").css("display","none");
			$("#id").val("");
			$("#name").val("");
			$("#intro").val("");
		};
		
		
		
		//保存栏目
		function saveChannel(object){
			if($("#input-form").valid()){
				var id = $("#id").val();
				var name = $("#name").val();
				var intro = $("#intro").val();
				$.ajax({
					url:"${root}/console/cms/channel/save?id="+id+"&name="+name+"&intro="+intro,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						var messageType = "success";
						if(result.success == false){
							messageType = "error";
						};
						var checkedId = result.entity.id;
						$("#id").val(checkedId);
						//加载角色列表
						reloadChannelList(checkedId);
						
						showMsg(messageType,result.message);
						
					}
				});
			};
		};
		
		//删除栏目
		function deleteChannel(object){
			$('#deleteConfirmModal').modal({
			 	 keyboard: true
			});
			$("#deleteConfirmModalClick").click(function(){
				var id = $("#id").val();
				$.ajax({
					url:"${root}/console/cms/channel/delete/"+id,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						//加载角色列表
						reloadChannelList();
						showMsg("success",result.message);
					}
				});
			});
		};
	</script>
	<div class="row">
		<div class="col-md-3">
			<button type="button" class="btn btn-primary btn-sm" onclick="inputChannel(this)">Add Channel</button>
			<div class="list-group" style="padding-top: 10px;">
				<a href="#" class="list-group-item active">Link</a>
				<a href="#" class="list-group-item">Link</a> 
			</div>
		</div>
		<div class="col-md-9">
			<h3 style="display: block;margin-top: 0px;">Modify channel</h3>
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
				
				<button type="button" class="btn btn-default" onclick="saveChannel(this)">Submit</button>
				<button id="deleteButton" type="button" class="btn btn-danger" onclick="deleteChannel(this)">Delete</button>
			</form>
		</div>
	</div>
</body>
</html>
