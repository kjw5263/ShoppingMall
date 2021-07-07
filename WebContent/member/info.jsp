<%@page import="com.order.db.OrderDTO"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
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
<link rel="stylesheet" href="./css/N_style.css" type="text/css">
<link rel="stylesheet" href="./goods_board/style/review_user_list.css">


<style type="text/css">
* {
	margin: 0;
}

#grade b {
	color: orange;
	font-size: 25px;
}
</style>

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->



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
			</div>
		</div>


	</div>
	</section>
	<!-- Page Add Section End -->


	<div class="container-fluid">

	<c:set var="mdto" value="${mdto}"/>
	<c:set var="odto" value="${odto}"/>
	
	
		<div class="row">
			<div class="col-2"></div>
			<!--여백 -->
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

							<fieldset id="info">

								<div class="row">
									<h3>${mdto.userName}님의 정보
									</h3>
									<br> <br> <br>
								</div>
								<div class="row" style="text-align: center; font-size: 20px;"
									id="grade">


									<table class="table table-borderless">
										<tr>
											<th>등급</th>
											<th>쿠폰</th>
											<th>포인트</th>
											<th>적립금</th>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${mdto.userTotal > 0 && mdto.userTotal<= 99999}">
														<b>1</b>
													</c:when>
													<c:when test="${mdto.userTotal >= 100000 && mdto.userTotal<= 149999 }">
														<b>2</b>
													</c:when>
													<c:when test="${mdto.userTotal >= 150000 && mdto.userTotal }">
														<b>3</b>
													</c:when>
													<c:when test="${mdto.userTotal >= 200000}">
														<b>4</b>
													</c:when>
												</c:choose>
														level
											</td>
										<c:set var="cnt" value="0"/>
										<c:forEach var="result" items="${couponList}" varStatus="status">
											<c:set var="cnt" value="${cnt+result.mcAmount}" />
										</c:forEach>
										<td><a href="./MyCoupon.cp"><b><c:out value="${cnt}"/></b>
											</a> 장</td>
											<td><a href="" style="color: orange;"><b>${mdto.userPoint}</b></a>P</td>
											<td><a href="" style="color: orange;"><b>${mdto.userTotal}</b></a>원</td>
										</tr>
									</table>
								</div>
							</fieldset>

							<h4>주문 배송 조회</h4>
							<div style="text-align: right;">
								<a href="./getOrderList.or">> 더보기</a>
							</div>
							<br>
							
							<ul class="mypage-step-1" style="text-decoration: none;">
								<li>
									<div>
										<div class="contents1">결제완료</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
								<li>
									<div>
										<div class="contents1">상품준비</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
								<li>
									<div>
										<div class="contents1">준비완료</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
								<li>
									<div>
										<div class="contents1">배송준비</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
								<li>
									<div>
										<div class="contents1">배송중</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
								<li>
									<div>
										<div class="contents1">배송완료</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
								<li>
									<div>
										<div class="contents1">주문취소</div>
										<div class="contents2">
											<b></b>
										</div>
									</div>
								</li>
							</ul>



							<br> <br>
							<c:choose>
								<c:when test="${LikeList != null}">
								<h4 style="margin-bottom: 10px;">
								찜 목록 (총 <b style="color: orange;">${fn:length(LikeList)}</b>개)
							</h4>
							<h5 style="text-align: right;">
								<a href="./getLike.li">> 더보기 </a>
							</h5>
							<hr>
							<!-- v필드세세세세세세세세세  -->
							<fieldset style="padding: 20px;"">
								<div class="row">
									<table style="text-align: center;">
										<tr>
										
										<c:set var="size" value="${fn:length(LikeList)}"/>
										<c:set var="col" value="4"/>
										<c:set var="row" value="(${size} / ${col}) + ((${size}%${col})>0? 1 : 0)"/>
										<c:set var="num" value="0"/>
										
										<tr>
											<c:forEach begin="0" end="3" step="1" items="${LikeList}" var="LikeList">
												<c:set var="true" value="true"/>
												<c:if test="${true == true}">
												<td>
												<a href="./GoodsDetail.cos?cosNum=${LikeList.cosNum}"> 
											<img src="./admingoods/upload/${LikeList.cosImage.split(",")[0]}"
														width="120" height="120">	
												</a> <br> ${LikeList.cosBrand }<br> ${LikeList.cosName }
												</td>
												<c:set var="num" value="${num+1}"/>
											</c:if>
												<c:if test="${size<=num}">
													<c:set var="true" value="false"/>
												</c:if>
											</c:forEach>
											
										</tr>
									</table>
								</div>
							</fieldset>	
							
							
								</c:when>
								<c:otherwise>
									<h4 style="margin-bottom: 10px;">찜 목록 (총 0개)</h4>
							<h5 style="text-align: right;">
								<a href="./getLike.li">> 더보기 </a>
							</h5>
							<hr>
							<fieldset style="padding: 20px;"">
								<div class="row">
									<table style="text-align: center;">
										<tr>
											<th>찜 목록이 없습니다.</th>
										</tr>
									</table>
								</div>
							</fieldset>
								
								</c:otherwise>
							</c:choose>
						

							<hr>
							<br> <br> <br>
							<h4 style="margin-bottom: 10px;">나의 피부타입</h4>
							<hr>
							<fieldset style="padding: 20px;">
								<div class="row" style="text-align: center; font-size: 20px;">
									<div class="col-3">
										<b>피부타입</b><br>${mdto.userSkinType}
									</div>
									<div class="col-3">
										<b>피부고민</b><br>${mdto.userTrouble}
									</div>
									<div class="col-6" style="margin: auto;">
										<input type="button" class="primary-btn look-btn"
											style="background-color: #B0BCC2;" value="내 피부에 맞는 화장품 보러가기">
									</div>
								</div>
							</fieldset>
							
							<br> <br> <br> <br> <br> <br>
						</div>
					</div>
				</div>
				<!--6 -->



				<div class="col-2"></div>
			</div>
			<!-- container 끝 -->

			<br> <br> <br> <br>
			<!-- footer 시작 -->
			<jsp:include page="../footer/footer.jsp" />
			<!-- footer 시작 -->
</body>
</html>