<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ImEthan Example</title>

    <!-- Bootstrap core CSS -->
    <link href="${root}/theme/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${root}/theme/css/console/navbar-static-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <!-- Static navbar -->
    <div class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
<!--           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> -->
<!--             <span class="sr-only">Toggle navigation</span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--             <span class="icon-bar"></span> -->
<!--           </button> -->
          <a class="navbar-brand" href="${root}/console/home">ImEthan</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${root}/console/home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">SIMPLE CMS <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${root}/console/cms/channel/0/10">Channel</a></li>
                <li><a href="#">Article</a></li>
<!--                 <li class="divider"></li> -->
<!--                 <li class="dropdown-header">Nav header</li> -->
<!--                 <li><a href="#">Separated link</a></li> -->
<!--                 <li><a href="#">One more separated link</a></li> -->
              </ul>
            </li>
          </ul>
<!--           <ul class="nav navbar-nav navbar-right"> -->
<!--             <li><a href="#">Default</a></li> -->
<!--             <li><a href="#">Static top</a></li> -->
<!--             <li><a href="#">Fixed top</a></li> -->
<!--           </ul> -->
          
          <form class="navbar-form navbar-right" role="form">
            <div class="form-group">
              <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-default">Sign in</button>
          </form>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
    <div class="container">
    	<!-- 顶部可关闭提醒框 -->
	    <div id="topWarn" class="alert alert-success alert-dismissable" hidden >
		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  <strong>Warning!</strong> <p style="display: inline;">Best check you self, you're not looking too good.</p>
		</div>

		<!-- 面包屑导航 -->
<!-- 		<ol class="breadcrumb"> -->
<!-- 			<li><a href="#">Home</a></li> -->
<!-- 			<li><a href="#">Library</a></li> -->
<!-- 			<li class="active">Data</li> -->
<!-- 		</ol> -->
		<decorator:body></decorator:body>
	</div>
	<!-- /container -->
    
    <div class="footer">
      <div class="container">
        <p class="text-muted">A simple website by ethan.</p>
      </div>
    </div>
    
    <!-- common -->
    <!-- common warn Modal -->  
     <div class="modal fade" id="warnModal" tabindex="-1" role="dialog" aria-labelledby="warnModalLabel" aria-hidden="true">  
	   	 <div class="modal-dialog">
		     <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Warning</h4>
		      </div>
		      <div class="modal-body">
		       		 你真的要删除吗？
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button id="warnModalClick" type="button" class="btn btn-primary" data-dismiss="modal">Delete</button>
		      </div>
		     </div>
		 </div>
         <!-- /.modal-dialog -->  
     </div>  
     <!-- /.modal -->  
     
     <!-- common result Modal -->  
     <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">  
	   	 <div class="modal-dialog">
		     <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">提示信息</h4>
		      </div>
		      <div class="modal-body">
		      ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
		      </div>
		     </div>
		 </div>
         <!-- /.modal-dialog -->  
     </div>  
     <!-- /.modal -->  
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${root}/theme/js/jquery-1.11.0.min.js"></script>
    <script src="${root}/theme/js/bootstrap.min.js"></script>
    <script src="${root}/theme/js/popover.js"></script>
    <script src="${root}/theme/js/tooltip.js"></script>
    <script src="${root}/theme/js/alert.js"></script>
    <script src="${root}/theme/js/console/common.js"></script>
    
  </body>
</html>
