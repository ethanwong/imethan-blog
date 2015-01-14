<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	
//页面加载时初始化脚本
$(document).ready(function () {
	
	loadMessage(1);
	
});

//加载消息
function loadMessage(page){
	$.ajax({
		url:"${root}/console/message/"+page,
		type:"POST",
		dateType:"json",
		success:function(data){
			var result = eval("(" + data + ")");
			$(".messageList").html("");
			$.each(result.rows, function(i, item) {
				var messageLine = ""+
								"<tr>"+
									"<td>"+item.name+"</td>"+
									"<td>"+item.email+"</td>"+
									"<td>"+item.content+"</td>"+
									"<td>"+item.createTime+"</td>"+
								"</tr>";
				$(".messageList").append(messageLine);
			});
			
			
			// 处理上页和下页按钮
			var next = result.next;
			var previous = result.previous;
			var page = result.page;
			
// 			console.log("---next:"+next);
// 			console.log("---previous:"+previous);
			
			$(".pager").html("");
			var disabled = "class='disabled'";
			var nextButton = "";
			var previousButton = "";
			
			if(previous ==  true){
				previousButton ="<li><a href='#' onclick='loadMessage("+(page-1)+")'>Previous</a></li>";
// 				 console.log("---previousButton:"+previousButton);
			}else{
				previousButton ="<li class='disabled'><a href='#'>Previous</a></li>";
// 				console.log("---previousButton:"+previousButton);
			}
			
			if(next == true){
			    nextButton = "<li><a href='#' onclick='loadMessage("+(page+1)+")'>Next</a></li>";
// 			    console.log("---nextButton:"+nextButton);
			}else{
				nextButton ="<li class='disabled'><a href='#'>Next</a></li>";
// 				console.log("---nextButton:"+nextButton);
			}
			
			$(".pager").append(previousButton);
			$(".pager").append("&nbsp;&nbsp;");
			$(".pager").append(nextButton);
		}
	});
};
	
</script>
</head>
<body>
	<h2 class="sub-header">Message</h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Content</th>
				<th>Time</th>
			</tr>
		</thead>
		<tbody class="messageList">
		</tbody>
	</table>
	<nav>
	  <ul class="pager">
	  	
	  </ul>
	</nav>
</body>
</html>