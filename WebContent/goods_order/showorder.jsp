<%@page import="java.util.ArrayList"%>
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
<title>주문 조회 | JUST SKIN</title>
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
<script src="./js/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function datecheck(){
	
	
	var today = new Date();
	var startyear = $('#startyear').val(); 
	var endyear = $('#endyear').val();
	var startmonth = $('#startmonth').val();
	var endmonth = $('#endmonth').val();
	var startday = $('#startday').val();
	var endday = $('#endday').val();
	
	
	var startdate1 = new Date();
	startdate1.setFullYear(startyear,startmonth-1,startday);

	var enddate1 = new Date();
	enddate1.setFullYear(endyear,endmonth-1,endday);
	

	var startdate = startyear +"-"+ startmonth +"-"+ startday;
	var enddate = endyear + "-" + endmonth +"-"+ endday
	
	$('#startdate').val(startdate);
	$('#enddate').val(enddate);
	
	if(startdate1 > enddate1){
		alert('검색 종료일을 검색 시작일 보다 늦은 날짜로 지정해주세요.');
		return false;
	}else if(endyear - startyear > 2){
		alert('최대 검색 가능 기간은 1년 입니다.');
		return false;
	}else if(startdate1 > today || enddate1 > today){
		alert('오늘 이전의 날짜만 검색이 가능합니다.');
		return false;
	}
	
}


</script>

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
                        <h4>주문 조회</h4>
                        <a href="./Main.me">Home</a>
                        <a href="./MemberInfo.me">MY PAGE</a>
                        <a class="active" href="./getOrderList.or">주문 조회</a>
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
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<메뉴 바>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->
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
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<메뉴 바>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->



<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<배송 상태>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->
						<h4>주문 배송 조회</h4>
						<br>
						<c:set var="odc1" value="0"/>
						<c:set var="odc2" value="0"/>
						<c:set var="odc3" value="0"/>
						<c:set var="odc4" value="0"/>
						<c:set var="odc5" value="0"/>
						<c:set var="odc6" value="0"/>
						<c:set var="odc7" value="0"/>
							
						
						<c:forEach var="odto" items="${orderList}" begin="0" end="${fn:length(orderList)}">
							<c:choose>
								<c:when test="${odto.orderStatus == '결제완료' }">
									<c:set var="odc1" value="${odc1 +1 }"/>
								</c:when>
								<c:when test="${odto.orderStatus == '상품준비' }">
									<c:set var="odc2" value="${odc2 +1 }"/>
								</c:when>
								<c:when test="${odto.orderStatus == '상품준비완료' }">
									<c:set var="odc3" value="${odc3 +1 }"/>
								</c:when>
								<c:when test="${odto.orderStatus == '배송준비' }">
									<c:set var="odc4" value="${odc4 +1 }"/>
								</c:when>
								<c:when test="${odto.orderStatus == '배송중' }">
									<c:set var="odc5" value="${odc5 +1 }"/>
								</c:when>
								<c:when test="${odto.orderStatus == '배송완료' }">
									<c:set var="odc6" value="${odc6 +1 }"/>
								</c:when>
								<c:when test="${odto.orderStatus == '주문취소' }">
									<c:set var="odc7" value="${odc7 +1 }"/>
								</c:when>
							</c:choose>
						</c:forEach>
						
						<ul class="mypage-step" style="height: 130px;">
							<li>
								<div>
									<div class="contents1">결제완료</div>
									<div class="contents2"><b id="odcor1">${odc1}</b></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">상품준비</div>
									<div class="contents2"><b id="odcor2">${odc2}</b></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">준비완료</div>
									<div class="contents2"><b id="odcor3">${odc3}</b></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">배송준비</div>
									<div class="contents2"><b id="odcor4">${odc4}</b></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">배송중</div>
									<div class="contents2"><b id="odcor5">${odc5}</b></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">배송완료</div>
									<div class="contents2"><b id="odcor6">${odc6}</b></div>
								</div>
							</li>
							<li>
								<div>
									<div class="contents1">주문취소</div>
									<div class="contents2"><b id="odcor7">${odc7}</b></div>
								</div>
							</li>
						</ul>
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<배송 상태>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->

<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<주문 조회>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->
						
						
						<fieldset id="checkline" style="margin-top: 5%;">
							<br>
							<form action="OrdercheckAction.or" method="post"
								onsubmit="return datecheck()">
								<input type="hidden" name="searchmonth" value="0">
								<input type="hidden" id="startdate" name="startdate"> <input
									type="hidden" id="enddate" name="enddate"> <input
									type="button" value="1개월" class="btn btn-outline-info"
									onclick="location.href='OrdercheckAction.or?searchmonth=1';">
								<input type="button" value="3개월" class="btn btn-outline-info"
									onclick="location.href='OrdercheckAction.or?searchmonth=3';">
								<input type="button" value="6개월" class="btn btn-outline-info"
									onclick="location.href='OrdercheckAction.or?searchmonth=6';">

								<br>
								<br> <select name="startyear" id="startyear"
									class="custom-select" style="width: 100px;">
									<option name="2021">2021</option>
									<option name="2020">2020</option>
									<option name="2019">2019</option>
									<option name="2018">2018</option>
									<option name="2017">2017</option>
								</select>년&nbsp;&nbsp; <select name="startmonth" id="startmonth"
									class="custom-select" style="width: 100px;">
									<%for(int i=1;i<13;i++) {%>
									<option name="<%=i%>"><%=i %></option>
									<%} %>
								</select>월&nbsp;&nbsp; <select name="startday" id="startday"
									class="custom-select" style="width: 100px;">
									<%for(int i=1;i<32;i++) {%>
									<option name="<%=i%>"><%=i %></option>
									<%} %>
								</select>일 <b class="wave">~</b> <select name="endyear" id="endyear"
									class="custom-select" style="width: 100px;">
									<option name="2021">2021</option>
									<option name="2020">2020</option>
									<option name="2019">2019</option>
									<option name="2018">2018</option>
									<option name="2017">2017</option>
								</select>년&nbsp;&nbsp; <select name="endmonth" id="endmonth"
									class="custom-select" style="width: 100px;">
									<%for(int i=1;i<13;i++) {%>
									<option name="<%=i%>"><%=i %></option>
									<%} %>
								</select>월&nbsp;&nbsp; <select name="endday" id="endday"
									class="custom-select" style="width: 100px;">
									<%for(int i=1;i<32;i++) {%>
									<option name="<%=i%>"><%=i %></option>
									<%} %>
								</select>일&nbsp;&nbsp; <input type="submit" value="조회하기"
									class="btn btn-info">

							</form>
							<br>
							<br>
						</fieldset>
						*1년 이내의 주문 내역만 조회 가능합니다.
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<주문 조회>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->

<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<주문 조회 테이블1>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->
<!-- orderckList2 1,3,6개월 조회 , orderckList1 특정기간 조회-->
						<table class="table table-bordered" style="text-align: center;">
							<thead style="text-align: center;" class="order-thead">
								<tr>
									<th>주문일자</th>
									<th>상품</th>
									<th>수량</th>
									<th>주문금액</th>
									<th>상태</th>
								</tr>
							</thead>
						<c:choose>
							<c:when test="${orderckList2 != null }">
							<tbody>
								<c:forEach var="odck2" items="${orderckList2}" varStatus="st">
								<c:set var="gdck2" value="${goodsckList2 }"/>
								<tr>
									<td><fmt:formatDate value="${odck2.orderDate}"/><br> <a
										href="Orderdetail.or?tradeNum=${odck2.o_tradeNum}"
										id="detail">상세보기</a></td></td>
									<td>
										<ul class="goods-view">
											<li style="width: 100px; height: 100px;"><img
												src="./admingoods/upload/${gdck2[st.index].cosImage.split(',')[0]}"
												width="100px" height="100px;"></li>
											<li><b id="brand">${gdck2[st.index].cosBrand}</b><br>${odck2.o_cosName}
											<br><button class="btn btn-info" onclick="location.href='./GoodsDetail.cos?cosNum=${odck2.o_cosNum}'" 
											style="width: 70px; height: 30px; font-size: 11px; margin-top: 1%;">REVIEW</button>
											</li>
										</ul>
									</td>
									<td>${odck2.o_cosAmount }</td>
									<td><b id="price">₩<fmt:formatNumber value="${odck2.sumMoney }" pattern="#,###"/></h3><b></td>
									<td>${odck2.orderStatus}</td>
								</tr>
								</c:forEach>
							</tbody>
							</c:when>
							<c:when test="${orderckList1 != null }">
									<tbody>
										<c:forEach var="odck1" items="${orderckList1}" varStatus="st">
													<c:set var="gdck1" value="${goodsckList1 }"/>
												<tr>
													<td><fmt:formatDate value="${odck1.orderDate}"/><br> <a
														href="Orderdetail.or?tradeNum=${odck1.o_tradeNum}"
														id="detail">상세보기</a></td></td>
													<td>
														<ul class="goods-view">
															<li><img
																src="./admingoods/upload/${gdck1[st.index].cosImage.split(',')[0]}"
																width="100px" height="100px;"></li>
															<li><b id="brand">${gdck1[st.index].cosBrand}</b><br>${odck1.o_cosName}</li>
														</ul>
													</td>
													<td>${odck1.o_cosAmount }</td>
													<td><b id="price">₩<fmt:formatNumber value="${odck1.sumMoney }" pattern="#,###"/></h3><b></td>
													<td>${odck1.orderStatus}</td>
												</tr>
												
										</c:forEach>
									</tbody>
								</c:when>
								<c:when test="${fn:length(orderckList1) == 0 && fn:length(orderckList2) == 0}">
										<tbody>
											<tr id="nopnt">
												<td colspan="5">
													<div id="nopnt-text" >
													<div style="background-image: url('./img/icons/exclamation.png');"></div>
													<h4>기간 내 주문한 내역이 없습니다.</h4>
													</div>
												</td>
											</tr>
										</tbody>
								</c:when>
						</c:choose>
						</table>
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<주문 조회 테이블1>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->

						<br> <br> <br>
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