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



<style type="text/css">
*{margin: 0;}

#cb {
	zoom: 1.5;
}

.progress-bar {
	width: 500px;
}
</style>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>
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
	
	
		int cnt = (int)request.getAttribute("cnt");
		int pageSize = (int)request.getAttribute("pageSize");
		int startRow = (int)request.getAttribute("startRow");
		String pageNum1 = (String)request.getAttribute("pageNum");
	 	int pageNum = Integer.parseInt(pageNum1);
		int currentPage = (int)request.getAttribute("currentPage");
		
	
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
					<div class="col-10">

						<table class="table">
							<tr>
								<th colspan="2" style="text-align: center;">내가 구매한 상품</th>
								<th>개봉하기</th>
							</tr>

							<%
							int oNum;
							if(orderList.size() != 0){
								for (int i = 0; i < orderList.size(); i++) {
									OrderDTO odto = (OrderDTO)orderList.get(i);
									GoodsDTO gdto2 = (GoodsDTO) goodsList.get(i);
									UsestatusDTO ustdo = (UsestatusDTO)usestatusList.get(i);
								oNum = odto.getO_Num();
								
							%>
							<tr style="font-size: 20px;">
									
									<td rowspan="2"><img src="./admingoods/upload/<%=gdto2.getCosImage().split(",")[0] %>" width="150px"
										height="150px">
									<td rowspan="2"><b><%=gdto2.getCosName()%></b><br> <br>
										개봉 후 사용 기한 : <b><%=gdto2.getUseDate() %></b> 개월 <br>
										주문일자 <%=odto.getOrderDate() %><br>
										<%if(ustdo.getOpen_status() == 1){ %>
										수량 : <%=ustdo.getRemain_amount()%> 개
										<%} else{ %>
										수량 : <%=odto.getO_cosAmount()%> 개
										<%} %>
									</td>
									<%if(ustdo.getFirst_open() == 1 && ustdo.getRemain_amount() <= 0){%>
									<tr>
									<td>
									<input type="button" value="OPEN 완료" class="btn btn-secondary" id="open" onclick="alert('모두 사용했습니다.')">
									</td>
									</tr>
									<%}else{%>
									<tr>
										<td><input type="button" value="OPEN" class="btn btn-info" 
										onclick="location.href='opencos.ud?cosNum=<%=odto.getO_cosNum() %>&openstatus=<%=ustdo.getOpen_status()%>&openstatus=<%=ustdo.getOpen_status()%>&cosAmount=<%=odto.getO_cosAmount() %>&firstopen=<%=ustdo.getFirst_open()%>&statusnum=<%=ustdo.getStatus_Num() %>&oNum=<%=oNum%>'">
									</td>
									</tr>
							</tr>
							<%
									}
								}
							}
							
							%>

						</table>

						<!--페이징 처리  -->
						<div style="margin-left: 45%;">
						<ul class="pagination">
						
						<%if(cnt != 0){
							
							int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1);
							
							int pageBlock = 1;
							
							int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
							
							int endPage = startPage + pageBlock-1;
							
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){
								%>
								<li class="page-item"><a  class="page-link" href="./Usedate.ud?pageNum=<%=startPage-pageBlock %>" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								</a></li>
								 <%
							}
							
							for(int i=startPage;i<=endPage;i++){
								%>
								<li class="page-item"><a  class="page-link" href="./Usedate.ud?pageNum=<%=i %>" class="btn btn-primary btn"><%=i %></a></li>
								<%
							}
							
							if(endPage < pageCount){
								%>
								<li class="page-item"><a class="page-link" href="./Usedate.ud?pageNum=<%=startPage+pageBlock %>" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								<%
							}
							
						} %>
						</a></li>
						</ul>
						</div>
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
								onclick="location.href='./completeUse.ud?openNum=<%=udto.getOpenNum()%>'"></td>
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