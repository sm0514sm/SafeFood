<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../favicon.ico">

<title>SafeFood</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
</head>

<body role="document">
	<jsp:include page="navBar.jsp"/>
	<jsp:include page="jumbotron.jsp"/>
	
	<div class="container theme-showcase" role="main" id="contents">
		<h1>${index}</h1>
		<c:forEach items='${list}' var='food'>		
			<table id='listTable' align='center' width='80%' >
			<tr id='listTableFistTr'>
			<td rowspan='4' width='20%'>
			<a href="foodDetail.do?code=${food.code}">
			<img src='img/${food.name}.jpg' alt="${food.name}" width='260px' height='260px' class='imgContent'>
			</a>
			</td>
			<td id='listTableFistTd' align='left' height='10%'><b>
			<font size='5px'>${food.name}</font></b>
			</td>
			</tr>
			<tr>
			<td align='left' height='10%'>
			<a href='#'><i class='fa fa-calendar'></i> Feb, 2007</a>&nbsp;&nbsp;&nbsp;
			<a href='#'><i class='fa fa-tag'></i> Web Design</a>
			<hr></td></tr><tr>
			<td align='left'>${food.material}</td>
			</tr><tr id='listTableLastTr'><td align='left' height='10%'>
			<c:if test="${not empty sessionScope.id}">
				<a href="ingestion.do?code=${food.code}"><button type='button' class='btn btn-info'><i class='fa fa-plus'></i> 추가</button></a>
				<button type='button' class='btn btn-info'><i class='fa fa-star'></i> 찜</button>
			</c:if>
			</td>
			</tr>
			</table>
			<br/>
		</c:forEach>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</html>
