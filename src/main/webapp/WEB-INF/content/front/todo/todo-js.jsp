<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		//加载todo列表
		loadTodo(1);
	});
	
	//添加todo
	function inputTodo(object){
		location.href = "${root}/todo/input/"+$("#itemId").val();
	};
	
	//设置item列表
	function setItemList(checkItemId){
		$("#todoItemId").html("");
		$.ajax({
			url:"${root}/todoitem/json",
			type:"POST",
			dateType:"json",
			success:function(data){
				
				var result = eval("(" + data + ")");
				$.each(result, function(i, item) {
					if(checkItemId == item.id){
						$("#todoItemId").append("<option value='"+item.id+"' selected='selected'>"+item.name+"</option>");
					}else{
						$("#todoItemId").append("<option value='"+item.id+"'>"+item.name+"</option>");
					}
					
				});
			}
		});
	}
	
	//保存todo信息
	function saveTodo(){
		if($("#todoForm").valid()){
			var todo = $("#todo").val();
			var todoItemId = $('#inputModal').find("#todoItemId").val();
			$.ajax({
				type:"POST",
				url:"${root}/todo/save",
				data: "content="+encodeURIComponent(todo)+"&todoItem.id="+todoItemId,
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					
					$("#todo").val("");
					$('#inputModal').modal('toggle');
					
					addWarm(result.success,result.message);
					setTimeout(function(){
						loadTodo(1);
						$(".addWarm").html("");
					},2000);
				}
			});
		}
	};
	
	//加载todo列表
	function loadTodo(page){
		$('#loader').show();
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
		var finish = $("#finishValue").val();
		var itemId = $("#itemId").val();
		
		$("#todo-list").html("");
		$.ajax({
			url:"${root}/todo/json/"+page+"?beginTime="+beginTime+"&endTime="+endTime+"&finish="+finish+"&itemId="+itemId,
			type:"POST",
			dateType:"json",
			success:function(data){
				
				var result = eval("(" + data + ")");
				
				$.each(result.rows, function(i, item) {
					var todo = generateTodo(item.id,item.content,item.createTime,item.finish,item.nextOrderNo,item.previousOrderNo);
					$("#todo-list").append(todo);
				});
				console.log("result.records:"+result.records);
				console.log("result.size:"+result.size);
				$(".pager").html("");
				if(result.records>result.size){
					// 处理上页和下页按钮
					var next = result.next;
					var previous = result.previous;
					var page = result.page;
					
					$(".pager").html("");
					var disabled = "class='disabled'";
					var nextButton = "";
					var previousButton = "";
					
					if(previous ==  true){
						previousButton ="<li><a href='#todoList' onclick='loadTodo("+(page-1)+")'>Previous</a></li>";
					}else{
						previousButton ="<li class='disabled'><a href='#todoList'>Previous</a></li>";
					}
					
					if(next == true){
					    nextButton = "<li><a href='#todoList' onclick='loadTodo("+(page+1)+")'>Next</a></li>";
					}else{
						nextButton ="<li class='disabled'><a href='#todoList'>Next</a></li>";
					}
					
					$(".pager").append(previousButton);
					
					<c:if test="${isNormal}">
						$(".pager").append("&nbsp;&nbsp;");
						$(".pager").append("<li><a>Total:"+result.records+"</a></li>");
						$(".pager").append("&nbsp;&nbsp;");
						$(".pager").append("<li><a>Page:"+page+"/"+result.total+"</a></li>");
					</c:if>
					
					$(".pager").append("&nbsp;&nbsp;");
					$(".pager").append(nextButton);
				}
				if(result.records==0){
					$("#todo-list").append("<tr class='warning'><td>暂无todo信息</td></tr>");
				}
				
				$("#page").val(result.page);
				
				$('#loader').hide();
			}
		});
	};
	
	//生成todo行
	function generateTodo(id,content,createTime,finish,nextOrderNo,previousOrderNo){
		var star = "<span class='icon-star'></span>";
		if(finish == false){
			star = "<span class='icon-star-empty'></span>";
		}
		var todo = ""+
					"<tr id='tr"+id+"' onclick='active(this)' onmouseenter='showMenu(this)' onmouseleave='hiddenMenu(this)' >"+
						"<td width='20px;' id="+id+" finish="+finish+">"+star+"</td>"+
						"<td id='content' previousOrderNo='"+previousOrderNo+"' nextOrderNo='"+nextOrderNo+"'><span>"+content+"</span></td>"+
						"<td width='80px;'>"+createTime+"</td>"+
					"</tr>";
		return todo;
	};
	
	//管理菜单
	var menu = "<shiro:user>"+
				"<span class='btn-group' style='float:right' >"+
				   	"<a href='#todoList' onclick='changeFinish(this)'><span class='icon-ok' style='color:#5cb85c;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='orderUp(this)'><span class='icon-arrow-up' style='color:#337ab7;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='orderDown(this)'><span class='icon-arrow-down' style='color:#f0ad4e;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='updateOne(this)'><span class='icon-edit' style='color:#5bc0de;'></span></a>&nbsp;&nbsp;"+
				    "<a href='#todoList' onclick='deleteTodo(this)'><span class='icon-trash' style='color:#d9534f;'></span></a>"+
				"</span>"+
				"</shiro:user>";
	
	//展现菜单
	function showMenu(object){
		$(object).find("#content").append(menu);
	};
	
	//隐藏菜单
	function hiddenMenu(object){
		$(object).find("#content").find(".btn-group").remove();
	}
	
	//检索todo
	//选中todo类型
	function changeType(object){
		var finish = $(object).html();
		$("#finish").html(finish+"&nbsp;<span class='caret'></span>");
		$("#finishValue").val(finish);
		
		loadTodo(1);
	};
	
	//选中todo行
	function active(object){
		$("tr").attr("class","");
		$(object).attr("class","info");
	};
	
	//更新是否完成
	function changeFinish(object){
		var id = $(".info").find("td:first").attr("id");
		var finish = $(".info").find("td:first").attr("finish");
		$.ajax({
			url:"${root}/todo/finish/"+id+"/"+finish,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				if(finish == 'false'){
					$(".info").find("td:first").html("<span class='glyphicon glyphicon-star'></span>");
					$(".info").find("td:first").attr("finish","true");
				}else{
					$(".info").find("td:first").html("<span class='glyphicon glyphicon-star-empty'></span>");
					$(".info").find("td:first").attr("finish","false");
				};
				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
	};

	//删除todo
	function deleteTodo(object){
		var id = $(object).parent().parent().parent().find("td:first").attr("id");
		setDeleteModal().bind('click',function(){
			$.ajax({
				url:"${root}/todo/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					$(".info").remove();

					addWarm(result.success,result.message);
					setTimeout(function(){
						loadTodo($("#page").val());
						$(".addWarm").html("");
					},1500);
				},
				error:function(){
					showError("删除失败");	
				}
			});
		});
		
	};
	
	//更新todo内容
	function updateOne(object){
		var id = $(object).parent().parent().parent().find("td:first").attr("id");
		location.href = "${root}/todo/edit/"+id;
	};
	
	//提升排序
	function orderUp(){
		var id = $(".info").find("td:first").attr("id");
		var nextOrderNo = $(".info").find("#content").attr("nextOrderNo");
		var previousOrderNo = $(".info").find("#content").attr("previousOrderNo");
		
		$.ajax({
			type:"POST",
			url:"${root}/todo/up",
			data: "id="+id+"&nextOrderNo="+nextOrderNo+"&previousOrderNo="+previousOrderNo,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");

				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
	};
	
	//降低排序
	function orderDown(){
		var id = $(".info").find("td:first").attr("id");
		var nextOrderNo = $(".info").find("#content").attr("nextOrderNo");
		var previousOrderNo = $(".info").find("#content").attr("previousOrderNo");
		
		$.ajax({
			type:"POST",
			url:"${root}/todo/down",
			data: "id="+id+"&nextOrderNo="+nextOrderNo+"&previousOrderNo="+previousOrderNo,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
		
				addWarm(result.success,result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
					$(".addWarm").html("");
				},2000);
			}
		});
	};
	
	//添加提醒
	function addWarm(isSuccess,message){
		var messageType = "info";
		if(isSuccess == 'false'){
			messageType = "danger";
		};
		$(".addWarm").html("<p class='bg-"+messageType+"' style='padding: 8px;display: inline;float: right;margin:0px;width:100%;'>"+message+"</p>");
	};
	
	//重置检索
	function resetPage(){
		location.reload();
	};
	
	//选择item
	function checkItem(object,itemId,itemName){
		$("#newTodo").html("New "+itemName+" todo");//替换New item信息
		$("#itemId").val(itemId);//设置item参数
		loadTodo($("#page").val());
	};
	
	//选择Guestitem
	function checkGuestItem(object,itemId,itemName){
		$("#newTodo").html(""+itemName+" todo");//替换New item信息
		$("#itemId").val(itemId);//设置item参数
		loadTodo($("#page").val());
	};

</script>