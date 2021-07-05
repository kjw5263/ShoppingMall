<%@page import="java.util.ArrayList"%>
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
					
						
						<h4>주문 배송 조회</h4>
						<br>
						<%
						int status1 = 0;
						int status2 = 0;
						int status3= 0;
						int status4 = 0;
						int status5 = 0;
						int status6 = 0;
						int status7 = 0;
						int status8 = 0;
						String status = "";
						for(int i=0;i<orderList.size();i++){
							OrderDTO odto2 = (OrderDTO)orderList.get(i);
							status = odto2.getOrderStatus();
						
						}	
							switch (status) {
							case "결제완료" : status1++;
							case "상품준비" : status2++; 
							case "상품준비완료" : status3++;
							case "배송준비" : status4++; 
							case "배송중" : status5++;
							case "배송완료" : status6++;
							case "주문취소" : status7++; 
							}
				
						
						%>
						<ul class="mypage-step" style="text-decoration: none;">
							<li>
								<div>
									<div class="contents1">결제완료</div>
									<div class="contents2"><%=status1 %></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">상품준비</div>
									<div class="contents2"><%=status2%></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">준비완료</div>
									<div class="contents2"><%=status3 %></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">배송준비</div>
									<div class="contents2"><%=status4 %></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">배송중</div>
									<div class="contents2"><%=status5 %></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">배송완료</div>
									<div class="contents2"><%=status6 %></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">주문취소</div>
									<div class="contents2"><%=status7 %></div>
								</div>
							</li>
						</ul>

						<table class= "table table-bordered" style="margin-top: 8%" id="orderList">
							<thead class="order-thead">
								<tr>
									<th>주문일자</th>
									<th>상품</th>
									<th>수량</th>
									<th>주문금액</th>
									<th>상태</th>
								</tr>
							</thead>
							<%for(int i=0;i<orderList.size();i++){
								OrderDTO odto = (OrderDTO)orderList.get(i);
								GoodsDTO gdto = (GoodsDTO)goodsList.get(i);
								
								
								%>
							<tbody>
								<tr>
									<td><%=odto.getOrderDate()%><br> <a href="Orderdetail.or?tradeNum=<%=odto.getO_tradeNum() %>" id="detail">상세보기</a></td>
									<td>
										<ul class="goods-view">
											<li>
											<img src="./admingoods/upload/<%=gdto.getCosImage().split(",")[0] %>" width="100px" height="100px;">
											</li>
											<li>
											<b id="brand"><%=gdto.getCosBrand() %></b><br>
											<%=odto.getO_cosName()%>
											</li>
										</ul>
									</td>
									<td><%=odto.getO_cosAmount()%></td>
									<td><b id="price"><%=odto.getSumMoney()%><b>원</td>
									<td><%=odto.getOrderStatus() %></td>
								</tr>
							</tbody>
							<%} %>
						</table>
					
						<br> <br> <br>
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