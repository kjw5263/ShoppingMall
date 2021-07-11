<%@page import="com.faq.db.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>FAQ | JUST SKIN </title>
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
    <link rel="stylesheet" href="./css/topimage.css" type="text/css">


	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->
	<script src="./js/chatbot.js" type="text/javascript"></script>


</head>
<body>

	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
 <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>FAQ<span>.</span></h2>
                        <h3>자주 묻는 질문</h3>
						<b>*다른 문의사항은 챗봇으로 문의해주세요.</b>
                    </div>
                </div>
                <div class="col-lg-8">
                     <div class="row">
                    <div class="col-lg-12" id="topimg_bg">
                       <div id="topimg_ch" >
                        <h1>2021</h1>
                        <h2>BEST SELLER.</h2>
                      </div>
                        </div>
               </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->
	
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
				
	<!-- 글쓰기 버튼 시작 -->			
		<div class="row">
			<div class="col-9"></div>
			<div class="col-3">
				<c:if test="${userId eq 'admin' }">
					<button type="button" class="btn btn-secondary" id="write">글쓰기</button>
				</c:if>
			</div>
		</div>
	<!-- 글쓰기 버튼 시작 -->
	
		<div class="row">
			<div class="col-2 text-center"></div>
			<div class="col-8">	
				
				<!-- 테이블 카테고리 시작 -->
				<table class="table mb-0 mt-5">
				  <thead class="table table-bordered text-center">
				  	<tr>
				      <th scope="col"><a href="./FaqList.faq">전체</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=회원관련">회원관련</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=주문결제">주문결제</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=포인트">포인트</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=환불">환불</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=배송안내">배송안내</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=상품관련">상품관련</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=기타">기타</a></th>
				    </tr>
				  </thead>
				</table>
				<!-- 테이블 카테고리 끝 -->
				
				<!-- faq 테이블 시작 -->
				<table class="table">
				  <tbody>
				  	<tr class="table-active">
				      <th class="text-center">유형</th>
				      <th class="text-center">내용</th>
				      <th class="text-center"></th>
				      
				    </tr>
				    <c:forEach var="i" items="${ faqList }">
				    <tr>
				      <th class="text-center" style="width: 10%">${i.faqCategory }</th>
				      <td class="text-center" style='cursor:pointer;' id="${i.faqNum }">
				      	${i.faqQuestion }<br><br>
				       </td>

				      <c:choose>
					      <c:when test="${userId eq 'admin' }">
						  <th id="${i.faqNum }" style="width: 10%">
					      	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='./FaqRevise.faq?faqNum=${i.faqNum }'">수정</button> /
					       	<span type="button" class="btn btn-danger btn-sm" onclick="location.href='./FaqDelete.faq?faqNum=${i.faqNum }'">삭제</span>					  
						  </th>
						  </c:when>
						  <c:otherwise>
						  	<th id="${i.faqNum }" style="width: 10%"></th>
						  </c:otherwise>
					  </c:choose>
					  
				    </tr>
				    <tr style="display: none;" id="${i.faqNum }_answer" class="table-secondary">
					  <th class="text-center">답변</th>
					  <td class="text-center" style="width: 650px"><b style="width: 737;">${i.faqAnswer }</b></td>
					  <th></th>
					  
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				<!-- faq 테이블 끝 -->
				
				
			</div>
			<div class="col-2">	</div>
		</div>
	</div>
	<!-- container 끝 -->	
	
	<!-- Page End Section Begin -->
	<section class="page-add">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-9">
			<div class="page-breadcrumb"></div>
		</div></div>
	</section>
	<!-- Page End Section End -->
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
    
    <!-- 질문 클릭시 답변 보이기 스크립스 시작 -->
    <script src="./js/faq_list.js"></script>
    <!-- 질문 클릭시 답변 보이기 스크립스 끝 -->
	
</body>
</html>