<%@page import="com.usedate.db.UsestatusDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.usedate.db.UsedateDAO"%>
<%@page import="com.order.db.OrderDTO"%>
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
<link rel="stylesheet" href="./goods_board/style/review_user_list.css">




<style type="text/css">
* {
	margin: 0;
}

#cb {
	zoom: 1.5;
}

.progress-bar {
	width: 500px;
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
		

		List useList = (List) request.getAttribute("useList");
		List openList = (List) request.getAttribute("openList");

		List goodsList= (List)request.getAttribute("goodsList");
		List orderList = (List)request.getAttribute("orderList");
		List usestatusList = (List)request.getAttribute("usestatusList");
	
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
							
						<table class="table">
							<tr>
								<th colspan="2" style="text-align: center;">내가 구매한 상품</th>
								<th>개봉하기</th>
							</tr>
							
							<c:set var="oNum" value="0"/>
							<c:if test="${orderList != null }">
							<c:forEach var="odto" items="${orderList}" varStatus="st">
								<c:set var="oNum" value="${odto.o_Num}"/>
								<tr style="font-size: 20px;">
									
									<td rowspan="2"><img src="./admingoods/upload/${goodsList[st.index].cosImage.split(",")[0]}" width="150px"
										height="150px">
									<td rowspan="2"><b>${goodsList[st.index].cosName}</b><br> <br>
										개봉 후 사용 기한 : <b>${goodsList[st.index].useDate}</b> 개월 <br>
										주문일자 ${odto.orderDate}<br>
										<c:choose>
											<c:when test="${usestatusList[st.index].open_status == 1}">
												수량 : ${usestatusList[st.index].remain_amount } 개
											</c:when>
											<c:otherwise>
												수량 : ${odto.o_cosAmount} 개
											</c:otherwise>
											
										</c:choose>
										
									</td>
									<c:choose>
										<c:when test="${usestatusList[st.index].first_open == 1 && usestatusList[st.index].remain_amount <= 0}">
									<tr><td>
									<input type="button" value="OPEN 완료" class="btn btn-secondary" id="open" onclick="alert('모두 사용했습니다.')">
									</td></tr>
										</c:when>
									<c:otherwise>
									<tr>
										<td><input type="button" value="OPEN" class="btn btn-info" 
										onclick="location.href='opencosAction.ud?cosNum=${odto.o_cosNum}&openstatus=${usestatusList[st.index].open_status}&cosAmount=${odto.o_cosAmount}&firstopen=${usestatusList[st.index].first_open}&statusnum=${usestatusList[st.index].status_Num}&oNum=${oNum}'">
									</td>
									</tr>
								</tr>
								</c:otherwise>
							</c:choose>
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
								
									
										<c:if test="${startPage > pageBlock}">
												<li class="page-item"><a class="page-link"
											href="./Usedate.ud?pageNum=${startPage-pageBlock}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
									
										<c:forEach begin="${startPage }" end="${endPage}" var="i">
											<li class="page-item"><a class="page-link"
																		href="./Usedate.ud?pageNum=${i}" class="btn btn-primary btn">${i}</a></li>
										</c:forEach>
									
										<c:if test="${endPage > pageCount }">
											<c:set var="endPage" value="${endPage = pageCount}"/> 
										</c:if>
										
										<c:if test="${endPage < pageCount}">
											<li class="page-item"><a class="page-link"
										href="./Usedate.ud?pageNum=${startPage+pageBlock}" ara-label="Next"> 
										<span aria-hidden="true">&raquo;</span></a></li>
										</c:if>
								</c:if>
								
							</ul>
						</div>
						<!-- 페이징 처리 -->
						
								<br><br>
						<h3>화장품 사용기한 확인하기</h3><br>
						<h5>*사용 완료 하신 경우 오른쪽의 사용완료 버튼을 눌러주세요!</h5>
						<br>
						<table class="table">
							<tr>
								<th>상품명</th>
								<th>개봉일자</th>
								<th>사용기한</th>
								<th>종료일자</th>
								<th>사용완료 여부</th>
							</tr>
							<%
							if( useList.size()!=0){
							
								for (int i = 0; i < useList.size(); i++) {
									GoodsDTO gdto = (GoodsDTO) useList.get(i);
									UsedateDTO udto = (UsedateDTO) openList.get(i);

									/* 끝 날자 구하기 */
									Date opendate = udto.getOpenDate();
									int usedate = gdto.getUseDate();

									Calendar cal = Calendar.getInstance();
									cal.setTime(opendate);
									DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
									System.out.println("current: " + df.format(cal.getTime()));
									cal.add(Calendar.MONTH, usedate);
									String closedate = df.format(cal.getTime());

									System.out.println(closedate);

									/* 끝 날짜 -  오늘 날짜  = 남은 일수 구하기 */
									Calendar getToday = Calendar.getInstance();
									getToday.setTime(new Date()); //금일 날짜

									Date date = new SimpleDateFormat("yyyy-MM-dd").parse(closedate);
									Calendar closedate1 = Calendar.getInstance();
									closedate1.setTime(date); //특정 일자

									long diffSec = (closedate1.getTimeInMillis() - getToday.getTimeInMillis()) / 1000;
									long diffDays = diffSec > 0 ? (diffSec / (24 * 60 * 60)) + 1 : (diffSec / (24 * 60 * 60)); //일자수 차이

									System.out.println("남은 일수(초) -" + diffSec);
									System.out.println("남은 일수" + diffDays);
									
									/*사용일수 구하기*/
									Calendar opendate2 = Calendar.getInstance();
									opendate2.setTime(opendate); //
									
									long useSec = (getToday.getTimeInMillis()-opendate2.getTimeInMillis()) / 1000;
									long useDays = useSec > 0 ? (useSec / (24 * 60 * 60)) + 1 : (useSec / (24 * 60 * 60)); //일자수 차이

									System.out.println("사용 초 - " + useSec);
									System.out.println("사용일수 -"+ useDays);
									
									
									/*% 구하기*/
						

									//계산위해 int로 변경
									double useday = (double)useDays;
									double year = ((double)usedate*30.41);									
									
							%>
							<tr>
								<td><%=gdto.getCosName()%></td>
								<td><%=opendate%></td>
								<td>
									<div class="skill-progress">
										<div class="item">

											<div class="progress">
												<div class="progress-level" style="width: <%=(useday/year)*100%>%" aria-valuenow="<%=useday %>"
											aria-valuemin="0" aria-valuemax="<%=year%>"></div>
											</div>
											<p>
												<span><%=diffDays%>일 남았습니다.</span> <span><%=useDays %>일 사용</span>
											</p>
										</div>
									</div>
									
								</td>
								<td><%=closedate%></td>
								<td>
								<input type="button" class="btn" style="background-color: #B0BCC2; color: white;" value="사용완료" 
								onclick="location.href='./completeUseAction.ud?openNum=<%=udto.getOpenNum()%>'"></td>
							</tr>
							
							<%}
								}%>
							</form>
						</table>
						 

					</div>
				</div>
			</div>
			<div class="col-2"></div>
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