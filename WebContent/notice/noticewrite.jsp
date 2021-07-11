<%@page import="com.notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>NOTICE | JUST SKIN</title>
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
<title> NOTICE | JUST SKIN </title>

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
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>ADMIN PAGE<span>.</span></h2>
                        <h3>공지사항 글 쓰기</h3>
						<p style="border: 1px solid #B0BCC2;"></p>
                        
                    </div>
                </div>
                <div class="col-lg-8">
               </div>
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
					String userId = (String) session.getAttribute("userId");
					// 전달정보 저장 - 액션태그 (자바빈)- num,pass
					NoticeDAO noti = new NoticeDAO();
					int check1 = noti.deleteCheckNotice(userId);

					System.out.println("userId = " + userId);

					if (check1 == 1) {

					} else {
				%>
				<script type="text/javascript">
					alert("글쓰기 권한이 없습니다");
					history.back();
				</script>
				<%
					}
				%>


			<form action="noticewritepro.nos" method="post" enctype="multipart/form-data">
				<table class="table table-striped">
						<tr>						
						<td>제목</td>
						<td colspan="2"><input type="text" name="title" class="form-control"></td> 
						</tr>
						<tr>
							<td>중요도</td>
							<td><input type="checkbox" value="1" id="imp1" name="imp2" onclick="pop()" style="transform : scale(1.5);">&nbsp;&nbsp;
							<input type="checkbox" value="0" id="imp2" name="imp2" checked="checked" class="hidden" style="transform : scale(1.5);"></td>
							<td></td>		
						</tr>
						<tr>
							<td>파일</td>
							<td colspan="2"><input type="file" name="filename"></td>
						</tr>
						<tr>
							<td>파일</td>
							<td colspan="2"><input type="file" name="imgname"></td>
						</tr>
						<tr>
							<td>내용 </td>
							<td colspan="2"><textarea rows="10" cols="30" name="content" class="form-control"></textarea></td>
						</tr>
						<tr>
						<td colspan="3" style="text-align: right;"><input type="submit" class="btn btn-info" value="글쓰기"></td>
						</tr>
				</table>
			</form>
			</div>
<div class="col-2"></div><!--여백  -->
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

	<script type="text/javascript">
						function pop() {
							if (document.getElementById("imp2").checked == true) {
								document.getElementById("imp2").checked = false;
							} else {
								document.getElementById("imp2").checked = true;
							}
						}
		</script>
</html>