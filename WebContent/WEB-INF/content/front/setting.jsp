<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ImEthan:About</title>

<link rel="stylesheet" type="text/css" href="${root}/theme/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="${root}/theme/webuploader-0.1.5/webuploader.js"></script>

<script type="text/javascript">
	//页面加载时初始化脚本
	$(document).ready(function () {
		
		//判断头像是否可以加载，不能加载则显示默认头像
		var avatar = "${root}/upload/avatar/${user.avatar}";
		$.ajax({
			url:avatar,
			error:function(xhr, error, ex){
				if (xhr.status == '404') {
					$(".uploader-list").find(".img-thumbnail").attr("src","${root}/upload/avatar/default-avatar-ethan.jpg");
				}
			},
			success:function(){
				$(".uploader-list").find(".img-thumbnail").attr("src",avatar);
			}
		});
		
		// 初始化Web Uploader
		var uploader = WebUploader.create({
		    // 选完文件后，是否自动上传。
		    auto: true,
		    // swf文件路径
		    swf: '${root}/theme/webuploader-0.1.5/Uploader.swf',

		    // 文件接收服务端。
		    server: '${root}/setting/updateAvatar',

		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#filePicker',

		    // 只允许选择图片文件。
		    accept: {
		        title: 'Images',
		        extensions: 'gif,jpg,jpeg,bmp,png',
		        mimeTypes: 'image/*'
		    },
		    formData: {
		        userId: $("#id").val()
		    }
		});
		
		// 当有文件添加进来的时候
		uploader.on( 'fileQueued', function( file ) {
		    var $li = $(
		            '<div id="' + file.id + '" class="file-item thumbnail">' +
		                '<img style=swidth: 100px;height: 100px;">' +
		            '</div>'
		            ),
		      $img = $li.find('img');


		    // $list为容器jQuery实例
		    $("#fileList").html("");
		    $("#fileList").append( $li );

		    // 创建缩略图
		    // 如果为非图片文件，可以不用调用此方法。
		   	var thumbnailWidth = 100;
		    var thumbnailHeight = 100;//为 100 x 100
		    uploader.makeThumb(file, function( error, src ) {
		        if (error) {
		            $img.replaceWith('<span>不能预览</span>');
		            return;
		        }
		        $img.attr( 'src', src );
		    }, thumbnailWidth, thumbnailHeight );
		});
		
		// 文件上传过程中创建进度条实时显示。
// 		uploader.on( 'uploadProgress', function( file, percentage ) {
// 			console.log('uploadProgress');
// 		    var $li = $( '#'+file.id ),
// 		        $percent = $li.find('.progress span');

// 		    // 避免重复创建
// 		    if ( !$percent.length ) {
// 		        $percent = $('<p class="progress"><span></span></p>')
// 		                .appendTo( $li )
// 		                .find('span');
// 		    }

// 		    $percent.css( 'width', percentage * 100 + '%' );
// 		});

		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on( 'uploadSuccess', function( file ) {
			console.log("uploadSuccess");
		    $( '#'+file.id ).addClass('supload-state-done');
		});

// 		// 文件上传失败，显示上传出错。
// 		uploader.on( 'uploadError', function( file ) {
// 			console.log("uploadError");
// 		    var $li = $( '#'+file.id ),
// 		        $error = $li.find('div.error');

// 		    // 避免重复创建
// 		    if ( !$error.length ) {
// 		        $error = $('<div class="error"></div>').appendTo( $li );
// 		    }

// 		    $error.text('上传失败');
// 		});

		// 完成上传完了，成功或者失败，先删除进度条。
// 		uploader.on( 'uploadComplete', function( file ) {
// 			console.log("uploadComplete");
// 		    $( '#'+file.id ).find('.progress').remove();
// 		});
		
	});
	
	//更新用户基本信息
	function updateProfile(){
		if($("#profileForm").valid()){
			var id = $("#id").val();
			var nickname = $("#nickname").val();
			var locate = $("#locate").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			
			$.ajax({
				url:"${root}/setting/updateProfile?id="+id+"&nickname="+nickname+"&locate="+locate+"&phone="+phone+"&email="+email,
				type:"POST",
				dateType:"json",
				success:function(data){
					var result = eval("(" + data + ")");
					var messageType = "success";
					if(result.success == false){
						messageType = "error";
					};
					showMsg(messageType,result.message);
				}
			});
		};
	};

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Personal settings</h3>
				  </div>
				  <div class="list-group" >
					<a href="${root}/setting/profile" class="list-group-item <c:if test="${type eq 'profile'}">selected</c:if>">Profile</a>
					<a href="${root}/setting/account" class="list-group-item <c:if test="${type eq 'account'}">selected</c:if>">Account</a>
				</div>
			</div>
		</div>
		
		<div class="col-md-9" >
			  <div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Profile</h3>
				  </div>
				  <div class="panel-body">
				  		<!-- profile -->
				  		<c:if test="${type eq 'profile'}">
						  	<form role="form" id="profileForm" method="post">
						  		<input type="hidden" id="id" name="id" value="${user.id}"/>
								  <div class="form-group">
									  	<label for="exampleInputEmail1">Avatar</label>
									  	<div id="fileList" class="uploader-list" style="width: 100px;height: 100px;margin-bottom: 6px;">
									  		<img class="img-thumbnail" src="${root}/upload/avatar/${user.avatar}" alt="www.imethan.cn" style="width: 100px;height: 100px;">
									  	</div>
									  	<div id="uploader-demo"><div id="filePicker">选择头像</div></div>
								  </div>
								  <div class="form-group">
								    <label for="exampleInputEmail1">Name</label>
								    <input type="text" class="form-control required" id="nickname" placeholder="Enter name" name="nickname" value="${user.nickname}">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Locate</label>
								    <input type="text" class="form-control required" id="locate" placeholder="Enter locate" name="locate" value="${user.locate}">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Phone</label>
								    <input type="text" class="form-control required" id="phone" placeholder="Enter phone" name="phone" value="${user.phone}">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Email</label>
								    <input type="email" class="form-control required" id="email" placeholder="Enter email" name="email" value="${user.email}">
								  </div>
		
								  <button type="button" class="btn btn-primary" onclick="updateProfile()">Update profile</button>
							</form>
						</c:if>
						
						<c:if test="${type eq 'account' }">
							<form role="form" id="inputForm" method="post">
								 <div class="form-group">
								    <label for="oldPassword">Old password</label>
								    <input type="password" class="form-control required" id="oldPassword" placeholder="Enter old password">
								  </div>
								 <div class="form-group">
								    <label for="newPassword">New password</label>
								    <input type="password" class="form-control required" id="newPassword" placeholder="Enter new password">
								  </div>
								 <div class="form-group">
								    <label for="confirmNewPassword">Confirm new password</label>
								    <input type="password" class="form-control required" id="confirmNewPassword" placeholder="Enter new password">
								  </div>
								 <button type="submit" class="btn btn-primary">Update password</button>
							</form>
							
						</c:if>
				  </div>
			</div>
		</div>
	</div>
</body>
</html>