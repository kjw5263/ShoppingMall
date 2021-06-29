<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.usedate.db.UsedateDTO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.like.db.LikeDTO"%>
<%@page import="com.like.db.LikeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="./css/progress.css" type="text/css">



<style type="text/css">
#cb {
	zoom: 1.5;
}

.progress-bar {
	width: 500px;
}
</style>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check() {
		if (!(confirm('오픈하시겠습니까?'))) {
			return false;
		}
	}
</script>
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
		List goodsList = (List) request.getAttribute("goodsList");
		List openList = (List) request.getAttribute("openList");
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
					<h4>내 화장품 사용기한 확인 / 등록하기</h4>
				</div>
			</div>


		</div>
	</section>
	<!-- Page Add Section End -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
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

						<table class="table">
							<tr>
								<th colspan="2" style="text-align: center;">내가 구매한 상품</th>
								<th>개봉하기</th>
							</tr>

							<%
								for (int i = 0; i < goodsList.size(); i++) {
									GoodsDTO gdto = (GoodsDTO) goodsList.get(i);
							%>
							<tr style="font-size: 20px;">
								<form action="opencos.ud" method="post"
									onsubmit="return check();">
									<input type="hidden" value="<%=userId%>" id="userId">
									<td><img src="<%=gdto.getCosImage()%>" width="150px"
										height="150px">
									<td><b><%=gdto.getCosBrand()%></b><br> <%=gdto.getCosName()%><br>
										개봉 후 사용 기한 : <b><%=gdto.getUseDate()%></b> 개월 <input
										type="hidden" value="<%=gdto.getUseDate()%>" name="usedate">
									</td>
									<td><input type="submit" value="OPEN" class="btn btn-info">
									</td>
								</form>
							</tr>
							<%
								}
							%>

						</table>



						<br>
						<h3>화장품 사용기한</h3>
						<br>
						<table class="table">
							<tr>
								<th>상품명</th>
								<th>개봉일자</th>
								<th>사용기한</th>
								<th>종료일자</th>
							</tr>
							<%
								for (int i = 0; i < goodsList.size(); i++) {
									GoodsDTO gdto = (GoodsDTO) goodsList.get(i);
									UsedateDTO udto = (UsedateDTO) openList.get(i);

									Date opendate = udto.getOpenDate();
									int usedate = gdto.getUseDate();

									Calendar cal = Calendar.getInstance();
									cal.setTime(opendate);
									DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
									System.out.println("current: " + df.format(cal.getTime()));
									cal.add(Calendar.MONTH, usedate);
									String closedate = df.format(cal.getTime());

									
									System.out.println(closedate);
									
									/* 유통기한? -  오늘 날짜 */
									Calendar getToday = Calendar.getInstance();
									getToday.setTime(new Date()); //금일 날짜
									
									Date date = new SimpleDateFormat("yyyy-MM-dd").parse(closedate);
									Calendar duedate = Calendar.getInstance();
									duedate.setTime(date); //특정 일자
									
									long diffSec = (duedate.getTimeInMillis()-getToday.getTimeInMillis()) / 1000;
									long diffDays = diffSec > 0? (diffSec / (24*60*60))+1 : (diffSec / (24*60*60))  ; //일자수 차이
									
									System.out.println(diffSec + "초 차이");
								 	System.out.println(diffDays + "일 차이");
									
								 	
									/*% 구하기*/
									Calendar getm = Calendar.getInstance();
									//Date 월로 변경
									Date usedate2 = new SimpleDateFormat("M").parse(Integer.toString(usedate));
									getm.setTime(usedate2);
									
									//usedate-duedate 
									getm.add(Calendar.DAY_OF_MONTH,-(int)diffDays);

									//일수로 변경
									DateFormat df2 = new SimpleDateFormat("dd");
									String day = df2.format(getm.getTime());
									
									//계산위해 int로 변경
								 	double day2 = Integer.parseInt(day); //usedate - duedate
								 	System.out.println(day2);
								 	double day3 = (day2/365)*100;
								 	System.out.println(day3);		
								 
								 	
								 
							%>
							<tr>
								<td><%=gdto.getCosName()%></td>
								<td><%=opendate%></td>
								<td>
									<div class="skill-progress">
										<div class="item">

											<div class="progress">
												<div class="progress-level" style="width: 20%"></div>
											</div>
											<p>
												<span><%=diffDays %>일 남았습니다.</span> <span>90%센트 썻네용</span>
											</p>
										</div>
									</div>
								</td>
								<td><%=closedate%></td>
							</tr>
							<%
								}
							%>
						</table>



					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>



	</div>
	<!-- Page Add Section Begin -->
	<section class="page-add"></section>
	<!-- Page Add Section End -->

	<!-- container 끝 -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->




</body>
</html>