$(function() {
	$("#exampleasdf").popover();
	
//	 $('#channel-detail').on('hidden.bs.modal', function (e) {  
//	    	alert("关闭事件");  
//	    }) ;
//	  $('#channel-modify').on('show.bs.modal', function (e) {  
//	    	alert("打开对话框之前事情");  
//	  });
	//表单验证
	 $("#inputForm").validate();
	 
//	 $("#channel-modify").on("hidden.bs.modal", function() {
//		    $(this).removeData("bs.modal");
//		});
});

//删除一条记录
function deleteOne(method, id,row){
	$('#warnModal').modal(
			$('#warnModal .modal-body').html("确实删除吗？")
	);
	
	$("#warnModal #warnModalClick").click(function(){
		$.ajax({
			type : "get",
			url : "../" + method + "/" + id,
			dataType : "json",
			success : function(msg) {
				showTopWarn("删除成功。");
				$(row).parent().parent().remove(); 
			}
		});
		
	});	
};


//查看详情，弹出详情
function showDetail(method, id,modal,content) {
	$.ajax({
		type : "get",
		url : "../" + method + "/" + id,
		dataType : "json",
		success : function(entity) {
			showModal(entity,modal,content);
		}
	});
};

//排版详情页面
function showModal(entity,modal,content) {
	$('#'+modal).modal(
			$('#'+modal+' .modal-title').html("Detail"),
			$('#'+modal+' .modal-body').html(content));
};

//排版详情页面
function showDetailModal(modal,content) {
	$('#'+modal).modal(
			$('#'+modal+' .modal-title').html("Detail"),
			$('#'+modal+' .modal-body').html(content));
};


//提交表单
function submitForm(current){
	$.post($(current).parent().attr('action'),
	  {
	    title:$('#title').val(),
	    describe:$('#describe').val()
	  },
	  function(data){
	    showTopWarn(data.message);
	  },"json");
	
};