<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
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
    
</head>
<body>

	<%
		List orderList = (List)request.getAttribute("orderList");
		List goodsList = (List)request.getAttribute("goodsList");
		DecimalFormat fmMoney = new DecimalFormat("###,###");
		int sumMoney=0;
		int sumAmount=0;
	%>

	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
		<div class="row">
			<div class="col-3 text-center">
			</div>
			<div class="col-6" style="display: flex; align-items: center; padding:180px 0 100px 0;">
				<div style="float:inline-block; padding-left:15%;"><img src="./img/icons/check1.png"></div>
				<div style="padding-left:4%;">
					<div><h2>주문이 완료되었습니다.</h2></div>
					<div><h4 style="color:#999999; padding-top:4px;">이용해주셔서 감사합니다.</h4></div>
					<div><h6 style="color:#a3a3a3; padding-top:6px;">주문 상세내역은 마이페이지&gt<a href="#">주문조회</a> 에서 확인하실 수 있습니다.</h6></div>
				</div>
			</div>
			<div class="col-3">
			</div>
		</div>
		
		<div class="row">
			<div class="col-2">
			</div>
			<div class="col-8" style="padding-bottom:200px;">
			<h3 style="color:#535353;">주문 상세 내역</h3>
			<div style="margin: 10px 10px 10px 0;"><span style="margin:0 15px 0 3px;">주문번호</span><span style="color:orange;"><strong><%=((OrderDTO)orderList.get(0)).getO_tradeNum() %></strong></span>
			<span style="margin:0 10px 0 10px;">주문일자</span><span><strong><%=((OrderDTO)orderList.get(0)).getOrderDate() %></strong></span></div>
			<table class="table" style="text-align: center; margin-bottom:50px;">
				<thead class="thead-light">
				<tr>
					<th scope="col" colspan="2">상품정보</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">합계</th>
				</tr>
				</thead>
				<tbody>
					<%for(int i=0; i<orderList.size(); i++){ 
						OrderDTO orDTO = (OrderDTO)orderList.get(i);
						GoodsDTO gDTO = (GoodsDTO)goodsList.get(i);
						%>
						<tr>
							<td><img src="<%=gDTO.getCosImage().split(",")[0] %>" width="100" height="100"></td>
							<td><%=orDTO.getO_cosName() %></td>
							<td><%=fmMoney.format(gDTO.getCosPrice()) %>원</td>
							<td><%=orDTO.getO_cosAmount() %></td>
							<td><%=fmMoney.format(orDTO.getO_cosAmount()*gDTO.getCosPrice()) %>원</td>
						</tr>
					<%} %>
				</tbody>
				<tr></tr>
			</table>
			
			
			<h3 style="color:#535353;">결제 상세 내역</h3>
			<table>
			<thead>
				<tr></tr>
			</thead>
			<tbody>
			
			</tbody>
			</table>
			</div>
			<div class="col-2" style="">
			</div>
		</div>
	
	</div>
	<!-- container 끝 -->	

	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
</body>
</html>