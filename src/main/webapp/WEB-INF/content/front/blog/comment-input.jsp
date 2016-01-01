<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
//页面加载时初始化脚本
$(document).ready(function () {
	loadCommnet(1);
	
	$("#showCommentInputBox").click(function(){
		$("#commentInputBox").css("display","block");
	});
});
//保存评论
function saveComment(){
	if($("#inputForm").valid()){
		var extendId = $("#extendId").val();
		var username = $("#username").val();
		var email = $("#email").val();
		var comment = $("#comment").val();
		
		$.ajax({
			type:"POST",
			url:"${root}/comment/cms/save",
			data: "username="+username+"&email="+email+"&content="+encodeURIComponent(comment)+"&extendId="+extendId,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				$(".addWarm").html("<p class='bg-primary' style='padding: 8px;display: inline;'>"+result.message+"</p>");
				
				setTimeout(function(){
					$(".addWarm").html("");
					$("#username").val("");
					$("#email").val("");
					$("#comment").val("");
					
					loadCommnet(1);
				},1500);
			}
		});
	}
};

//生成评论内容
function generateComment(username,createTime,content){
	var comment =   ""+
					"<div class='comment'>"+
						"<div class='panel panel-default'>"+
							"<div class='panel-body'>"+
								"<span style='float: left;'><span class='glyphicon glyphicon-user'></span> "+username+"</span>"+
								"<span style='float: right;'><span  class='glyphicon glyphicon-calendar'></span> "+createTime+"</span>"+
								"<br>"+
								"<div style='display: inline-block;padding-top: 10px;'>"+content+"</div>"+
							"</div>"+
						"</div>"+
					"</div>";
	return comment;
};

//加载评论
function loadCommnet(page){
	$(".commentList").html("");
	var extendId = $("#extendId").val();
	$.ajax({
		url:"${root}/comment/cms/"+page+"?extendId="+extendId,
		type:"POST",
		dateType:"json",
		success:function(data){
			var result = eval("(" + data + ")");
			
			$.each(result.rows, function(i, item) {
				var comment = generateComment(item.username,item.createTime,item.content);
				$(".commentList").append(comment);
			});
			
			if(result.total>result.size){
				// 处理上页和下页按钮
				var next = result.next;
				var previous = result.previous;
				var page = result.page;
				
				$(".pager").html("");
				var disabled = "class='disabled'";
				var nextButton = "";
				var previousButton = "";
				
				if(previous ==  true){
					previousButton ="<li><a href='#comments' onclick='loadCommnet("+(page-1)+")'>Previous</a></li>";
				}else{
					previousButton ="<li class='disabled'><a href='#'>Previous</a></li>";
				}
				
				if(next == true){
				    nextButton = "<li><a href='#comments' onclick='loadCommnet("+(page+1)+")'>Next</a></li>";
				}else{
					nextButton ="<li class='disabled'><a href='#'>Next</a></li>";
				}
				
				$(".pager").append(previousButton);
				$(".pager").append("&nbsp;&nbsp;");
				$(".pager").append(nextButton);
				
			}
			if(result.total==0){
				$(".commentList").append("暂无评论");
			}

		}
	});
	
};
</script>
	<div class="row" id="comments">
		<div class="col-md-12" >
			<div class="row">
				<div class="col-md-6"><h4><strong>Comments</strong></h4></div>
				<div class="col-md-6"><p style="float: right;"><a href="#commentInputBox" id="showCommentInputBox" class="btn btn-default btn-sm">我要评论</a></p></div>
			</div>
			
			<hr style="margin-top: 0px;padding-top: 0px;">
			<div class="commentList" ></div>
			<nav><ul class="pager"></ul></nav>
					
			<div class="panel panel-default" id="commentInputBox" style="display: none;">
				  <div class="panel-heading">Add Comment <font color="red">*</font>为必填项</div>
				  <div class="panel-body">
					  	<form role="form" method="post" action="" id="inputForm">
					  	  <input id="extendId"  type="hidden" name="extendId" value="${article.id}">
					  	  
						  <div class="form-group">
						    <label for="username">Name<font color="red">*</font></label>
						    <input id="username" name="username"  type="text" class="form-control required" placeholder="Enter name" value="" maxlength="40">
						  </div>
						  <div class="form-group">
						    <label for="emails">Email<font color="red">*</font></label>
						    <input id="email" name="emails"  type="email" class="form-control" placeholder="Enter email" value="" maxlength="40">
						  </div>
						  <div class="form-group">
						    <label for="comment">Comment<font color="red">*</font></label>
						    <textarea id="comment" rows="4" cols="20" class="form-control required" placeholder="Enter comment" name="comment" maxlength="1000"></textarea>
						  </div>
						  
						  <button type="button" class="btn btn-primary" onclick="saveComment()">Save Comment</button>
						  <span class="addWarm"></span>
						</form>
				  </div>
			</div>
		</div>
	</div>

