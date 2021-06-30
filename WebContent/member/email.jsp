<%@page import="email.random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>Login V10</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/util.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
<!--===============================================================================================-->


    <title>이메일 인증페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">
    
    <!-- Ajax -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
<!-- header 끝 -->
	
	
<!-- 이메일 유효성확인 -->
<script type="text/javascript">

		var chkup = false;

		$(document).ready(function(){
			$("#fr").submit(function(){
				 if($.trim($("#userEmail").val()) == null){
					 $('.ckMsg_mail').text("이메일을 입력하세요");     
		             $('.ckMsg_mail').css("color","red"); 
		             $('.ckMsg_mail').css("padding-left","1rem"); 
		             $("#userEmail").focus();
		             return false;
				 }
				 if(chkup == false){
					 return false;
				 }
			 });
			 
			 $("#userEmail").keyup(function(){
				  
					var Usermail = $("#userEmail").val();
					var chk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					
					if(Usermail.match(chk) != null){
						$('.ckMsg_mail').text("");     
						chkup = true;  
					}else{
						$('.ckMsg_mail').text("이메일을 정확히 입력하세요");     
						$('.ckMsg_mail').css("color","red"); 
						$('.ckMsg_mail').css("padding-left","1rem");
						chkup = false; 
					}
				 	});
		
		});
</script>
<!-- 이메일 유효성 확인 -->

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" action="./emailAddrCheckAction.me" method="post" >
					<span class="login100-form-title p-b-51">
						회원 가입 전 이메일 인증을 완료 해 주세요!
					</span>

						* 이메일주소 
						<div class="wrap-input100 validate-input m-b-16" data-validate = "이메일 인증을 완료해주세요!">
							<span class="ckMsg_mail"></span>
								<input class="input100" type="text" id="userEmail" name="userEmail" placeholder="email을 입력해주세요">
							<span class="focus-input100"></span>
						</div>					
						
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							인증하러가기
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="./vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/bootstrap/js/popper.js"></script>
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/daterangepicker/moment.min.js"></script>
	<script src="./vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./js/login.js"></script>

    <!-- footer 시작 -->
    
   		<jsp:include page="../footer/footer.jsp" />
   		 
    
    <!-- footer 시작 -->

</body>
</html>