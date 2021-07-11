<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>피부진단 | JUST SKIN</title>
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
    
    <!-- Page Add Section Begin -->
	<section class="page-add" style="margin-top: 30px;">
	<div class="row" id="add">
		<div class="col-lg-2"></div>
		<div class="col-lg-10">
			<div class="page-breadcrumb">
				<h2>
					질문 - 설정하기<span>.</span>
				</h2>
			</div>
		</div>
	</div>
	</section>
	<!-- Page Add Section End -->	
    	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
		<div class="row">
			<div class="col-2 text-center"></div>
			
			
			<div class="col-8">

				<!-- 글쓰기 폼 시작 -->
				<form action="./QueSettingAction.que" method="post" id="fr" onsubmit="return check()">
				
				
					
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">타입</th>
					      <th scope="col" class="text-center">범위</th>
					      
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">건성타입</th>
					      <td>점수 &#60;</td>
					      <td><input type="text" class="form-control" placeholder="점수" name="score1" id="score1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
					  		value="${qsdto.score1 }" style="width: 50px">
					      </td>
					    </tr>
					    <tr>
					      <th scope="row">중성타입</th>
					      <td>
					      	<input type="text" class="form-control" placeholder="점수" name="score2" id="score2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
								 value="${qsdto.score2 }" style="width: 50px">
								<td>&#60; 점수 &#60;</td>
								<td>
								<input type="text" class="form-control" placeholder="점수" name="score3" id="score3" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
								value="${qsdto.score3 }" style="width: 50px">
					      		</td>
					    </tr>
					    <tr>
					      <th scope="row">복합성타입</th>
					      <td>
					      	
					      	<input type="text" class="form-control" placeholder="점수" name="score4" id="score4" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
							  value="${qsdto.score4 }" style="width: 50px">
							  <td>&#60; 점수 &#60;</td>
							  <td>
							  <input type="text" class="form-control" placeholder="점수" name="score5" id="score5" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
							  value="${qsdto.score5 }" style="width: 50px">
					          </td>
					    </tr>
					    
					    <tr>
					      <th colspan="2">이외 지성</th>
					      
					    </tr>
					  </tbody>
					</table>
				
				
					<hr>
					<button type="submit" class="btn btn-primary mb-3">세팅하기</button>
				</form>
				<!-- 글쓰기 폼 끝 -->
				
			</div>
			
			<div class="col-2">	
			</div>			
		</div>
		
	</div>
	<!-- container 끝 -->	

	<!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 120px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
</body>
</html>