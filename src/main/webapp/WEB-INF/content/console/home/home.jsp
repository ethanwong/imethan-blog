<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/content/base/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Console|ImEthan|Full Stack Engineer</title>
<script type="text/javascript" src="${root}/theme/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${root}/theme/highcharts/exporting.js"></script>
<script type="text/javascript">
$(function () {
    $('#chart').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'The article statistics chart'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: ${channelName},
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            allowDecimals:false, //是否允许刻度有小数
            title: {
                text: 'Amount',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' '
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Article',
            data: ${articleAmount}
        }]
    });
});

</script>
<%-- <script type="text/javascript" src="${root}/theme/highcharts/theme.js"></script> --%>
</head>



<body>
<!-- 	<div class="jumbotron"> -->
<!-- 		<h1>ImEthan console</h1> -->
<!-- 		<p>This project is base Spring.</p> -->
<!-- 	</div> -->
	<div id="chart" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
			  	<div class="panel-heading">Dashboard</div>
			  	<div class="panel-body">
			  		<a href="${root}/console/message"><span class="glyphicon glyphicon-envelope" style="font-size: 60px;	"></span></a>
			  		<p class="help-block">Message</p>
			  	</div>
			</div>
		</div>
	</div>
</body>
</html>
