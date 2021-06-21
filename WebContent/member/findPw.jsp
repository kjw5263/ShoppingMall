<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">

	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->

</head>

<body>


	<!-- header 시작 -->
 	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	
	<!-- 컨테이너 시작 -->
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
			
				<!-- 일반 로그인 폼 시작 -->
				<form class="login100-form validate-form flex-sb flex-w" action="./FindPwAjax.me" method="post">
				
					<div class="row">
						<span class="login100-form-title p-b-51">
							비밀번호 찾기 <br>
						</span>
						
						<div class="wrap-input100 validate-input m-b-16" data-validate = "아이디를 입력해주세요">
							<input class="input100" type="text" id="userId" name="userId" placeholder="ID">
							<span class="focus-input100"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-16" data-validate = "이메일을 입력해 주세요">
							<input class="input100" type="email" id="userEmail" name="userEmail" placeholder="Email">
							<span class="focus-input100"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-16" data-validate = "전화번호를 입력해주세요">
							<input class="input100" type="text" id="userTel" name="userTel" placeholder="Phone">
							
							<!-- Button to Open the Modal -->
							<button type="button" class="btn btn-primary" id="certify">
							  인증요청
							</button>
							<span class="focus-input100"></span>
						</div>
					</div>
				</form>
								
								
				<form action="./PwCheckAction.me" method="post">					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "인증번호를 입력해주세요" style="display: none;" id="i1">
						<input class="input100" type="text" id="checkNum" name="checkNum" placeholder="인증번호" >
						
						<!-- Button to Open the Modal -->
						<button type="submit" class="btn btn-primary" id="confirm">
						  확인
						</button>
						<span class="focus-input100"></span>
					</div>
				</form>
						
					
			<div class="flex-sb-m w-full p-t-3 p-b-24">
				<div class="contact100-form-checkbox">
					<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
				</div>

				<div>
					<a href="./MemberLogin.me" class="txt1">로그인</a>
					/
					<a href="./FindId.me" class="txt1">아이디 찾기</a>
				</div>
			</div>
			
			

			<div class="container-login100-form-btn m-t-17">
			
				<!-- 일반 로그인 버튼 시작 -->
				<input class="login100-form-btn" type="submit" value="비밀번호 찾기" id="submit"> 
				<!-- 일반 로그인 버튼 끝 -->
				
			</div>
			
			
			<div class="row">
				<a href="./MemberJoin.me" class="txt1 mt-3" >회원가입</a>
			</div>
				<!-- 일반 로그인 폼 끝 -->
				
				
				
			</div>
		</div>
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<!-- footer 시작 -->
 	<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
    
	


	<!-- 인증번호 Modal 시작 -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	
	      <!-- Modal body 시작 -->
	      <div class="modal-body">
	      
			<div class="input-group mb-3">
			  <input type="text" class="form-control" placeholder="인증번호 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
			  <button class="btn btn-outline-secondary" type="button" id="button-addon2">확인</button>
			</div>	    
			  
	      </div>
	      <!-- Modal body 끝 -->
	
	
	    </div>
	  </div>
	</div>
	<!-- 인증번호 Modal 끝 -->
	
	
	
	
	
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
<!--===============================================================================================-->
	<!-- 비밀번호 찾기 에이잭스 -->
 	<script src="./js/findPw.js"></script>
    
    
</body>
</html>