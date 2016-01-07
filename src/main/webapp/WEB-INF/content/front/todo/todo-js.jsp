<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<script src="${root}/theme/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		
		loadTodo(1);//加载todo列表
	});
	
	//加载todo列表
	function loadTodo(page){
		$('#loader').show();
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
		var finish = $("#finishValue").val();
		var itemId = $("#itemId").val();
		
		
		if(beginTime == undefined){beginTime = "";}
		if(endTime == undefined){endTime = "";}
		if(finish == undefined){finish = "";}
		if(itemId == undefined){itemId = "";}
		
		$("#todo-list").html("");
		$.ajax({
			url:"${root}/todo/json/"+page+"?beginTime="+beginTime+"&endTime="+endTime+"&finish="+finish+"&itemId="+itemId,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				//设置内容
				if(result.records==0){
					$("#todo-list").append("<tr class='warning'><td>暂无todo信息</td></tr>");
				}
				$.each(result.rows, function(i, item) {
					var todo = generateTodo(item.id,item.content,item.createTime,item.finish,item.nextOrderNo,item.previousOrderNo);
					$("#todo-list").append(todo);
				});
				
				//设置分页条
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
						previousButton ="<li><a href='javascript:;' onclick='loadTodo("+(page-1)+")'>Previous</a></li>";
					}else{
						previousButton ="<li class='disabled'><a href='#todoList'>Previous</a></li>";
					}
					
					if(next == true){
					    nextButton = "<li><a href='javascript:;' onclick='loadTodo("+(page+1)+")'>Next</a></li>";
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
					"<tr onmouseenter='showMenu(this,"+id+","+previousOrderNo+","+nextOrderNo+","+finish+")' onmouseleave='hiddenMenu(this)' >"+
						"<td width='20px;'>"+star+"</td>"+
						"<td id='content'><span>"+content+"</span></td>"+
						"<td width='80px;'>"+createTime+"</td>"+
					"</tr>";
		return todo;
	};
	
	
	
	//鼠标经过展现管理菜单
	function showMenu(object,id,previousOrderNo,nextOrderNo,finish){
		//管理菜单
		var finishIcon = "<i class='icon-ok' style='color:#5cb85c;'></i>";
		if(finish == true){
			finishIcon = "<i class='icon-remove' style='color:#d9534f;'></i>";
		}
		var menu = "<shiro:user>"+
					"<span class='btn-group' style='float:right' >"+
					   	"<a href='javascript:;' onclick='changeFinish("+id+")'>"+finishIcon+"</a>&nbsp;&nbsp;"+
					    "<a href='javascript:;' onclick='orderUp("+id+","+previousOrderNo+","+nextOrderNo+")'><i class='icon-arrow-up' style='color:#337ab7;'></i></a>&nbsp;&nbsp;"+
					    "<a href='javascript:;' onclick='orderDown("+id+","+previousOrderNo+","+nextOrderNo+")'><i class='icon-arrow-down' style='color:#f0ad4e;'></i></a>&nbsp;&nbsp;"+
					    "<a href='javascript:;' onclick='updateOne("+id+")'><i class='icon-edit' style='color:#5bc0de;'></i></a>&nbsp;&nbsp;"+
					    "<a href='javascript:;' onclick='deleteTodo("+id+")'><i class='icon-trash' style='color:#d9534f;'></i></a>"+
					"</span>"+
					"</shiro:user>";
					
		$(object).find("#content").append(menu);
	};
	
	//鼠标移开隐藏管理菜单
	function hiddenMenu(object){
		$(object).find("#content").find(".btn-group").remove();
	}

	
	//更新是否完成
	function changeFinish(id){
		$.ajax({
			url:"${root}/todo/finish/"+id,
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				showMsg("success",result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
				},1500);
			}
		});
	};

	//添加todo
	function inputTodo(object){
		location.href = "${root}/todo/input/"+$("#itemId").val();
	};
	
	//删除todo
	function deleteTodo(id){
		layer.confirm('确定要删除吗？', {title: false, closeBtn: 0,icon:0,btn: ['确定','关闭']},
		function(){
			$.ajax({
				url:"${root}/todo/delete/"+id,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					showMsg("success",result.message);
					setTimeout(function(){
						loadTodo($("#page").val());
					},1500);
				},
				error:function(){
					showMsg("error","删除失败");
				}
			});
			}, function(){layer.close();}
		);
	};
	
	//更新todo内容
	function updateOne(id){
		location.href = "${root}/todo/edit/"+id;
	};
	
	//提升排序
	function orderUp(id,previousOrderNo,nextOrderNo){
		$.ajax({
			type:"POST",
			url:"${root}/todo/up",
			data: "id="+id+"&nextOrderNo="+nextOrderNo+"&previousOrderNo="+previousOrderNo,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				
				showMsg("success",result.message);
				
				setTimeout(function(){
					loadTodo($("#page").val());
				},1500);
			}
		});
	};
	
	//降低排序
	function orderDown(id,previousOrderNo,nextOrderNo){
		$.ajax({
			type:"POST",
			url:"${root}/todo/down",
			data: "id="+id+"&nextOrderNo="+nextOrderNo+"&previousOrderNo="+previousOrderNo,
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				showMsg("success",result.message);
				setTimeout(function(){
					loadTodo($("#page").val());
				},2000);
			}
		});
	};
	
	
	//检索todo
	//选中todo类型
	function changeType(object){
		var finish = $(object).html();
		$("#finish").html(finish+"&nbsp;<span class='caret'></span>");
		$("#finishValue").val(finish);
		
		loadTodo(1);
	};
	
	
	//登录模式选择item
	function checkItem(object,itemId,itemName){
		$("#newTodo").html("Add "+itemName+" todo");//替换New item信息
		$("#itemId").val(itemId);//设置item参数
		loadTodo($("#page").val());
	};
	
	//访客模式选择item
	function checkGuestItem(object,itemId,itemName){
		$("#newTodo").html(""+itemName+" todo");//替换New item信息
		$("#itemId").val(itemId);//设置item参数
		loadTodo($("#page").val());
	};

</script>