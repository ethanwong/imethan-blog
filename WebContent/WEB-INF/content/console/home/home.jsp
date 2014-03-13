<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ImEthan Example</title>
</head>

<body>
	<!-- Main component for a primary marketing message or call to action -->
	<div class="jumbotron">
		<h1>ImEthan example</h1>
		<p>This example is base Spring.</p>
		<p>
			<a class="btn btn-primary btn-lg" role="button">Learn more
				&raquo;</a>
		</p>
	</div>

	<!-- Standard button -->
	<a href="#"><button type="button" class="btn btn-default">Default</button></a>
	<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
	<button type="button" class="btn btn-primary">Primary</button>

	<!-- Indicates a successful or positive action -->
	<button type="button" class="btn btn-success">Success</button>

	<!-- Contextual button for informational alert messages -->
	<button type="button" class="btn btn-info">Info</button>

	<!-- Indicates caution should be taken with this action -->
	<button type="button" class="btn btn-warning">Warning</button>

	<!-- Indicates a dangerous or potentially negative action -->
	<button type="button" class="btn btn-danger">Danger</button>

	<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
	<button type="button" class="btn btn-link">Link</button>

	<div style="margin: 20px;"></div>
	<div class="well">
		<a href="#" id="exampleasdf" class="btn btn-success" rel="popover"
			data-content="It's so simple to create a tooltop for my website!"
			data-original-title="Bootstrap Popover">hover for popover</a>
		<!-- Button trigger modal -->
		<button class="btn btn-primary" data-toggle="modal" data-target="#channel-detail">Launch demo modal</button>

		<a data-toggle="modal" data-target="#channel-detail" href="${root}/console/home">modal</a>
	</div>

	<div class="modal fade" id="channel-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提示框</h4>
				</div>
				<div class="modal-body">确认删除吗？</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<div class="alert alert-warning alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>
		<strong>Warning!</strong> Best check yo self, you're not looking too
		good.
	</div>

	<div class="alert alert-info">
		<a href="#" class="alert-link">...</a>
	</div>
	<div class="alert alert-warning">
		<a href="#" class="alert-link">...</a>
	</div>
	<div class="alert alert-danger">
		<a href="#" class="alert-link">...</a>
	</div>

	<div class="alert alert-block" id="warning-block">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<h4>Warning!</h4>
		Best check yo self, you're not...
	</div>

	<a id="buttons" onclick="testJs()">buttons</a>
	
	<div style="margin-bottom: 100px;"></div>
	<script type="text/javascript">
	<!--
	function testJs(){
		alert("This is a test");
	};
	//-->
	</script>
</body>
</html>
