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

<title>Notice</title>
<jsp:include page="link_script.jsp" />
</head>

<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 170px;"></div>
	
	<%@ include file="/notice.html" %>

	<jsp:include page="footer.jsp"/>
</body>
</html>