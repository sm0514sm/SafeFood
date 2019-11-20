<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<!-- Bootstrap core CSS
<link href="dist/css/bootstrap.css" rel="stylesheet">
<!-- Bootstrap theme
<link href="dist/css/bootstrap-theme.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- Custom styles for this template -->
<link href="theme.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
$(function(){
	 $("#searchword").keyup(function(){
		 var input = document.getElementById("searchword").value; 
		 console.log("input : ", input)
		 $.ajax({
			 url : "searchCharacter.do",
			 type : "get",
			 data :{input: input},
			 error  : function(xhr, status,message){
				 alert("error:"+message + xhr + status);
			 },
			 success : function(data){
				 $("#testtest").html(data + "");
			 }
		 });
	 });
});
function search() {
	var frm = document.getElementById("searchForm");
	frm.submit();
}
</script>
</head>
<div class="jumbotron">
	<div class="container" id='container1'>
		<h1>WHAT WE PROVIDE</h1>
		<p>건강한 삶을 위한 먹거리 프로젝트</p>
	</div>
</div>
<div class="jumbotron2" id='container2'>
	<div class="container">
		<div class="serarch-group">
			<form method="get" action="searchKeyword.do" id="searchForm">
				<div class="dataTables_search" id="dataTables_search">
					<select id="searchbox" name="searchSelect" class="form-control">
						<option value="" disabled selected>검색 항목 선택</option>
						<option value="name">상품명</option>
						<option value="maker">제조사</option>
						<option value="material">영양소</option>
					</select>
				</div>
				<div class="dataTables_search" id="dataTables_search">
					<input id="searchword" name="searchWord" type="text" class="form-control" placeholder="검색어를 입력하세요" >
					
				</div>
				<div class="dataTables_search" id="dataTables_search">
					<a href="javascript:search()">
						<button id="search" class="btn btn-primary" type="button">검색</button>
					</a>
				</div>
			</form>
			<h4 id="testtest">  </h4>
			
		</div>
	</div>
</div>