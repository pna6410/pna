<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="${pageContext.request.contextPath}/css/bootstrap5.0.2/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap5.0.2/sign-in/signin.css" rel="stylesheet"> <!-- 로그인 css 파일 -->

<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

<script language="javascript">
function login(){
	if($("#userId").val() == ""){
        alert("아이디를 입력하세요.");
        $("#userId").focus(); // 입력포커스 이동
        return; // 함수 종료
    }
    if($("#userPw").val() == ""){
        alert("비밀번호를 입력하세요.");
        $("#userPw").focus();
        return;
    }
    $('#loginForm').submit();
}

$(document).ready(function() {
    var message = $('#message').val();
    if (message != "") {
        alert(message);
    }

    $('#userId').focus();
});
</script>

</head>
<body>
	<main class="form-signin">
		<form name="loginForm" id="loginForm" action="<c:url value='/loginCheck.do'/>" method="POST">			
			<h1 class="h3 mb-3 fw-normal" style="text-align:center">로그인 화면</h1>
			<div class="form-floating">
				<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디"> 
				<label for="userId">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="userPw" id="userPw" placeholder="비밀번호" onkeydown="if(event.keyCode==13) login()">				
				<label for="userPw">비밀번호</label>
			</div>
			<input type="hidden" id="message" name="message" value="${message}">
			<input type="button" class="w-100 btn btn-lg btn-success" value="로그인" onclick="javascript:login()">			
		</form>
	</main>
</body>
</html>