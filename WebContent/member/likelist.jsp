<%@page import="java.util.ArrayList"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.like.db.LikeDTO"%>
<%@page import="com.like.db.LikeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 좋아요 | JUST SKIN</title>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
<link rel="stylesheet" href="./goods_board/style/review_user_list.css">
<link rel="stylesheet" href="./css/topimage.css" type="text/css">

<style type="text/css">
#cb {
	zoom: 1.5;
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
		%>


	<!-- container 시작 -->


	<!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>MY PAGE<span>.</span></h2>
                        <h4>나의 좋아요</h4>
                        <a href="./Main.me">Home</a>
                        <a href="./MemberInfo.me">MY PAGE</a>
                        <a class="active" href="">나의 좋아요</a>
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
						<h3>
							나의 찜목록 (총 <b style="color: orange;">${cnt }</b>개)
						</h3>
						<br>

						<table class="table">
							<tr>
								<th colspan="2">상품</th>
								<th>관리</th>
							</tr>
							<c:if test="${LikeList != null}">
								<c:forEach var="LikeList" items="${LikeList}">
									<form action="./deleteLike.li" method="get">
								<tr>
									<input type="hidden" name="cosnum"
										value="${LikeList.cosNum}">
									<td><img
										src="./admingoods/upload/${LikeList.cosImage.split(",")[0]}"
										width="150px" height="150px"></td>
									<td><b>${LikeList.cosBrand }</b><br> ${LikeList.cosName }
										<h4> <fmt:formatNumber value="${LikeList.cosPrice }" pattern="#,###"/>원
										</h4></td>

									<td><input type="image" src="./img/icons/heart1.png"
										width="40px" style="margin-top: 50%"></td>
							</form>
							</tr>
								
								</c:forEach>
							</c:if>
							
							
							
						</table>

						<!--페이징 처리  -->
						<div style="margin-left: 45%;">
							<ul class="pagination">
								<c:if test="${cnt != 0}">
									
									<c:set var="pageCount" value="${cnt/pageSize+(cnt % pageSize == 0? 0:1)}"/>
									<c:set var="pageBlock" value="1"/>
									<fmt:parseNumber var= "startPage" integerOnly= "true" value="${((currentPage-1)/2) * 2 + 1}" />
									<c:set var="endPage" value="${startPage + pageBlock-1 }"/>
								
									
									<c:choose>
										<c:when test="${startPage > pageBlock}">
												<li class="page-item"><a class="page-link"
											href="./getLike.li?pageNum=${startPage-pageBlock}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:when>
									</c:choose>
									
										<c:forEach begin="${startPage }" end="${endPage}" var="i">
											<li class="page-item"><a class="page-link"
																		href="./getLike.li?pageNum=${i}" class="btn btn-primary btn">${i}</a></li>
										</c:forEach>
									
									<c:choose>	
										<c:when test="${endPage > pageCount }">
											<c:set var="endPage" value="${pageCount}"/> 
										</c:when>
										
										<c:when test="${endPage < pageCount}">
											<li class="page-item"><a class="page-link"
										href="./getLike.li?pageNum=${startPage+pageBlock}" ara-label="Next"> 
										<span aria-hidden="true">&raquo;</span></a></li>
										</c:when>
									</c:choose>
								</c:if>
								
							</ul>
						</div>
						<!-- 페이징 처리 -->





					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>



	</div>
	<!-- Page Add Section Begin -->
	<section class="page-add"> </section>
	<!-- Page Add Section End -->

	<!-- container 끝 -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->




</body>
</html>