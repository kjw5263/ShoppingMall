<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 상세 조회 | JUST SKIN</title>
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
<link rel="stylesheet" href="./css/topimage.css" type="text/css">



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

		List orderList = (List)request.getAttribute("orderList");
		List goodsList = (List)request.getAttribute("goodsList");
		
	%>


	<!-- container 시작 -->


		<!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>MY PAGE<span>.</span></h2>
                        <h4>주문 상세조회</h4>
                        <a href="./Main.me">Home</a>
                        <a href="./MemberInfo.me">MY PAGE</a>
                        <a href="./getOrderList.or">주문 조회</a>
                        <a class="active" href="">상세 조회</a>
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
			<!--여백   -->
			<div class="col-8">
				<!--내용 넣는 공간  -->
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
										<li class="subMenu"><a href="">상품Q&A내역</a></li>
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
						<c:set var="odto1" value="${orderList.get(0) }"/>

						<h3>주문 상세 조회</h3>
						<br>
						<fieldset id="order-detail">
							<ul>
								<li>구매일자 : <fmt:formatDate value="${odto1.orderDate }" pattern="yyyy-MM-dd"/></li>
								<li>주문번호 : ${odto1.o_tradeNum}</li>
							</ul>
						</fieldset>

						<h4 id="detail-h4">구매내역</h4>
						<table class="table table-bordered" id="orderList">
							<thead class="order-thead">
								<tr>
									<th colspan="2">상품명</th>
									<th>판매가</th>
									<th>수량</th>
									<th>진행현황</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach var="odto3" items="${orderList}" varStatus="st" end="${fn:length(orderList)}">
								<tr>
									<td><img
										src="./admingoods/upload/${goodsList[st.index].cosImage.split(',')[0]}"
										width="100px" height="100px"></td>
									<td><b id="brand">${goodsList[st.index].cosBrand}</b><br>${goodsList[st.index].cosName}
									</td>
									<td>₩<fmt:formatNumber value="${goodsList[st.index].cosPrice}" pattern="#,###"/></td>
									<td>${odto3.o_cosAmount} 개</td>
									<td>${odto3.orderStatus}</td>
								</tr>
							</c:forEach>
								
							</tbody>

						</table>
						<h4 id="detail-h4">배송지 정보</h4>
						<table class="table table-bordered" id="orderList">
							<tr>
								<td>받는 사람</td>
								<td>${odto1.receiverName}</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>${odto1.receiverTel}</td>
							</tr>
							<tr>
								<td>예비 연락처</td>
								<td>
								<c:choose>
									<c:when test="${odto1.receiverTel2 eq null}">없음</c:when>
									<c:otherwise>${odto1.receiverTel2 }</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${odto1.receiverEmail }</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${odto1.receiverAddr }</td>
							</tr>
							<tr>
								<td>배송시 주의사항</td>
								<td>
								<c:choose>
									<c:when test="${odto1.o_msg eq null }">없음</c:when>
									<c:otherwise>${odto1.o_msg}</c:otherwise>
								</c:choose>
								</td>
							</tr>


						</table>


						<h4 id="detail-h4">결제 정보</h4>

						<table class="table table-bordered" id="orderList">
							<tr>
								<td>총 상품 금액<br>
								<b id="money">${odto1.sumMoney}</b> 원
								</td>
								<td>쿠폰 할인 금액<br>
								<b id="money">${odto1.cpUseAmount}</b> 원
								</td>
								<td>적립 포인트<br>
								<b id="money">${odto1.addPoint}</b> p
								</td>
							</tr>
							<tr>
								<td colspan="3" id="allmoney"><b>총 결제 금액 : </b><b
									id="money"><fmt:formatNumber value="${odto1.payMoney}" pattern="#,###"/>
									</b> <br>
									ㄴ <b>결제 수단 :</b>
									<c:choose>
										<c:when test="${odto1.payType == 0}">카드</c:when>
										<c:when test="${odto1.payType == 1}">계좌이체</c:when>
										<c:when test="${odto1.payType == 2}">카카오 페이</c:when>
									
									</c:choose>
									</td>
							</tr>

						</table>

						<div style="text-align: center;">
							<input type="button" class="primary-btn look-btn"
								style="background-color: #B0BCC2;" value="목록"
								onclick="history.back();">
						</div>


					</div>
				</div>
			</div>
			<div class="col-2"></div>
			<!--여백   -->
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