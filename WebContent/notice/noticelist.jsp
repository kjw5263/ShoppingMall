<%@page import="com.notice.db.noticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.var.list.varlist"%>
<%@page import="com.notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login V10</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="./img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./css/util.css">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<!--===============================================================================================-->



<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>JUST SKIN</title>

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



<!-- jquery 준비 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- jquery 준비 끝 -->



</head>
<body>

	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	<!-- Page Add Section Begin -->
	<section class="page-add">
	<div class="row" style="margin-bottom: -2%;">
		<div class="col-lg-2"></div>
		<div class="col-lg-10">
			<div class="page-breadcrumb">
				<h2>
					NOTICE<span>.</span>
				</h2>
			</div>
		</div>
	</div>
	</section>
	<!-- Page Add Section End -->
	
	

	<!-- container 시작 -->
	<div class="container-fluid">

		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<%
					request.setCharacterEncoding("UTF-8");

					NoticeDAO noti = new NoticeDAO();
					String userId = (String) session.getAttribute("userId");
					varlist var = new varlist();
					String noticecontentLink = var.getnoticecontentListSt();
					int topcnt = noti.topnoticount();
					int cnt = noti.notiCount();
					int toppageSize = topcnt;
					int pageSize = 10 - toppageSize;
					if (userId == null) {
						userId = "null";
					}
					String pageNum = request.getParameter("pageNum");
					if (pageNum == null) {
						pageNum = "1";
					}
					int currentPage = Integer.parseInt(pageNum);
					int startRow = (currentPage - 1) * (pageSize);
					int endRow = (currentPage) * (pageSize);

					int a = (Integer.parseInt(pageNum) - 1) * pageSize;

					int b = pageSize;
					System.out.println("직전위치");
					List topnoticeList = noti.getTopNoticeList();
					List noticeList = noti.getNoticeList(a, b);
				%>
				
				<div>
						<table class="table table-striped">
							<tr class="table-active">
								<th style="width: 30%"></th>
								<th style="width: 70%">제목</th>
							</tr>
							<%
								for (int i = 0; i < topnoticeList.size(); i++) {

									noticeDTO notid = (noticeDTO) topnoticeList.get(i);
							%>
							<tr>
								<td>공지</td>
								<td><a
									href="<%=noticecontentLink%><%=notid.getNoticeNum()%>&pageNum=<%=pageNum%>">
										<%=notid.getNoticeTitle()%></a></td>
								<%
									
								%>
							</tr>
							<%
								}
								for (int i = 0; i < noticeList.size(); i++) {

									noticeDTO notid = (noticeDTO) noticeList.get(i);
							%>
							<tr>
								<td>이벤트</td>
								<td><a
									href="<%=noticecontentLink%><%=notid.getNoticeNum()%>&pageNum=<%=pageNum%>">
										<%=notid.getNoticeTitle()%></a></td>

								<%
									
								%>
							</tr>
							<%
								}
							%>
						</table>
				</div>
				<hr>
				
				<div class="row"  style="margin-left: 50%;">
				<div class="col-10">
				<ul class="pagination" style="text-align: center;">
								    	<%
								if(cnt != 0 ){
									
									int pageCount = cnt / pageSize + (cnt  % pageSize == 0? 0:1);
									
									int pageBlock = 2;
									
									int startPage = ((currentPage-1)/pageBlock) * pageBlock +1;
									
									int endPage = startPage + pageBlock-1;
									
									if(endPage > pageCount){
										endPage = pageCount;
									}
								
									if(startPage > pageBlock){
										%>
										<li class="page-item"><a class="page-link" href="./notice.nos?pageNum=<%=startPage-pageBlock%>">Previous</a></li>
										<%
									}
									
									//숫자 1....5
									for(int i=startPage;i<=endPage;i++){
										%>
										<li class="page-item"><a class="page-link" href="./notice.nos?pageNum=<%=i%>"><%=i %></a></li>
										<%
									}
									
									//다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
									if(endPage < pageCount){
										%>
										<li class="page-item"><a class="page-link" href="./notice.nos?pageNum=<%=startPage+pageBlock%>">Next</a></li>
										<%
									}
								}
								%>
						    
						  </ul>
				</div>
				<div class="col-2">
				<%if (userId.equals("admin")) {%>
				<button class="btn btn-info"
					onclick="location.href='./noticewrite.nos'">글쓰기</button>
				<%}%>
				</div>
			</div>
			</div>
			<div class="col-2"></div><!-- 여백 -->
		</div>

	</div>
	<!-- container 끝 -->
	
	<!-- Page End Section Begin -->
	<section class="page-add">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-9">
			<div class="page-breadcrumb">
			</div>
		</div>
	</div>
	</section>
	<!-- Page End Section End -->




	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->

</body>
</html>