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
	<link rel="icon" type="image/png" href="../img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
<!--===============================================================================================-->



    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Violet | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">



</head>
<body>
    <!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-51">
						회원가입
					</span>

					*이름
					<div class="wrap-input100 validate-input m-b-16" data-validate = "이름을 적어주세요">
						<input class="input100" type="text" name="username" placeholder="이름을 입력하세요">
						<span class="focus-input100"></span>
					</div>
					
					*아이디
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" name="username" placeholder="아이디를 입력해주세요">
						<span class="focus-input100"></span>
					</div>
					
					*비밀번호
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="비밀번호를 입력해주세요">
						<span class="focus-input100"></span>
					</div>
					
					*비밀번호 확인
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="입력한 비밀번호를 다시 입력해주세요">
						<span class="focus-input100"></span>
					</div>
					
					*생년월일
					<div class="wrap-input100 validate-input m-b-16" data-validate = "생년월일을 입력해주세요">
						<input class="input100" type="text" name="pass" placeholder="19901204형식으로 입력해주세요">
						<span class="focus-input100"></span>
					</div>
					
					*휴대폰 번호
					<div class="wrap-input100 validate-input m-b-16" data-validate = "휴대폰 번호를 입력해주세요">
						<input class="input100" type="text" name="pass" placeholder="휴대폰 번호">
						<span class="focus-input100"></span>
					</div>
					
					*이메일 (이메일인증하면 세션값 이메일로 받아서 넣기)
					<div class="wrap-input100 validate-input m-b-16" data-validate = "이메일을 입력해주세요">
						<input class="input100" type="email" name="email" placeholder="예) email@email.com">
						<span class="focus-input100"></span>
					</div>
					
					*성별
					<div class="wrap-input100 validate-input m-b-16">
						<input type="radio" name="gender" value="남"> 남
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input type="radio" name="gender" value="여"> 여
					</div>
					
					*주소 (카카오 api - 도로명주소)
						<input type="button" value="주소찾기">
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="addr1" placeholder="우편번호">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="addr2" placeholder="주소1">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="addr3" placeholder="주소2">
						<span class="focus-input100"></span>
					</div>
					
					*피부타입
					<div class="wrap-input100 validate-input m-b-16">
						<input type="radio" name="skinType" value="건성"> 건성
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input type="radio" name="skinType" value="중성"> 중성
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input type="radio" name="skinType" value="지성"> 지성
					</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input type="radio" name="skinType" value="복합성"> 복합성
					</div>
					
				

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/daterangepicker/moment.min.js"></script>
	<script src="../vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../js/login.js"></script>

    <!-- footer 시작 -->
    
   		<jsp:include page="../footer/footer.jsp" />
   		 
    
    <!-- footer 시작 -->

</body>
</html>