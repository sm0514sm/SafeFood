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
		
			<div class="col-md-6" style="margin-left: auto; margin-right: auto;">
				
				<h3 class="widget-header min-title">비밀번호 찾기</h3><hr />

				<div class="form-group col-10 row">
					<label class="col-4" for="findPasswordId" style="margin: auto;">Id</label> <input type="text"
						class="form-control col-8" id="findPasswordId" name="findPasswordId" placeholder="Enter Id"
						required="required">
				</div>
				
				<div class="form-group col-10 row">
					<label class="col-4" for="findPasswordName" style="margin: auto;">Name</label> <input type="text"
						class="form-control col-8" id="findPasswordName" name="findPasswordName" placeholder="Enter Name"
						required="required">
				</div>
				
				<div class="form-group col-10 row">
					<label class="col-4" for="findPasswordEmail" style="margin: auto;">Email</label> <input type="text"
						class="form-control col-8" id="findPasswordEmail" name="findPasswordEmail" placeholder="Enter Email"
						required="required">
				</div>				
				<br>
				<div class="row">
					<input type="text" class="form-control col-7" id="findPasswordPass" readonly="readonly" value="" placeholder="위의 정보를 입력해주세요"/>
					<div class="col-1"></div>
					<button class="btn btn-info col-4" onclick="findPassword2()">비밀번호 찾기</button><br/>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>