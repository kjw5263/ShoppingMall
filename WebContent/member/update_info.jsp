<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정 | JUST SKIN</title>
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
<link rel="stylesheet" href="./goods_board/style/review_user_list.css">
<link rel="stylesheet" href="./css/question/question.css" type="text/css">



<!-- JQuery -->
<script src="./js/jquery-3.6.0.js"></script>

	
</head>
<script type="text/javascript">
	function func1() {
		var con = document.getElementById("i1");
		con.style.display = (con.style.display != 'none') ? "none" : "block";
		var con = document.getElementById("i2");
		con.style.display = (con.style.display != 'none') ? "none" : "block";
	}

	function func2() {
		var con = document.getElementById("i3");
		con.style.display = (con.style.display != 'none') ? "none" : "block";
		var con = document.getElementById("i4");
		con.style.display = (con.style.display != 'none') ? "none" : "block";
	}

	function func3() {
		var con = document.getElementById("i5");
		con.style.display = (con.style.display != 'none') ? "none" : "block";
		var con = document.getElementById("i6");
		con.style.display = (con.style.display != 'none') ? "none" : "block";
	}

	
	
	$(document).ready(function(){
		
		var ck1=false;			//id
		var ck2=false;			//pw
		var ck3=false;			//pw1
		var ck4=false;			//name
		var ck5=false;			//phone
		var ck6=false;			//address2
		var ck7=false;			//address3	
	
	 
	$("#newpw2").keyup(function(){
		var userPass = $("#newpw2").val();
		var newpw2 = $("#newpw2").val();
		var newpw1 = $("#newpw1").val();
		 var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/.test(userPass);
		
		if(newpw1 != newpw2 ){
			 $('#pwck_msg2').text("새 비밀번호가 서로 일치하지 않습니다."); 
			 $('#pwck_msg2').css("color","red"); 
			 $('#pwck_msg2').css("padding-left","1rem");	
			 ck2 = false;
		}else if(newpw1 = newpw2 ){
			 $('#pwck_msg2').text("비밀번호가 일치합니다.");     
			$('#pwck_msg2').css("color","green");
			$('#pwck_msg2').css("padding-left","1rem");
			 ck2 = true;}
		
		if(check){
			 	$('#pwck_msg2').text("사용 가능한 비밀번호입니다");     
				$('#pwck_msg2').css("color","green");
				$('#pwck_msg2').css("padding-left","1rem");
				ck2 = true;
		 }else{
			 	$('#pwck_msg2').text("대소문자,숫자,특수문자(@$!%*#?&) 세가지를 조합한 8~16자리를 입력하세요");     
				$('#pwck_msg2').css("color","red"); 
			 	$('#pwck_msg2').css("padding-left","1rem");
			 	ck2 = false;
		 }
			 
		 
		 });
	
	});
	
	//유효성체크
	function check() {
		if (document.pw.userPass.value == "") {
			alert("현재 비밀번호를 입력해주세요.");
			document.pw.userPass.focus();
			return false;
		}
		if (document.pw.newpw1.value != document.pw.newpw2.value) {
			alert("변경할 비밀번호가 서로 일치 하지 않습니다.");
			document.pw.newpw1.focus();
			return false;
		}

		if (document.pw.newpw1.value == "") {
			alert("새 비밀번호를 입력해주세요.");
			document.pw.newpw1.focus();
			return false;
		}

		if (document.pw.newpw2.value  == "") {
			alert("새 비밀번호 확인을 입력해주세요.");
			document.pw.newpw2.focus();
			return false;
		}
	}
	
</script>
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
				<h3>회원 수정</h3>
			</div>

		</div>


	</div>
	</section>
	<!-- Page Add Section End -->


	<div class="container-fluid">

		<%
			String userId = (String) session.getAttribute("userId");
			MemberDTO mdto = (MemberDTO) request.getAttribute("mdto");
		%>

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

						<h3>기본 회원 정보</h3>
						<br>

						<!-- 회원정보 -->
						<table class="table" "width="820px;" height="350px;"
							style="text-align: center;">
							<tr>
								<th>아이디</th>
								<td><%=mdto.getUserId()%></td>
								<td></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><%=mdto.getUserName()%></td>
								<td></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><%=mdto.getUserEmail() %></td>
								<!--전화변호 변경 구역  -->
							<tr>
								<th scope="row">전화번호</th>
								<td>
									<form action="MemberUpdateInfopro2.me" method="post">
										<input type="hidden" name="id" value="<%=mdto.getUserId()%>">
										<input type="hidden" name="number" value="1">
										<div id="i2" style="display: none;">
											<div>
												<input type="text" name="userTel" id="userTel"
													value="<%=mdto.getUserTel()%>" class="form-control">
											</div>
											<br> <input type="submit" class="btn btn-outline-info"
												value="변경하기"> <input type="button"
												class="btn btn-outline-info" value="취소" onclick="func1();">

										</div>

										<div id="i1"><%=mdto.getUserTel()%></div>
									</form>
								</td>
								<td><button type="button" class="primary-btn look-btn"
										style="background-color: #B0BCC2;" onclick="func1();">변경하기</button></td>
							</tr>
							<!--전번 구역 끝 비밀번호 구역 시작 -->
							<tr>
								<th scope="row">비밀번호</th>

								<td>
									<form action="MemberUpdateInfopro2.me" method="post" name="pw"
										onsubmit="return check();">
										<input type="hidden" name="id" value="<%=mdto.getUserId()%>">
										<input type="hidden" name="number" value="3">
										<div id="i6" style="display: none;">
											<table class="table table-borderless">
												<tr>
													<th>현재비밀번호</th>
													<th><input type="password" name="userPass"
														id="userPass" class="form-control" onkeyup="ckfunc();"></th>
													<td></td>
												</tr>
												<tr><td colspan="2"></td></tr>
												<tr>
													<th>새 비밀번호</th>
													<th><input type="password" name="newpw1" id="newpw1"
														class="form-control"></th>
													<td></td>
												</tr>
												<tr>
													<th>새 비밀번호 확인</th>
													<th><input type="password" name="newpw2" id="newpw2"
														class="form-control"></th>
													
												</tr>
												<tr>
												<td colspan="2"><b id="pwck_msg2"></b></td>
												</tr>
												<tr>
													<td colspan="2"><input type="submit"
														class="btn btn-outline-info" value="변경하기"> <input
														type="button" class="btn btn-outline-info" value="취소"
														onclick="func3();"></td>
												</tr>
											</table>
										</div>
										<%
											String pw = "";
											for (int i = 0; i < mdto.getUserPass().length(); i++) {
												pw += "*";
											}
										%>
										<div id="i5"><%=pw%></div>
									</form>
								</td>

								<td>
									<button type="button" class="primary-btn look-btn"
										style="background-color: #B0BCC2;" onclick="func3();">변경하기</button>
								</td>

							</tr>
						</table>




						<br> <br>
						<h3>부가정보</h3>
						<br>
						<table class="table" style="text-align: center; font-size: 18px;">
							<form action="MemberUpdateInfopro2.me" method="post">
								<input type="hidden" name="id" value="<%=mdto.getUserEmail()%>">
								<input type="hidden" name="number" value="4">
								<tr>
									<td><h4>나의 피부</h4></td>
									<td>
									<c:if test="${mdto.userSkinType == '건성'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinType" value="건성" checked> 건성
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="중성" > 중성
								  </label>
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinType" value="지성" > 지성
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="복합성" > 복합성
								  </label>
								</c:if>
								<c:if test="${mdto.userSkinType == '중성'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								   <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinType" value="건성" > 건성
								  </label>
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinType" value="중성" checked> 중성
								  </label>
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinType" value="지성" > 지성
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="복합성" > 복합성
								  </label>
								</c:if>
								<c:if test="${mdto.userSkinType == '지성'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinType" value="건성" > 건성
								  </label>
								    <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="중성" > 중성
								  </label>
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinType" value="지성" checked> 지성
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="복합성" > 복합성
								  </label>
									
								</c:if>
								<c:if test="${mdto.userSkinType == '복합성'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="건성" > 건성
								  </label>
									  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinType" value="중성" > 중성
								  </label>
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinType" value="지성" > 지성
								  </label>
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinType" value="복합성" checked> 복합성
									</label>
								</c:if>
									</td>
								</tr>
								
								<tr>
									<td><h4>피부 고민</h4></td>
										<td>
									<c:if test="${mdto.userTrouble == '민감성'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinTrouble" value="민감성" checked> 민감성
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="아토피" > 아토피
								  </label>
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinTrouble" value="여드름" > 여드름
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="해당없음" > 해당없음
								  </label>
								</c:if>
								<c:if test="${mdto.userTrouble == '아토피'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								   <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinTrouble" value="민감성" > 민감성
								  </label>
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinTrouble" value="아토피" checked> 아토피
								  </label>
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinTrouble" value="여드름" > 여드름
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="해당없음" > 해당없음
								  </label>
								</c:if>
								<c:if test="${mdto.userTrouble == '여드름'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinTrouble" value="민감성" > 민감성
								  </label>
								    <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="아토피" > 아토피
								  </label>
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinTrouble" value="여드름" checked> 여드름
								  </label>
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="해당없음" > 해당없음
								  </label>
									
								</c:if>
								<c:if test="${mdto.userTrouble == '해당없음'}"> 
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
								  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="민감성" > 민감성
								  </label>
									  <label class="btn btn-outline-info">
								   	<input type="radio" id="radio" name="skinTrouble" value="아토피" > 아토피
								  </label>
								  <label class="btn btn-outline-info">
								    <input type="radio" id="radio" name="skinTrouble" value="여드름" > 여드름
								  </label>
								  <label class="btn btn-outline-info active">
									<input type="radio" id="radio" name="skinTrouble" value="해당없음" checked> 해당없음
									</label>
								</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="text-align: center;">
											<button type="submit" class="primary-btn look-btn"
												style="background-color: #B0BCC2;">저장</button>
										</div>
									</td>
								</tr>
							</form>
						</table>
					</div>

					<br> <br> <br> <br> <br> <br> <br>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>



	</div>
	<!-- container 끝 -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->




</body>
</html>