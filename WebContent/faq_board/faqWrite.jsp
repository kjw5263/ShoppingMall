<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>FAQ | JUST SKIN</title>
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
    <title>JUST SKIN</title>

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
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
		<div class="row">
			<div class="col-2 text-center"></div>
			
			
			<div class="col-8">
			
			<!-- 제목 시작 -->
				<div class="col-md-12 text-center p-5 row">
					<div class="col-2"></div>
					<div class="col-4">
						<h3>고객 센터 - 글쓰기</h3>
					</div>
					<div class="col-6"></div>
				</div>
			<!-- 제목 끝 --> 
				<form action="./FaqWriteAction.faq" method="post" id="fr" onsubmit="return check()">
				<!-- 카테고리 시작 -->
				<div class="row">
					<select class="form-select" name="faqCategory" id="faqCategory" aria-label="Default select example">
					  <option value="" selected>카테고리</option>
					  <option value="회원관련">회원관련</option>
					  <option value="주문결제">주문결제</option>
					  <option value="포인트">포인트</option>
					  <option value="환불">환불</option>
					  <option value="배송안내">배송안내</option>
					  <option value="상품관련">상품관련</option>
					  <option value="기타">기타</option>
					</select>
				</div>
				<!-- 카테고리 끝 -->
				
				<!-- 제목 인풋 시작 -->
				<div class="input-group input-group-lg mt-3 mb-3">
				  <input type="text" class="form-control" placeholder="질문을 입력하세요" name="faqQuestion" id="faqQuestion" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<!-- 제목 인풋 시작 -->
				
				<hr>
					
				<!-- 내용 인풋 시작 -->	
				<div class="form-floating mb-5">
				  <textarea class="form-control" placeholder="답변을 입력하세요" name="faqAnswer" id="faqAnswer" style="height: 500px"></textarea>
				</div>	
				<!-- 내용 인풋 끝 -->	
				
					<button type="submit" class="btn btn-primary mb-3">글쓰기</button>
				</form>
			
			</div>
			
			<div class="col-2">	
			</div>			
		</div>
		
	</div>
	<!-- container 끝 -->	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
	<!-- 유효성 검사 스크립트 시작 -->
	<script src="./js/faqWrite.js"></script>
	<!-- 유효성 검사 스크립트 끝 -->
	
</body>
</html>