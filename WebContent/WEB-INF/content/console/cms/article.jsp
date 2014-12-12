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
			
			console.log(encodeURIComponent("123123123"));
			//加载栏目列表
			reloadChannelList();
			
			//初始化jqGrid
			jQuery("#list").jqGrid({
				url: '${root}/console/cms/article/json/1',
				datatype: "json",
				mtype: 'POST',
				autowidth : true,
				autoheight : true,
				height : 230,
				rowNum: 10,
				rowList: [10, 20, 30],
				colNames: ['Title','CreateTime','操作'],
				colModel: [	
				           	{ name: 'title',  width: 150, align: "center" },
// 				           	{ name: 'channelName',  width: 150, align: "center" },
							{ name: 'createTime', width: 150, align: "center"},
							{ name: 'id', width: 100, align: "center",formatter:operation}
						  ],
				pager: jQuery('#pager'),
//	 			viewrecords: true,
//	 			multiselect : true,
				rownumbers : true,
				caption: "Article"
			});
			
			function operation(cellvalue, options, rowObject) {
				var modifyOperation = "<a id='operation1' href='javascript:;' onclick='modifyArticle("+cellvalue+")' >Modify</a>";
				var deleteOPeration = "<a id='operation2' href='javascript:;' onclick='deleteArticle("+cellvalue+")' >Delete</a>";
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
								reloadArticleList(item.id);//展开选中文章信息
								//设置当前栏目IDs
								 $("#channelId").val(item.id);
							}else{
								$(".list-group").append("<a id='a"+i+"' href='javascript:;' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
							}
						}else{
							if(i==0){
								 $(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
								 reloadArticleList(item.id);//默认展开第一个文章信息
								//设置当前栏目ID
								 $("#channelId").val(item.id);
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
									//展开右侧信息
									reloadArticleList(item2.id);
									//设置当前栏目ID
									$("#channelId").val(item2.id);
								}
							});
							
						}); 
			        });
				},
				error:function(data){
				}
			});
		};
		
		//展开文章列表信息
		function reloadArticleList(channelId){
			//update jqGrid date
			$('#list').setGridParam({
// 				postData:{'channelId':channelId},
				url: '${root}/console/cms/article/json/'+channelId,
				datatype: "json",
			});
			$('#list').trigger('reloadGrid');
			
		};
		
		//添加文章
		function inputArticle(object){
			$('#inputModal').modal(
				$("#inputModal").find("#id").val(""),
				$("#inputModal").find("#title").val(""),
				$("#inputModal").find("h4").html("Input article"),
				$(".ke-edit-iframe").contents().find(".ke-content").html("")
			);
		};
		
		//修改文章
		function modifyArticle(id){
			$(".modal-title").html("Modify article");
			$.ajax({
				url:"${root}/console/cms/article/detail/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$('#inputModal').modal(
						$("#inputModal").find("#id").val(result.id),
						$("#inputModal").find("#title").val(result.title),
// 						$("#inputModal").find("#content").val(result.content)
						$(".ke-edit-iframe").contents().find(".ke-content").html(result.content)
					);
				}
			});
		};
		
		//删除文章
		function deleteArticle(id){
			$('#deleteConfirmModal').modal({
			 	 keyboard: true
			});
			$("#deleteConfirmModalClick").click(function(){
				$.ajax({
					url:"${root}/console/cms/article/delete/"+id,
					type:"POST",
					dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						//刷新文章列表
						var channelId = $("#channelId").val();
						reloadArticleList(channelId);
						showMsg("success",result.message);
					}
				});
			});
		};
		
		//保存文章
		function saveArticle(){
			var content = $("#kindeditorContent").val();
// 			var content = $("#content").val();
// 			content = $.md5(content)
// 			if(content == "" || $.trim(content) == ""){
// 				$("#kindeditorContentError").html("This field is required.");
// 			};
			console.log(content);
			if($("#inputForm").valid()){
				var id = $("#id").val();
				var title = $("#title").val();
				var channelId = $("#channelId").val();
				$.ajax({
					type:"POST",
					url:"${root}/console/cms/article/save",
					data: "id="+id+"&title="+title+"&channel.id="+channelId+"&content="+encodeURIComponent(content),
				    dateType:"json",
					success:function(data){
						var result = eval("(" + data + ")");
						var messageType = "success";
						if(result.success == false){
							messageType = "error";
							showModalMsg(messageType,result.message);
						};
						$('#inputModal').modal('toggle');
						//加载文章列表
						reloadArticleList(channelId);
						showMsg(messageType,result.message);
					}
				});
			};
		};
		
// 		//校验编辑器内容是否为空
// 		function validkindeditorContent(object){
// 			console.log("validKkindeditorContent");
// 			var content = $("#kindeditorContent").val();
// 			if(content == "" || $.trim(content) == ""){
// 				$("#kindeditorContentError").html("This field is required.");
// 			}else{
// 				$("#kindeditorContentError").html("");
// 			}
// 		};
	</script>
	
	<%@ include file="/WEB-INF/content/base/kindeditor.jsp"%>
	
	<div class="row">
		<div class="col-md-3">
			<div class="list-group">
				<a href="#" class="list-group-item">Link</a>
				<a href="#" class="list-group-item active">Link</a>
			</div>
		</div>
		<div class="col-md-9">
			<label class="col-sm-2 control-label" style="padding: 0px;">
				<button type="button" class="btn btn-primary" onclick="inputArticle(this)">Add article</button>
			</label>
			<div class="col-sm-10">
				<form class="form-inline" role="form" action="" method="post">
					<input type="hidden" id="channelId" name="channelId" value="" />
					<input type="text" class="form-control" name="search_LIKE_title" placeholder="Enter title" value="${search_LIKE_title}">
					<button type="submit" class="btn btn-default">Search</button>
				</form>
			</div>
			<div class="col-sm-12" style="padding: 0px;">
				<table id="list"></table>
				<div id="pager"></div>
			</div>
		</div>
	</div>
	
	<div class="modal fade bs-example-modal-lg" id="inputModal"  tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Input article</h4>
				</div>
				<div class="modal-body">
					<!-- 提醒信息 -->
					<div id="modalWarn" class="alert alert-success alert-dismissable" style="display: none">
						<button type="button" class="close" onclick="closemodalWarn(this)">&times;</button>
						<strong></strong>
						<p style="display: inline;"></p>
					</div>
		
					<form role="form"  method="post" action="" id="inputForm">
						<input type="hidden"  name="id" id="id" value="">
						<div class="modal-body">
								<div class="form-group">
							    <label for="exampleInputEmail1">Title</label>
							    <input type="text" class="form-control required" id="title" name="title" placeholder="Enter title" value="">
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail1">Content</label>
<!-- 							    <textarea style="width: 100% !important;" class="form-control required" rows="10" cols="" name="content" id="content" placeholder="Enter content"></textarea> -->
							  	<textarea oninput="validkindeditorContent(this)"  style="width: 100% !important;" class="form-control required" rows="14" placeholder="Enter content" name="content" id="kindeditorContent"></textarea>
								<label id="kindeditorContentError" ></label>
							  </div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"  onclick="saveArticle()" >Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
