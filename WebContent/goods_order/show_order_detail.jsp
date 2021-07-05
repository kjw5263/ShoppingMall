<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet" href="./css/N_style.css" type="text/css">



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
	<div class="row">
		<div class="col-lg-3"></div>

		<div class="col-lg-9">
			<div class="page-breadcrumb">
				<h2>
					MY PAGE<span>.</span>
				</h2>
				<br>
				<h4>
					주문조회<span>.</span>
				</h4>
			</div>
		</div>


	</div>
	</section>
	<!-- Page Add Section End -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-2"></div><!--여백   -->
			<div class="col-8"><!--내용 넣는 공간  -->
				<div class="row">
					<div class="col-3">
						<a href=""><h5>장바구니</h5></a> <a href=""><h5>주문조회</h5></a> <a
							href="./getLike.li"><h5>찜목록</h5></a>
						<hr>
						<a href="./MyCoupon.me"><h5>내 쿠폰 / 포인트</h5></a>
						<hr>
						<a href=""><h5>내 화장품 사용기한 &nbsp;확인하기</h5></a>
						<hr>
						<a href="./MemberUpdateInfo.me"><h5>회원 정보 수정</h5></a> <a
							href="./MemberDelete.me"><h5>탈퇴하기</h5></a>
					</div>
					<div class="col-9">
					
						<h3>주문 상세 조회</h3><br>
						
						<fieldset class="orderday">
							<ul>
								<li><div>구매일자</div></li>
								<li><div>주문번호</div></li>
							</ul>
						</fieldset>
						
						
						
						<h4>구매내역</h4>
						<table class= "table table-bordered" style="margin-top: 8%" id="orderList">
							<thead class="order-thead">
								<tr>
									<th colspan="2">상품명</th>
									<th>판매가</th>
									<th>수량</th>
									<th>진행현황</th>
								</tr>
							</thead>
							<tbody>
							<%for(int i=0;i<orderList.size();i++){
								GoodsDTO gdto = (GoodsDTO)goodsList.get(i);
								OrderDTO odto = (OrderDTO)orderList.get(i);
							%>
								<tr>
									<td>
									
									<img src="./admingoods/upload/<%=gdto.getCosImage().split(",")[0] %>" width="100px" height="100px">
									</td>
									<td>
									<b id="brand"><%=gdto.getCosBrand() %></b><br>
									<%=gdto.getCosName() %>
									</td>
									<td><%=gdto.getCosPrice() %></td>
									<td><%=odto.getO_cosAmount() %>개</td>
									<td><%=odto.getOrderStatus() %></td>
								
								</tr>
							<%} %>
							</tbody>
						
						</table>
						
						<h4>배송지 정보</h4>
						<table class= "table table-bordered" style="margin-top: 8%" id="orderList">
						<% OrderDTO odto = (OrderDTO)orderList.get(0);
							GoodsDTO gdto = (GoodsDTO)goodsList.get(1);%>
							<tr>
								<td>받는 사람</td>
								<td><%=odto.getReceiverName() %></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						
						
						</table>
						
						
						<h4>결제 정보</h4>
				
					</div>
				</div>
			</div>
			<div class="col-2"></div><!--여백   -->
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