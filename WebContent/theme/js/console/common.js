$(function() {
	$("#exampleasdf").popover();
	
	 $('#channel-detail').on('hidden.bs.modal', function (e) {  
	    	alert("关闭事件");  
	    }) ;
	    $('#channel-detail').on('show.bs.modal', function (e) {  
	    	alert("打开对话框之前事情");  
	  });
});



//查看详情，弹出详情
function showDetail(method, id,modal) {
	$.ajax({
		type : "get",
		url : "../" + method + "/" + id,
		dataType : "json",
		success : function(entity) {
			showModal(entity,modal);
		}
	});
};

//排版详情页面
function showModal(entity,modal) {
	$('#'+modal).modal(
			$('#'+modal+' .modal-title').html("Detail"),
			$('#'+modal+' .modal-body').html(
					"<strong>Title</strong><br>" + entity.title + "<br>"
							+ "<strong>Describe</strong><br>" + entity.describe
							+ "<br>" + "<strong>CreateTime</strong><br>"
							+ entity.createTime));
};

function deleteOne(method, id){
	$('#warnModal').modal(
			$('#warnModal .modal-body').html("确实删除吗？")
	);
	$('#warnModal').on('hidden.bs.modal', function (e) {
		$.ajax({
			type : "get",
			url : "../" + method + "/" + id,
			dataType : "json",
			success : function(msg) {
				$('#resultModal').modal(
						$('#resultModal .modal-title').html("提示信息"),
						$('#resultModal .modal-body').html("删除成功。"+msg)
						
				);
			}
		});
	});
	
	$('#resultModal').on('hidden.bs.modal', function (e) {  
    	 location.reload();
  });
};



