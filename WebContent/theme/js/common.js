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