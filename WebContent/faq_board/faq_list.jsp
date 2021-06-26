<%@page import="com.faq.db.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->



</head>
<body>
  <%
    // request.setAttribute("goodsList", gdao.getGoodsList());
    List faqList = (List)request.getAttribute("faqList");
  %>


	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
	
	
	<!-- 제목 시작 -->
	  <div class="col-md-12 text-center p-5 row">
	  
		  <div class="col-2"></div>
			<div class="col-2">
		   		<a href="./FaqList.faq" style="text-decoration-line: none; color: black;"> <h3>고객 센터</h3> </a>
			</div>
		  <div class="col-8"></div>
		
	  </div>
	<!-- 제목 끝 --> 	
				
	<!-- 글쓰기 버튼 시작 -->			
		<div class="row">
			<div class="col-9"></div>
			<div class="col-3">
			<button type="button" class="btn btn-secondary" onclick="location.href='./FaqWrite.faq'">글쓰기</button>
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
				  	<tr>
				      <th class="text-center">번호</th>
				      <th class="text-center">내용</th>
				    </tr>
				    
				    <%for(int i = 0; i < faqList.size(); i++){ 
						FaqDTO fdto = (FaqDTO)faqList.get(i);
					%>
				    <tr id="<%=fdto.getFaqNum()%>">
				      <th class="text-center"><%=fdto.getFaqNum() %></th>
				      <td class="text-center" style='cursor:pointer;'>
				      	<%=fdto.getFaqQuestion() %><br><br>
				       	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='./FaqWrite.faq'">수정</button> /
				       	<button type="button" class="btn btn-danger btn-sm" onclick="location.href='./FaqWrite.faq'">삭제</button>
				       </td>
				    </tr>
				    
				    <tr style="display: none;" id="<%=fdto.getFaqNum()%>_answer">
					  <th class="text-center">답변</th>
					  <td class="text-center"><b><%=fdto.getFaqAnswer() %></b></td>
				    </tr>
				    <%} %>
				    
				  </tbody>
				</table>
				<!-- faq 테이블 끝 -->
			</div>
			
			
			
			<div class="col-2">	</div>
			
			
		</div>
		
	</div>
	<!-- container 끝 -->	
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
    
    <!-- 스크립스 시작 -->
    <script type="text/javascript">
	// 제이쿼리 시작    
    $(function() {
    	// 질문 클릭시 답변 보이기 시작
    	$('tr').click(function() {
    		// alert('클릭됐습니다.');
    		
			var fnum = $(this).attr('id');
			
			// alert(fnum);
			
			
			var con = document.getElementById(fnum + "_answer");
			con.style.display = (con.style.display != 'none') ? "none" : "";
			
			//alert(fnum);

    	});
    	// 질문 클릭시 답변 보이기 끝
    });
 	// 제이쿼리 끝
    </script>
	
</body>
</html>