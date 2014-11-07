/**
 * 显示提示信息
 * @param type 提示信息类型,成功:success,失败:error
 * @param msg 提示信息
 */
function showMsg(type,msg){
	if(type == 'success'){
		$('#topWarn').removeClass("*").addClass("alert alert-success alert-dismissable");
		$('#topWarn').css('display','block');
		$("#topWarn p").text(msg);
	}
	if(type == 'error'){
		$('#topWarn').removeClass("*").addClass("alert alert-danger alert-dismissable");
		$('#topWarn').css('display','block');
		$("#topWarn p").text(msg);
	}
	setTimeout("closeTopWarn(this)", 3000);
}

/**
 * 关闭提醒框
 */
function closeTopWarn(){
	$("#topWarn").css("display","none");
}

$(function() {
	
	$("#exampleasdf").popover();
	
//	 $('#channel-detail').on('hidden.bs.modal', function (e) {  
//	    	alert("关闭事件");  
//	    }) ;
//	  $('#channel-modify').on('show.bs.modal', function (e) {  
//	    	alert("打开对话框之前事情");  
//	  });
	//表单验证
	 $("#inputForm").validate( );
	 $("#inputForm").submit(function(e){
		 if($.trim($('#kindeditorContent').val().replace(/&nbsp;/g, '')) == ''){
			 $('#kindeditorContentError').html('');
			 $('#kindeditorContentError').append('This field is required.');
		 }
	});
	 
//	 $("#channel-modify").on("hidden.bs.modal", function() {
//		    $(this).removeData("bs.modal");
//		});
});

//删除一条记录
function deleteOne(url){
	$('#warnModal').modal(
			$('#warnModal .modal-body').html("确实删除吗？")
	);
	
	$("#warnModal #warnModalClick").click(function(){
		location.href = url;
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