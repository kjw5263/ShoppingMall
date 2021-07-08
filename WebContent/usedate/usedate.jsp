<%@page import="com.usedate.db.UsestatusDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.usedate.db.UsedateDAO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.usedate.db.UsedateDTO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.like.db.LikeDTO"%>
<%@page import="com.like.db.LikeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">
<link rel="stylesheet" href="./css/progress.css" type="text/css">
<link rel="stylesheet" href="./goods_board/style/review_user_list.css">




<style type="text/css">
* {
	margin: 0;
}

#cb {
	zoom: 1.5;
}

.progress-bar {
	width: 500px;
}
</style>
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	<%
		String userId = (String) session.getAttribute("userId");

		if (userId == null) {
			response.sendRedirect("../MemberLogin.me");
		}
		
		int cnt = (int)request.getAttribute("cnt");
		int pageSize = (int)request.getAttribute("pageSize");
		int startRow = (int)request.getAttribute("startRow");
		String pageNum1 = (String)request.getAttribute("pageNum");
	 	int pageNum = Integer.parseInt(pageNum1);
		int currentPage = (int)request.getAttribute("currentPage");
		
	
	%>


	<!-- container 시작 -->


	<!-- Page Add Section Begin -->
	<section class="page-add">
		<div class="row">
			<div class="col-lg-3"></div>

			<div class="col-lg-9">
				<div class="page-breadcrumb">
					<h2>
						MY PAGE<span>.</span>
					</h2>
					<h4>내 화장품 사용기한 확인 / 등록하기</h4>
				</div>
			</div>


		</div>
	</section>
	<!-- Page Add Section End -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row">
					<div class="col-2">
						<div class="mypage-lnb1">
								<ul>
									<li>
										<h2>나의 쇼핑</h2>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./getOrderList.or">주문/배송조회</a></li>
											<li class="subMenu"><a href="">취소/반품/교환내역</a></li>
										</ul>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./BasketList.ba">장바구니</a></li>
											<li class="subMenu"><a href="./getLike.li">좋아요</a></li>
											<li class="subMenu"><a href="./MyCoupon.cp">포인트 / 쿠폰</a></li>
										</ul>
									</li>
									<li class="line" style="list-style: none">
										<h2>나의 활동</h2>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./ReviewList.rev">리뷰</a></li>
											<li class="subMenu"><a href="./Usedate.ud">화장품 사용기한 조회</a></li>
										</ul>
									</li>
									<li class="line" style="list-style: none">
										<h2>나의 정보</h2>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./MemberUpdateInfo.me">회원정보수정</a></li>
											<li class="subMenu"><a href="./MemberDelete.me">회원탈퇴</a></li>
										</ul>
									</li>
								</ul>
								</div>
						</div>
					<div class="col-10">
							
						
						
						<table class="table">
							<tr>
								<th colspan="4" style="text-align: center;">내가 구매한 상품</th>
								<th>개봉하기</th>
							</tr>
							
							<c:set var="result" value="0"/>
							<c:choose>
								<c:when test="${orderList != null}">
									<c:forEach begin="0" var="orderList" items="${orderList}" varStatus="status">
										<!-- 설정값   -->
									
										<c:choose>
										<c:when test="${usestatus[status.index].open_status == 1}">
											<c:set var="result" value="${usestatus[status.index].remain_amount}"/>
										</c:when>
										<c:when test="${usestatus[status.index].open_status == 0}">
											<c:set var="result" value="${orderList.o_cosAmount}"/>
										</c:when>
										</c:choose>
									
											<c:choose>
											<c:when test="${usestatus[status.index].first_open == 1 && usestatus[status.index].remain_amount <= 0 }">
												<input type="button" value="OPEN 완료"
												class="btn btn-secondary" id="open"
												onclick="alert('모두 사용했습니다.')">
											</c:when>
										
										</c:choose>
										
										<c:if test="${usestatus[status.index].first_open == 0 && usestatus[status.index].remain_amount > 0 }">
												<input type="button" value="OPEN" class="btn btn-info"
												onclick="location.href='opencosAction.ud?cosNum=${orderList.o_cosNum}&openstatus=${usestatus[status.index].open_status}&openstatus=${usestatus[status.index].open_status}&cosAmount=${orderList.o_cosAmount}&firstopen=${usestatus[status.index].first_open}&statusnum=${usestatus[status.index].status_Num}&oNum=${o_Num}'">
												
										</c:if>
									
										<c:set var="oNum" value="${orderList.o_Num}"/>
										
										<!-- 설정값   -->
									
									<tr>
										<td>
										<img src="./admingoods/upload/${goodsList[status.index].cosImage.split(",")[0]}"
											width="150px" height="150px"></td>
										<td>
											<b>${goodsList[status.index].cosName}</b><br> <br>
											개봉 후 사용 기한 : <b>${goodsList[status.index].useDate}</b> 개월 <br> 주문일자
											${orderList.orderDate}<br>
											수량 : ${result} 개
										</td>
									 </tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>

						<!--페이징 처리  -->
						<!--여기에에에엥에ㅔㅔ엥  -->



					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>



	</div>
	<!-- Page Add Section Begin -->
	<section class="page-add"></section>
	<!-- Page Add Section End -->

	<!-- container 끝 -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->




</body>
</html>