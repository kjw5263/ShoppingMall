<%@page import="com.coupon.db.CouponDTO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		<% 
	String userId = (String)session.getAttribute("userId");
	MemberDTO mdto  = (MemberDTO)request.getAttribute("mdto");
	List LikeList = (List) request.getAttribute("LikeList");
	List couponList = (List)request.getAttribute("couponList");

		
	%>
	
	<div class="row">
		<div class="col-3"></div><!--여백 -->
		<div class="col-6">
			
			<div class="row">
				<div class="col-3">
					<a href=""><h5>장바구니</h5></a>
					<a href=""><h5>주문조회</h5></a>
					<a href="./getLike.li"><h5>찜목록</h5></a>
					<hr>
					<a href="./MyCoupon.me"><h5>내 쿠폰</h5></a>
					<a href=""><h5>포인트</h5></a>
					<hr>
					<a href=""><h5>내 화장품 사용기한 
					&nbsp;확인하기</h5></a>
					<a href="reviewList.rev"><h5>리뷰</h5></a>
					<hr>
					<a href="./MemberUpdateInfo.me"><h5>회원 정보 수정</h5></a>
					<a href="./MemberDelete.me"><h5>탈퇴하기</h5></a>
				</div>
				
				<div class="col-9">
					
						<fieldset style="border: 4px solid #B0BCC2; padding: 40px;" >

							<div class="row">
								<h3><%=mdto.getUserName()%>님의 정보
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
											<%if(mdto.getUserTotal() > 0 && mdto.getUserTotal()<= 99999 ){ %>
											<b>1</b> level <%} %> <%if(mdto.getUserTotal() >= 100000 && mdto.getUserTotal()<= 149999 ){ %>
											<b>2</b> level <%} %> <%if(mdto.getUserTotal() >= 150000 && mdto.getUserTotal()<= 199999 ){ %>
											<b>3</b> level <%} %> <%if(mdto.getUserTotal() >= 200000 ){ %>
											<b>4</b> level <%} %>
										</td>
										<%
											int cnt = 0;

											if (couponList.size() != 0) {
												for (int i = 0; i < couponList.size(); i++) {
													CouponDTO cdto = (CouponDTO) couponList.get(i);
													cnt += cdto.getMcAmount();
													System.out.println(cnt);
												}
											}
										%>
										<td><a href="./MyCoupon.me"><b><%=cnt %></b></a> 장</td>
										<td><a href="" style="color: orange;"><b><%=mdto.getUserPoint() %></b></a>P</td>
										<td><a href="" style="color: orange;"><b><%=mdto.getUserPoint() %></b></a>원</td>
									</tr>
								</table>
							</div>
						</fieldset>

						<h3 style="margin-bottom: 10px; margin-top: 100px;">주문조회</h3>
						<hr>
						<div class="row" style="text-align: center; font-size: 16px;">
							<div class="col-2">
								<b>주문접수</b><br>0
							</div>
							<div class="col-2">
								<b>결제완료</b><br>0
							</div>
							<div class="col-2">
								<b>상품준비중</b><br>0
							</div>
							<div class="col-2">
								<b>배송중</b><br>0
							</div>
							<div class="col-2">
								<b>배송완료</b><br>0
							</div>
							<div class="col-2" style="margin: auto;">
								<input type="button" class="primary-btn look-btn"
									style="background-color: #B0BCC2;" value="주문조회"
									onclick="location.href='./getorder.or'">
							</div>
						</div>
						<br> <br>
						<%if(LikeList.size() !=0){ %>
						<h3 style="margin-bottom: 10px;">
							찜 목록 (총 <b style="color: orange;"><%=LikeList.size()%></b>개)
						</h3>
						<h5 style="text-align: right;">
							<a href="./getLike.li">> 더보기 </a>
						</h5>
						<hr>
						<fieldset style="padding: 20px;"">
							<div class="row">
								<table style="text-align: center;">
									<tr>
										<%	
										
										int size = LikeList.size();
										int col = 4;
										int row = (size / col) + ((size%col)>0? 1 : 0);
										int num = 0;
										%>
									
									<tr>
										<%for(int i=0;i<4;i++){ 
												GoodsDTO gdto = (GoodsDTO)LikeList.get(num);
											%>
										<td><a
											href="./GoodsDetail.cos?cosNum=<%=gdto.getCosNum()%>"> <img
												src="<%=gdto.getCosImage()%>" width="120" height="120"></a>
											<br> <%=gdto.getCosBrand() %><br> <%=gdto.getCosName() %>
										</td>
										<%
										num++;
										if(size<=num) break;
											}%>
									</tr>
								</table>
							</div>
						</fieldset>
						<%}
						else{%>
						<h3 style="margin-bottom: 10px;">찜 목록 (총 0개)</h3>
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
						<%} %>


						<hr>
						<br> <br> <br>
						<h4 style="margin-bottom: 10px;">나의 피부타입</h4>
						<hr>
						<fieldset style="padding: 20px;">
							<div class="row" style="text-align: center; font-size: 20px;">
								<div class="col-3">
									<b>피부타입</b><br><%=mdto.getUserSkinType() %>
								</div>
								<div class="col-3">
									<b>피부고민</b><br><%=mdto.getUserTrouble() %>
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


			<div class="col-3"></div>
		</div>
		<!-- container 끝 -->

		<br> <br> <br> <br>
		<!-- footer 시작 -->
		<jsp:include page="../footer/footer.jsp" />
		<!-- footer 시작 -->
</body>
</html>