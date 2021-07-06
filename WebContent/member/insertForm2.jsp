<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
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


<title>회원가입</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../css/style.css" type="text/css">

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<!-- 우편번호 api 시작 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function DaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수
						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address2').value = fullAddr; // 선택한 주소 들어가는곳
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address3').focus(); //상세주소 동 호수 기입하는곳
					}
				}).open();
	}
</script>
<!-- 우편번호 api 끝 -->

<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->

	<!-- 유효성 체크  시작  (name, id, pw, pw1, phone, address) -->
	<script type="text/javascript">
		$(document).ready(
			function() {
				
				var ck1 = false; //id
				var ck2 = false; //pw
				var ck3 = false; //pw1
				var ck4 = false; //name
				var ck5 = false; //phone
				var ck6 = false; //address2
				var ck7 = false; //address3

		$("#signUp").submit(
					function() {

						if ($.trim($("#userId").val()) == "") {
							$('.ckMsg_id').text("아이디를 입력하세요");
							$('.ckMsg_id').css("color","red");
							$('.ckMsg_id').css("padding-left","1rem");
							$("#userId").focus();
							return false;
						}
						if ($.trim($("#pw").val()) == "") {
							$('.ckMsg_pw').text("비밀번호를 입력하세요");
							$('.ckMsg_pw').css("color", "red");
							$('.ckMsg_pw').css("padding-left","1rem");
							$("#pw").focus();
							return false;
						}
						if ($.trim($("#pw1").val()) == "") {
							$('.ckMsg_pw1').text("비밀번호 확인을 입력하세요");
							$('.ckMsg_pw1').css("color", "red");
							$('.ckMsg_pw1').css("padding-left","1rem");
							$("#pw1").focus();
							return false;
						}
						if ($.trim($("#name").val()) == "") {
							$('.ckMsg_name').text("이름을 입력하세요");
							$('.ckMsg_name').css("color", "red");
							$('.ckMsg_name').css("padding-left","1rem");
							$("#name").focus();
							return false;
						}
						if ($.trim($("#phone").val()) == "") {
							$('.ckMsg_ph').text("연락처를 입력하세요");
							$('.ckMsg_ph').css("color","red");
							$('.ckMsg_ph').css("padding-left","1rem");
							$("#phone").focus();
							return false;
						}
						if ($.trim($("#address1").val()) == "") {
							$('.ckMsg_addr1').text("주소를 입력하세요");
							$('.ckMsg_addr1').css("color", "red");
							$('.ckMsg_addr1').css("padding-left","1rem");
							$("#address1").focus();
							return false;
						}
						if ($.trim($("#address2").val()) == "") {
							$('.ckMsg_addr2').text("주소를 입력하세요");
							$('.ckMsg_addr2').css("color", "red");
							$('.ckMsg_addr2').css("padding-left","1rem");
							$("#address2").focus();
							return false;
						}

						if ($.trim($("#address3").val()) == "") {
							$('.ckMsg_addr3').text("상세주소를 입력하세요");
							$('.ckMsg_addr3').css("color", "red");
							$('.ckMsg_addr3').css("padding-left","1rem");
							$("#address3").focus();
							return false;
						}

						if (ck1 == false || ck2 == false || ck3 == false || ck4 == false 
								|| ck5 == false || ck6 == false || ck7 == false) {
							return false;
						}

					}); // signUp (공백체크)


		$("#userId").keyup(function() {
				var userId = $("#userId").val();
				var check = /^[A-Za-z\d_-]{4,15}$/;
				
				$.ajax({
						url : './MemberCheckAction.me',
						type : 'post',
						data : {"userId" : userId},
						success : function(data) {
							
							if (data > 0) {
								$('.ckMsg_id').text("이미 존재하는 아이디입니다");
								$('.ckMsg_id').css("color","red");
								$('.ckMsg_id').css("padding-left","1rem");
								ck1 = false;} 
							else {
								if (userId.match(check) != null) {
									$('.ckMsg_id').text("사용가능한 아이디입니다");
									$('.ckMsg_id').css("color","green");
									ck1 = true;}
								else {$('.ckMsg_id').text("아이디는 4~15자리만 가능합니다");
									  $('.ckMsg_id').css("color","red");
									  $('.ckMsg_id').css("padding-left","1rem");
									  ck1 = false;}
								}
						 },
						error : function() {alert("에러입니다");}
				});
		});//id 중복확인 

							$("#pw")
									.keyup(
											function() {
												var userPass = $("#pw").val();
												var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
														.test(userPass);

												if (userPass == null) {
													$('.ckMsg_pw').text(
															"비밀번호를 입력하세요");
													$('.ckMsg_pw').css("color",
															"red");
													$('.ckMsg_pw').css(
															"padding-left",
															"1rem");
													ck2 = false;

												} else if (check) {
													$('.ckMsg_pw').text(
															"사용 가능한 비밀번호입니다");
													$('.ckMsg_pw').css("color",
															"green");
													$('.ckMsg_pw').css(
															"padding-left",
															"1rem");
													ck2 = true;
												} else {
													$('.ckMsg_pw')
															.text(
																	"대소문자,숫자,특수문자(@$!%*#?&) 세가지를 조합한 8~16자리를 입력하세요");
													$('.ckMsg_pw').css("color",
															"red");
													$('.ckMsg_pw').css(
															"padding-left",
															"1rem");
													ck2 = false;
												}

											});//pw

							$("#pw1")
									.keyup(
											function() {

												if ($("#pw").val() != $("#pw1")
														.val()) {
													$('.ckMsg_pw1').text(
															"비밀번호가 일치하지 않습니다");
													$('.ckMsg_pw1').css(
															"color", "red");
													$('.ckMsg_pw1').css(
															"padding-left",
															"1rem");
													ck3 = false;
												} else {
													$('.ckMsg_pw1').text(
															"비밀번호가 일치합니다");
													$('.ckMsg_pw1').css(
															"color", "green");
													$('.ckMsg_pw1').css(
															"padding-left",
															"1rem");
													ck3 = true;
												}

											});//pw1 (pw확인)

							$("#name").keyup(
									function() {

										var name = $("#name").val();
										var check = /^[A-Z|a-z|가-힣]{2,5}$/;
										if (name.match(check) != null) {
											$('.ckMsg_name').text("");
											ck4 = true;
										} else {
											$('.ckMsg_name').text(
													"이름을 정확히 입력하세요");
											$('.ckMsg_name')
													.css("color", "red");
											$('.ckMsg_name').css(
													"padding-left", "1rem");
											ck4 = false;
										}

									});//name

							$("#phone")
									.keyup(
											function() {

												var phone = $("#phone").val();
												var check1 = /^010([0-9]{8})$/;
												var check2 = /^01([1|6|7|8|9])([0-9]{3})([0-9]{4})$/;
												if (phone.match(check1) != null
														|| phone.match(check2) != null) {
													$('.ckMsg_phone').text("");
													ck5 = true;
												} else {
													$('.ckMsg_phone').text(
															"연락처를 확인해주세요");
													$('.ckMsg_phone').css(
															"color", "red");
													$('.ckMsg_phone').css(
															"padding-left",
															"1rem");
													chkup5 = false;
												}

											});//phone

						});//signUp
	</script>
	<!-- 유효성 체크  끝 -->

	<!-- naver, kakao 이메일 세션으로 가져오기 -->
	<%
		String naverLogin = (String) session.getAttribute("naverLogin");
		String kakaoLogin = (String) session.getAttribute("kakaoLogin");
	%>

	<!-- Page introduce Section Begin -->
	<section class="page-add">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-breadcrumb">
					<h2>환영합니다!</h2>
					<br> <span>지금 회원가입을 하시면 상품 구매시 현금처럼 사용하실 수 있는 포인트적립과
						다양한 혜택을 받으실 수 있습니다.</span>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Page introduce Section End -->

<!-- Sign Up insert Page Begin -->
<section class="cart-total-page spad">
	<div class="container">
		<form action="./MemberJoinAction.me" class="checkout-form" method="post">
			<div class="row">
					<input type="hidden" name="naverLogin" value="<%=naverLogin%>">
					<input type="hidden" name="kakaoLogin" value="<%=kakaoLogin%>">
				<div class="col-lg-12">
					<h3>회원가입을 완료해주세요</h3>
				</div>
			</div>
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name" >아이디*</p>
						</div>
						<div class="col-lg-5">
							<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
						</div>
						<div class="col-lg-5">
							<span class="ckMsg_id"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">비밀번호*</p>
						</div>
						<div class="col-lg-5">
							<input type="password" id="pw" name="userPass"
								placeholder="비밀번호를 적어주세요">
						</div>
						<div class="col-lg-5">
							<span class="ckMsg_pw"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">비밀번호 확인*</p>
						</div>
						<div class="col-lg-5">
							<input type="password" placeholder="비밀번호를 다시 한번 입력해주세요">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">Phone*</p>
						</div>
						<div class="col-lg-5">
							<input type="text">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">성별</p>
						</div>
						<div class="col-lg-2">
							<div class="diff-addr">
								<input type="radio" name="gender" value="남"
									style="visibility: visible;"> <label for="남">남</label>
							</div>
						</div>
						<div class="col-lg-2">
							<div class="diff-addr">
								<input type="radio" name="gender" value="여"
									style="visibility: visible;"> <label for="여">여</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">E-mail</p>
						</div>
						<div class="col-lg-10">
							<input type="text">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">Post Code/ZIP*</p>
						</div>
						<div class="col-lg-10">
							<input type="text">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<p class="in-name">Street Address*</p>
						</div>
						<div class="col-lg-10">
							<input type="text"> <input type="text">
						</div>
					</div>
			</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="payment-method">
					<!--  <div class="page-breadcrumb">
                        <h2>피부타입과 고민을 체크해주세요<span>피부에 맞는 화장품을 추천해드립니다.</span></h2>
                    </div> -->
                    <h3>피부타입</h3>
					<input type="radio" name="skinType" value="건성"><label
						for="건성">건성</label> <input type="radio" name="skinType" value="중성"><label
						for="중성">중성</label> <input type="radio" name="skinType" value="지성"><label
						for="지성">지성</label> <input type="radio" name="skinType" value="복합성"><label
						for="복합성">복합성</label>
	
					<h3>피부고민</h3>
					<input type="radio" name="skinType" value="건성"><label
						for="건성">건성</label> <input type="radio" name="skinType" value="중성"><label
						for="중성">중성</label> <input type="radio" name="skinType" value="지성"><label
						for="지성">지성</label> <input type="radio" name="skinType" value="복합성"><label
						for="복합성">복합성</label>
	
						<button type="submit">회원가입하기</button>
				</div>
			</div>
		</div>
	</form>
  </div> <!-- container div -->
</section>
	<!-- Cart Total Page End -->

	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 끝 -->

	<!-- Js Plugins -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/jquery.slicknav.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.nice-select.min.js"></script>
	<script src="../js/mixitup.min.js"></script>
	<script src="../js/main.js"></script>
</body>

</html>