<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>findPassword</title>
<jsp:include page="link_script.jsp" />

<script type="text/javascript">
function findPassword2() {
	var id = $("#findPasswordId").val();
	var name = $("#findPasswordName").val();
	var email = $("#findPasswordEmail").val();
	
	if(id == "" || name == "" || email == ""){
		alert("정보를 입력해주세요 !");
		return;
	} 
	
	$.ajax({
		url : "rest/user/" + id,
		success(data) {
			var user = data.data;
			console.log(user);
			if(user.name == name && user.email == email){
				$("#findPasswordPass").val(user.password);
			}
		},
		error(err){
			alert(err);
		}
	});
}
</script>

</head>
<body role="document">
	<jsp:include page="header.jsp" />
	<div class="header-margin" style="margin-top: 170px;"></div>
	
	<div class="container">
		
		<div class="row">
		
			<div class="col-md-12">
				
				<h3 class="widget-header min-title">비밀번호 찾기</h3><hr />
				<h3 class="widget-header min-title">아이디</h3>
				<input type="text" id="findPasswordId" name="findPasswordId"/>
				<h3 class="widget-header min-title">이름</h3>
				<input type="text" id="findPasswordName" name="findPasswordName"/>
				<h3 class="widget-header min-title">이메일</h3>
				<input type="text" id="findPasswordEmail" name="findPasswordEmail"/>
				<br/>
				<button onclick="findPassword2()">비밀번호 찾기</button><br/>
				<input type="text" id="findPasswordPass" readonly="readonly" value="" placeholder="위의 정보를 입력해주세요"/>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>