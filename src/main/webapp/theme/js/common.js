/**
 * 初始化删除modal
 * @returns modal删除按钮对象
 * 
 * @author Ethan
 * @datetime 2015年9月24日上午12:47:37
 */
function setDeleteModal(){
	var  deleteModalAppendDiv = ""+
		"<div class='modal fade' id='deleteModalAppendDivId' tabindex='-1' role='dialog' aria-labelledby='deleteConfirmModalLabel' aria-hidden='true'>"+
		"<div class='modal-dialog'>"+
			"<div class='modal-content'>"+
				"<div class='modal-header'>"+
					"<button type='button' class='close' data-dismiss='modal' aria-label='Close' aria-hidden='true'>"+
						"<span aria-hidden='true'>&times;</span>"+
					"</button>"+
					"<h4 class='modal-title'>Warning</h4>"+
				"</div>"+
				"<div class='modal-body'>"+
					"确定要删除吗？"+
				"</div>"+
				"<div class='modal-footer'>"+
				"	<button  type='button' class='btn btn-defaul' data-dismiss='modal'>关闭</button>"+
				"	<button id='deleteConfirmModalClick' type='button' class='btn btn-info' data-dismiss='modal'>删除</button>"+
				"</div>"+
			"</div>"+
		"</div>"+
	"</div>	";
	$(document.body).append(deleteModalAppendDiv);
	
	//弹出modal框
	$('#deleteModalAppendDivId').modal();
	
	//在modal隐藏之后触发该方法
	$('#deleteModalAppendDivId').on('hidden.bs.modal', function (e) {
		$(".modal-backdrop").remove();
		$("#deleteModalAppendDivId").remove();
	});
	
	return $("#deleteConfirmModalClick");
};

/**
 * 在页面导航下面显示提示信息
 * @param type 提示信息类型,成功:success,失败:error
 * @param msg 提示信息
 */
function showMsg(type,msg){
	if(type == 'success'){
		$('#topWarn').attr("class","alert alert-success alert-dismissable");
		$('#topWarn').css('display','block');
		$("#topWarn p").text(msg);
	}
	if(type == 'error'){
		$('#topWarn').attr("class","alert alert-danger alert-dismissable");
		$('#topWarn').css('display','block');
		$("#topWarn p").text(msg);
	}
	setTimeout("closeTopWarn(this)", 2000);
};


/**
 * 在Modal显示提示信息
 * @param type 提示信息类型,成功:success,失败:error
 * @param msg 提示信息
 */
function showModalMsg(type,msg){
	if(type == 'success'){
		$('#modalWarn').attr("class","alert alert-success alert-dismissable");
		$('#modalWarn').css('display','block');
		$("#modalWarn p").text(msg);
	}
	if(type == 'error'){
		$('#modalWarn').attr("class","alert alert-danger alert-dismissable");
		$('#modalWarn').css('display','block');
		$("#modalWarn p").text(msg);
	}
	setTimeout("closeModalWarn(this)", 6000);
};



/**
 * 关闭提醒框
 */
function closeTopWarn(){
	$("#topWarn").css("display","none");
};

/**
 * 关闭Modal提醒框
 */
function closeModalWarn(){
	$("#modalWarn").css("display","none");
};