<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Dashboard</title>
<jsp:include page="include/head.jsp"></jsp:include>
<!-- <script type="text/javascript"> -->
// 	window.onload = function() {

// 		var dps = [ [] ];
// 		var chart = new CanvasJS.Chart("chartContainer", {
// 			theme : "light1", // "light1", "dark1", "dark2"
// 			animationEnabled : true,
// 			title : {
// 				text : "Revenue Statistics"
// 			},
// 			subtitles : [ {
// 				text : "7 day ago - Now"
// 			} ],
// 			axisX : {
// 				valueFormatString : "####"
// 			},
// 			axisY : {
// 				title : "Dollar ($)"
// 			},
// 			data : [ {
// 				type : "spline",
// 				xValueFormatString : "####",
// 				yValueFormatString : "#,##0.0 $",
// 				dataPoints : dps[0]
// 			} ]
// 		});

// 		var xValue;
// 		var yValue;

// 		<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">
// 		<c:forEach items="${dataPoints}" var="dataPoint">
// 		xValue = parseInt("${dataPoint.x}");
// 		yValue = parseFloat("${dataPoint.y}");
// 		dps[parseInt("${loop.index}")].push({
// 			x : xValue,
// 			y : yValue
// 		});
// 		</c:forEach>
// 		</c:forEach>

// 		chart.render();

// 	}
<!-- </script> -->
</head>
<body class="animsition">
	<jsp:include page="dashboard.jsp"></jsp:include>
</body>
<jsp:include page="include/js.jsp"></jsp:include>
</html>