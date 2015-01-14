<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
<!--
//页面加载时初始化脚本
$(document).ready(function () {
	loadCommnet(1);
});

//保存评论
function saveComment(){
	if($("#inputForm").valid()){
		var extendId = $("#extendId").val();
		var username = $("#username").val();
		var email = $("#email").val();
		var comment = $("#comment").val();
		
		$.ajax({
			url:"${root}/comment/cms/save?username="+username+"&email="+email+"&content="+comment+"&extendId="+extendId,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				$("#username").val("");
				$("#email").val("");
				$("#comment").val("");
				
				$(".addWarm").html("<p class='bg-primary' style='padding: 9px;display: inline;'>"+result.message+"</p>");
				
// 				var comment =  generateComment(result.entity.username,result.entity.createTime,result.entity.content);
// 				var list = $(".commentList").html();
// 				$(".commentList").html("");
// 				$(".commentList").append(comment+list);

				loadCommnet(1);
				
				setTimeout(function(){
					$(".addWarm").html("");
				},2000);
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
			
			if(result.total>0){
				// 处理上页和下页按钮
				var next = result.next;
				var previous = result.previous;
				var page = result.page;
				
//	 			console.log("---next:"+next);
//	 			console.log("---previous:"+previous);
				
				$(".pager").html("");
				var disabled = "class='disabled'";
				var nextButton = "";
				var previousButton = "";
				
				if(previous ==  true){
					previousButton ="<li><a href='#comments' onclick='loadCommnet("+(page-1)+")'>Previous</a></li>";
//	 				 console.log("---previousButton:"+previousButton);
				}else{
					previousButton ="<li class='disabled'><a href='#'>Previous</a></li>";
//	 				console.log("---previousButton:"+previousButton);
				}
				
				if(next == true){
				    nextButton = "<li><a href='#comments' onclick='loadCommnet("+(page+1)+")'>Next</a></li>";
//	 			    console.log("---nextButton:"+nextButton);
				}else{
					nextButton ="<li class='disabled'><a href='#'>Next</a></li>";
//	 				console.log("---nextButton:"+nextButton);
				}
				
				$(".pager").append(previousButton);
				$(".pager").append("&nbsp;&nbsp;");
				$(".pager").append(nextButton);
				
			}else{
				$(".commentList").append("暂无评论");
			}

		}
	});
	
};
//-->
</script>
	<div class="row" id="comments">
		<div class="col-md-9" >
			<h4>Comment list</h4>
			<hr>
			<div class="commentList" >
<!-- 				<div class="comment"> -->
<!-- 					<div class="panel panel-default"> -->
<!-- 						<div class="panel-body"> -->
<!-- 							<span style="float: left;"><span class="glyphicon glyphicon-user"></span> Ethan Wong</span> -->
<!-- 							<span style="float: right;"><span  class='glyphicon glyphicon-calendar'></span> 2015/01/14</span> -->
<!-- 							<br> -->
<!-- 							<div style="display: inline-block;padding-top: 10px;"> -->
<!-- 								这个是评论的内容，这个是评论的内容，这个是评论的内容，这个是评论的内容，这个是评论的内容。这个是评论的内容，这个是评论的内容， -->
<!-- 								这个是评论的内容，这个是评论的内容，这个是评论的内容。这个是评论的内容，这个是评论的内容，这个是评论的内容，这个是评论的内容， -->
<!-- 								这个是评论的内容。这个是评论的内容，这个是评论的内容，这个是评论的内容，这个是评论的内容，这个是评论的内容。 -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<nav>
	  			<ul class="pager">
	  	
	  			</ul>
			</nav>
			<h4>Add Comment</h4>
			<hr>
			<div class="panel panel-default">
				  <div class="panel-body">
					  	<form role="form" method="post" action="" id="inputForm">
					  	  <input id="extendId"  type="hidden" name="extendId" value="${article.id}">
					  	  
						  <div class="form-group">
						    <label for="username">Name</label>
						    <input id="username" name="username"  type="text" class="form-control required" placeholder="Enter name" value="" maxlength="40">
						  </div>
						  <div class="form-group">
						    <label for="emails">Email</label>
						    <input id="email" name="emails"  type="email" class="form-control required" placeholder="Enter email" value="" maxlength="40">
						  </div>
						  <div class="form-group">
						    <label for="comment">Comment</label>
						    <textarea id="comment" rows="5" cols="20" class="form-control required" placeholder="Enter comment" name="comment" maxlength="1000"></textarea>
						  </div>
						  
						  <button type="button" class="btn btn-info" onclick="saveComment()">Submit Comment</button>
						  <span class="addWarm"></span>
						</form>
				  </div>
			</div>
		</div>
	</div>
