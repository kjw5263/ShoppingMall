<%@page import="com.notice.db.noticeDTO"%>
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
	<div class="row" style="margin-bottom: -5%;">
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
			<!--여백  -->
			<div class="col-8">
				<%
					// 페이지 이동시 전달정보가 있으면(파라미터) 항상 가장먼저 저장
					// num,pageNum
					String userId = (String) session.getAttribute("userId");

					String pageNum = request.getParameter("pageNum");
					String num = request.getParameter("noticeNum");
					// BoardDAO 객체 생성

					noticeDTO notit = (noticeDTO) request.getAttribute("noti");
					// DB에서 글번호(num)에 해당하 글정보를 모두 가져와서 출력

					if (userId == null) {
						userId = "null";
					}

					String type;
					if (notit.getNoticeType() == 1) {
						type = "공지";
					} else {
						type = "이벤트";
					}

					/* if(notit.getNoticeFile().equals("null") || notit.getNoticeFile() == null ){
						notit.setNoticeFile("파일없음");
						notit.setNoticeRealFileName("파일없음");
					} */
				%>
				<br>

				<div>
				
						<table class="table table-striped">
							<tr class="table-active">
								<td style="width: 30%"><%=type%></td>
								<td style="width: 70%"><%=notit.getNoticeTitle()%></td>
							</tr>


							<br>

							<tr>
								<td><b>첨부파일 </b></td>
								<td>
									<%
										System.out.println("ssss " + notit.getNoticeFile());
										if (notit.getNoticeFile() == null) {
									%> 첨부파일 없음 <%
										} else {
									%><a
									href="./notice/filedown.jsp?filename=<%=notit.getNoticeFile()%>"><%=notit.getNoticeRealFileName()%></a>
									<%
										}
									%>

								</td>
							</tr>

							<tr>
								<td height="300px" colspan="2"
									style="position: static; top: 3px; left: 5px; text-align: inherit;">
									<%=notit.getNoticeContent()%><br> <%
 	if (notit.getNoticeImg() == null) {
 %> <%
 	} else {
 %><img width="500px" height="500px"
									src="./upload/<%=notit.getNoticeImg()%>"> <%
										}
									%>
								</td>

							</tr>
						</table>
						
					<div style="text-align: right;">
					<%
						if (userId.equals("admin")) {
					%>
					<button class="btn btn-danger" onclick="location.href='./noticedel.nos?noticeNum=<%=num%>&pageNum=<%=pageNum%>'">글삭제</button>
					<button class="btn btn-warning" onclick="location.href='./noticeup.nos?noticeNum=<%=num%>&pageNum=<%=pageNum%>'">글수정</button>
					<%
						}
					%>
					<button class="btn btn-info" onclick="location.href='./notice.nos'">목록으로</button>
					</div>
				</div>

			</div>
			<div class="col-2"></div>
			<!--여백  -->

		</div>

	</div>
	<!-- container 끝 -->

	<!-- Page End Section Begin -->
	<section class="page-add">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-9">
			<div class="page-breadcrumb"></div>
		</div>
	</div>
	</section>
	<!-- Page End Section End -->



	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->

</body>
</html>