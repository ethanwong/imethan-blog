<script src="${root}/theme/kindeditor/kindeditor-all-min.js"></script>
<script src="${root}/theme/kindeditor/zh_CN.js"></script>
<script>
	KindEditor.ready(function(K) {
		K.create('#kindeditorContent', {
			themeType : 'simple',
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
// 			items : [
// 				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
// 				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
// 				'insertunorderedlist', '|', 'emoticons', 'image','multiimage', 'link'],
			afterCreate: function () {
	            this.sync();
	        },
	        afterBlur: function () {
	            this.sync();
	        }
		});
	});
	
</script>