<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<!-- 화장품 리스트 css 시작 -->
    <link rel="stylesheet" href="./css/question/queCustomizedlist.css" type="text/css">
	<!-- 화장품 리스트 css 끝 -->

	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->

</head>
<body>

	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->

	<div class="container-fluid"></div>
	<!-- container 시작 -->	
	<div class="container text-center mt-5">	
		<h4><b>${userSkinType} 피부타입을 위한 추천 화장품</b></h4>		
		
		<div class="row mt-5">
		
			<c:forEach var="i" items="${ CumtomizedList }">
			
               <div class="col-lg-3 col-sm-6 mix all ${i.cosBrand} ${i.cosCategory} ${i.cosSkinType}">
                   <div class="single-product-item">
                       <figure>
                           <a href="./GoodsDetail.cos?cosNum=${i.cosNum}"><img src="./admingoods/upload/${i.cosImage.split(',')[0]}" alt=""></a>
                           <div class="p-status">new</div>
                       </figure>
                       <div class="product-text">
                           <h6>${i.cosName}</h6>
                           <p><fmt:formatNumber value="${i.cosPrice}" pattern="#,###"/>원  </p>
                           
                           <img src="./img/add_basket.png" width="35px" height="30px" alt="" 
                            onclick="location.href='http://localhost:8088/ShoppingMall/Goods_basketpro.cos?cosAmount=1&cosNum=${i.cosNum} '"
                            style='cursor:pointer;'>
                            
                            <img src="./img/icons/heart1.png" width="40px" 
                            onclick="location.href='./insertLike.li?cosNum=${i.cosNum}'"
                            style='cursor:pointer; margin-left:10px; margin-top:10px;'>
                            
                            
           		
                       </div>
                   </div>
               </div>
             </c:forEach>
               
			
			</div>
		</div>
	<!-- container 끝 -->	
	
	<hr>
	
	
	<div class="container-fluid">
	
		<div class="row m-5">
			<div class="col-5"></div>
			<div class="col-2 text-center">
					<!-- 일반 로그인 버튼 시작 -->
					<input class="login100-form-btn" type="button" value="더 많은 제품 보러가기" onclick="location.href='./GoodsList.cos'" style='cursor:pointer;'> 
					<!-- 일반 로그인 버튼 끝 -->
			</div>
			<div class="col-5"></div>
		
		</div>
			
	</div>
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
	
<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/jquery.slicknav.js"></script>
<script src="./js/jquery.nice-select.min.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/mixitup.min.js"></script>
<script src="./js/main.js"></script>
<script type="text/javascript"></script>
	
	
</body>

</html>
