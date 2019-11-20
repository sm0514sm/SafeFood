<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="name" items="${result}" varStatus="status">
   <a href=http://localhost:8080/foodDetail.do?code=${name[0]}><c:out value="${name[1]}" /> </a><br>
</c:forEach>