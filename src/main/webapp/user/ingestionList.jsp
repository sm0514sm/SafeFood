<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>섭취 목록</title>

</head>

<body role="document">
	<jsp:include page="../header.jsp" />
	<div class="header-margin" style="margin-top: 150px;"></div>

	<div class="container theme-showcase" role="main" id="contents">
		<table class="table table-condensed">
			<c:forEach items="${list}" var="ingestion">
				<tr>
					<td>${ingestion.id}</td>
					<td>${ingestion.foodName}</td>
					<td>${ingestion.ingdate}</td>
					<td>${ingestion.material}</td>
					<td><a href="removeIng.do?ino=${ingestion.ino }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 이거 가운데 정렬 해주라 -->
		<div style="margin:auto;">
			<a class="btn btn-primary" href="showGraph.do" role="button">섭취정보 그래프로 보기</a>
		</div>
	</div>
</body>
</html>