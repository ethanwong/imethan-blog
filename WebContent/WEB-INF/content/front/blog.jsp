<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan</title>
<script type="text/javascript">
	
	//页面加载时初始化脚本
	$(document).ready(function () {
		//加载栏目列表
		reloadChannelList();
		
		
		//滚动加载文章
		$(".articleList").infinitescroll({  
            navSelector: "#navigation",
            nextSelector: "#navigation a",  
            itemSelector: ".articleList" , 
            debug        : true,  
            loading:{
                finishedMsg: '没有更多内容了...',//结束显示信息
                msgText: "正在加载内容...",
                img: '${root}/theme/images/ajax-loader.gif'//loading图片
            },
            dataType: 'json',
            appendCallback: false,
            animate: true,  
            maxPage: 10,
            extraScrollPx: 100,  
			template: function(data) {
                return data;
            }
        }, 
        function(data,opt) {
        	generateArticle(data);
         });
		
	});
	
	//加载栏目列表
	function reloadChannelList(checkedId){
		$(".list-group").html("");
		$.ajax({
			url:"${root}/blog/channel/json",
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				$.each(result, function(i, item) {
					if(checkedId != undefined){
						if(item.id == checkedId){
							$(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
							 setArticle(item.id);//展开选中栏目信息
						}else{
							$(".list-group").append("<a id='a"+i+"' href='javascript:;' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
						}
					}else{
// 						if(i==0){
// 							 $(".list-group").append("<a id='a"+i+"' href='javascript:;'  class='list-group-item active'>"+(i+1)+"、"+item.name+"</a> ");
// 							 setArticle(item.id);//默认展开第一个栏目信息
// 						}else{
							 $(".list-group").append("<a id='a"+i+"' href='javascript:;' class='list-group-item'>"+(i+1)+"、"+item.name+"</a> ");
// 						};
					    setArticle(0);//展开全部文章信息
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
						setArticle(item.id);
					}); 
		        });
			},
			error:function(data){
			}
		});
	};
	
	
	//展开文章列表
	function setArticle(channelId){
		
		$(".articleList").html("");
		$("#navigation").html("");
		
		var a = "<a href='${root}/blog/article/"+channelId+"/2'></a>";
		$("#navigation").append(a);
		
// 		$("#navigation").find("a").attr("herf","${root}/blog/article/"+channelId+"/2");
// 		console.log("channelId:"+"${root}/blog/article/"+channelId+"/2");

		console.log($("#navigation").find("a").attr("href"));
		
		$.ajax({
			url:"${root}/blog/article/"+channelId+"/1",
			type:"POST",
			dateType:"json",
			success:function(data){
				var result = eval("(" + data + ")");
				generateArticle(result);
			}
		});
		
	};
	
	//加载文章信息
	function generateArticle(json){
		$.each(json, function(i, item) {
			var article = ""+
			"<div class='article'>"+
			"<h3 class='title'>"+
				item.title+
//					"<small>  "+item.createTime+"</small>"+
//				"<span class='label label-default'>"+item.channelName+"</span>"+
			"</h3>"+
			"<hr width='698px;' size='2' style='padding: 0;margin:0;margin-bottom: 10px;'>"+
			"<small class='channel'><strong>"+item.channelName+"</strong></small>"+
			"<small>&nbsp;&nbsp;"+item.createTime+"</small>"+
			"<div class='content'>"+
			item.content+
			"</div>"+
//				"<small><span class='label label-info'>"+item.channelName+"</span></small>"+
			"</div>";
			
			$(".articleList").append(article);
			
			$('.content').readmore({
				  speed: 1000,
				  maxHeight: 200,
				  moreLink:"<a href='#'>Read More</a>",
				  lessLink:"<a href='#'>Close More</a>"
			});
		});
	}

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3">
			<div class="list-group" style="padding-top: 10px;">
				<a href="#" class="list-group-item active">Link</a>
				<a href="#" class="list-group-item">Link</a> 
			</div>
		</div>
		
		<div class="col-md-9" >
			<div class="articleList">
			
			</div>
			
			<div id="navigation" align="center">
        		<a href="${root}/blog/article/0/2"></a>  
   			</div>
		</div>
	</div>
</body>
</html>