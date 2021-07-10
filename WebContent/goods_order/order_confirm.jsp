<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료 - 주문상세내역 | JUST SKIN </title>

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
		//List orderList = (List)request.getAttribute("orderList");
		//List goodsList = (List)request.getAttribute("goodsList");
		//DecimalFormat fmMoney = new DecimalFormat("###,###");
		//OrderDTO odto = (OrderDTO)orderList.get(0);
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
					<div><h4 style="color:#555555; padding-top:4px;">이용해주셔서 감사합니다.</h4></div>
					<div><h6 style="color:#a3a3a3; padding-top:6px;">주문 상세내역은 마이페이지&gt<a href="./Orderdetail.or?tradeNum=${orderList[0].o_tradeNum }">주문조회</a> 에서 확인하실 수 있습니다.</h6></div>
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
			<div style="margin: 10px 10px 10px 0;"><span style="margin:0 15px 0 3px;">주문번호</span><span style="color:orange;"><strong>${orderList[0].o_tradeNum }</strong></span>
			<span style="margin:0 10px 0 10px;">주문일자</span><span><strong>${orderList[0].orderDate }</strong></span></div>
			
			<!-- 주문 상세 내역 테이블 -->
			<table class="table" style="text-align: center; margin-bottom:100px; font-size:19px;">
				<thead class="thead-light">
				<tr>
					<th scope="col" colspan="2">상품정보</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">합계</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="orlist" items="${orderList }" varStatus="gd">
						<tr>
							<td><img src="./admingoods/upload/${goodsList[gd.index].cosImage.split(',')[0] }" width="100" height="100"></td>
							<td>${orlist.o_cosName }</td>
							<td><fmt:formatNumber value="${goodsList[gd.index].cosPrice }" pattern="#,###"/>원</td>
							<td>${orlist.o_cosAmount}</td>
							<td><fmt:formatNumber value="${orlist.o_cosAmount * goodsList[gd.index].cosPrice}" pattern="#,###" />원</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr></tr>
			</table>
			<!-- 주문 상세 내역 테이블 -->
			
			<!-- 배송 정보 테이블 -->
			<h3 style="color:#535353; margin-bottom:10px;">배송지 정보</h3>
			<table class="table" style="text-align: center; margin-bottom:100px;">
			<thead>
				<tr>
					<th class="table-active">수령인</th>
					<td>${orderList[0].receiverName }</td>
					<th class="table-active">주문날짜</th>
					<td>${orderList[0].orderDate }</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="table-active">연락처1</th>
					<td>
						${orderList[0].receiverTel.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3")}
<%-- 						${orderList[0].receiverTel.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3")} --%>
					<th class="table-active">주문상태</th>
					<td style="color:#ff5546; font-weight:bold;">주문완료(결제완료)</td>
				</tr>
				<tr>
					<th class="table-active">연락처2</th>
					<td>
						<c:choose>
							<c:when test="${orderList[0].receiverTel2 eq ''}" >-</c:when>
							<c:otherwise>${orderList[0].receiverTel2.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3")}</c:otherwise>
						</c:choose>
					</td>
					<th class="table-active">이메일</th>
					<td>
						<c:choose>
							<c:when test="${orderList[0].receiverEmail eq '' }" >-</c:when>
							<c:otherwise>${orderList[0].receiverEmail}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th class="table-active">배송지</th>
					<td>(${orderList[0].receiverAddr.split(',')[0] })
					 ${orderList[0].receiverAddr.split(',')[1] }  ${orderList[0].receiverAddr.split(',')[2]}
					</td>
					<th class="table-active">배송 메시지</th>
					<td>
						<c:choose>
							<c:when test="${orderList[0].o_msg eq '' }" >-</c:when>
							<c:otherwise>${orderList[0].o_msg}</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tbody>
			</table>
			<!-- 배송 정보 테이블 -->
			
			
			<!-- 결제 상세 내역 테이블 -->
			<h3 style="color:#535353;">결제 상세 내역</h3>
			<table class="table" style="text-align: center;">
			<thead>
				<tr class="table-active">
					<th>주문금액</th>
					<th>할인금액</th>
					<th>총 결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-light">
					<th style="font-size: 20px;"><fmt:formatNumber value="${orderList[0].sumMoney}" pattern="#,###"/>원</th>
					<th style="color: #0A82FF; font-size: 20px;">
						<span style="color:black;">쿠&nbsp&nbsp&nbsp폰 : </span><fmt:formatNumber value="${orderList[0].cpUseAmount}" pattern="#,###"/> 원<br>
						<span style="color:black;">포인트 : </span><fmt:formatNumber value="${orderList[0].ptUseAmount}" pattern="#,###"/>원
					</th>
					<th style="font-size:20px; color:#ff5546"><fmt:formatNumber value="${orderList[0].payMoney}" pattern="#,###"/>원<br>
					<span style="font-size:15px;">(${orderList[0].payType })</span></th>
				</tr>
			</tbody>
			</table>
			<!-- 결제 상세 내역 테이블 -->
			<ul style="color:#999999;">
				<li style="margin-left:20px;">카드결제시 현금영수증/세금계산서 발급이 불가능하며 카드전표로 대체하실 수 있습니다.</li>
				<li style="margin-left:20px;">PG사 또는 카드사에서 제공하는 즉시 할인은 최종 결제 금액에 반영되지 않습니다.</li>
			</ul>
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