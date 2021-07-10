<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">

    <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
    <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
    <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
    <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
    
<title>장바구니 | JUST SKIN</title>
</head>
<body>
<!-- Header Section Begin -->
<jsp:include page="/header/header.jsp"/>
<!-- Header Section End -->

   <!-- Page Add Section Begin -->
	<section class="page-add">
	<div class="row" style="margin-bottom: -2%;">
		<div class="col-lg-2"></div>
		<div class="col-lg-10">
			<div class="page-breadcrumb">
				<h2>
					장바구니<span>.</span>
				</h2>
			</div>
		</div>
	</div>
	</section>
	<!-- Page Add Section End -->
    
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
	<div class="row">
		<div class="col-0 text-center">
		<!-- left -->
		</div>
		
		<div class="col-12 text-center">
			
    <!-- goods basket list start -->
    
	<%
		// 전달된 정보를 저장
		List basketList = (List) request.getAttribute("basketList");
		List goodsList = (List) request.getAttribute("goodsList");
	%>

    <section class="admin_goods_list">
        <c:choose>
        <c:when test="${fn:length(basketList) == 0}">
	        <div class="container">
	        <section class="page-add">
	        <p><img src="./img/cart.png" alt="sale" style="margin-top: 50px;"></p><br>
	        <p style="text-align: center; font-size:19px; color:black;"><b>장바구니에 담긴 상품이 없습니다.</b></p>
	        <p style="margin-top: -10px;">원하는 상품을 장바구니에 담아보세요!</p>
	        <button class="btn btn-secondary btn-lg" onclick="location.href='GoodsList.cos';"
					style="margin-bottom: -40px; margin-top: 10px"
			>계속 쇼핑하기</button>
	        <div class="container">
	        </div>
	    	</section>
	        </div>
        </c:when>
        <c:otherwise>
        <div class="container">
        <form name="form" method="post" action="./BasketList.ba">
	        <div align="left">
			    <input type="submit" value="선택삭제" onclick="javascript: form.action='BasketDelete.ba'" class="btn btn-secondary"/>
		    </div>
			<table class="table" class="table" style="text-align: center; margin-top:25px; font-size:19px">
				<thead class="thead-light">
					<tr>
						<th>
						<input type="checkbox" name="allCheck" id="allCheck"/>
						<label for="allCheck" style="color:black; margin-bottom:-10px; font-size:18px">&nbsp;모두 선택</label>
						<script>
							$("#allCheck").click(function(){
								var chk = $("#allCheck").prop("checked");
								if(chk){
									$(".del-id").prop("checked", true);
								} else {
									$(".del-id").prop("checked", false);
								}
							});
						</script>						
						</th>
						<th colspan="12"></th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<th scope="col">선택</th>
					<th scope="col" colspan="2">상품정보</th>
					<th>가격</th>
					<th colspan="4">수량</th>
				</tr>
				
				<c:forEach var="i" items="${ basketList }" varStatus="god">
				
				<tr>
					<td>
						<input type="checkbox" name="del-id" class="del-id" value="${i.basketNum}"/>
 							<script>
 							 $(".del-id").click(function(){
 							  $("#allCheck").prop("checked", false);
 							 });
 							</script>			
					</td>
					<td>
						<input type="hidden" name="bkNum" class="bkNum" value="${i.basketNum}"/>
						<img src="./admingoods/upload/${goodsList[god.index].cosImage.split(',')[0] }"
						width="80" height="80">
					</td>
					<td>${goodsList[god.index].cosName }</td>
					<td>₩<fmt:formatNumber value="${goodsList[god.index].cosPrice }" pattern="#,###"/></td>
					<td><input type=hidden name="sell_price" value="${goodsList[god.index].cosPrice }"><td>
					<form name="form" method="post" action="./BasketList.ba">
					<input type="hidden" name="bkNum" class="bkNum" value="${i.basketNum}"/>
					<td>
						<ul class="nav flex-column " style="width: 100px; margin-left: 0; margin-right:20px;">
						  <li class="nav-item mb-2">
							<input type="number" name="amount" min="1" style="width:45px" value="${i.basketCosAmount}">	
						  </li>
						  <li class="nav-item mb-2">
 						  <input type="submit" value="수정" class="btn btn-primary btn-sm"
						  	onclick="javascript: form.action='BasketModify.ba'"/> 
						  </li>
						</ul>
					</td>
					</form>
				</tr>
				
				</c:forEach>
				</tbody>
				
				<%
				int count = 0;
				int hap = 0;
				int mul = 0;
				for(int i=0; i<basketList.size();i++){
					BasketDTO bkDTO = (BasketDTO) basketList.get(i);
					GoodsDTO gDTO = (GoodsDTO) goodsList.get(i);
					mul = gDTO.getCosPrice() * bkDTO.getBasketCosAmount();
					count += bkDTO.getBasketCosAmount();
					hap += mul;
				} %>
				
				<tr class="table-active">
					<th scope="col" colspan="3" style="color:black;">합계</th>
					<td style="color:black;">
					<strong>₩<fmt:formatNumber value="<%=hap %>" pattern="#,###"/>
					</strong></td>
					<td colspan="3" style="color:black;"><strong><%=count %></strong></td>
				</tr>
			</table>
				<div align="right">
					<button class="btn btn-secondary" onclick="javascript: form.action='OrderStart.or'"
					style="margin-bottom: -45px;">주문하기</button>
					<button class="btn btn-secondary" onclick="javascript: form.action='GoodsList.cos'"
					style="margin-bottom: -45px;"
					>계속 쇼핑하기</button>
				</div>
        	</form>
        </div>
        </c:otherwise>
       </c:choose>
    </section>
    
    <!-- goods basket list End -->
			
		</div>
		<div class="col-0">	
		<!-- right -->
		</div>
	</div>
	</div>
	<!-- container 끝 -->	

    
    <!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 170px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->

	
<!-- Footer Section Begin -->
<jsp:include page="/footer/footer.jsp"/>
<!-- Footer Section End -->

</body>
</html>