<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>회원가입 | JUST SKIN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/util.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
<!--===============================================================================================-->


    <title>이메일 인증페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">
    
    <!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
</head>


<!-- 우편번호 api 시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	
	$(document).ready(function(){
		
		var ck1=false;			//id
		var ck2=false;			//pw
		var ck3=false;			//pw1
		var ck4=false;			//name
		var ck5=false;			//phone
		var ck6=false;			//address2
		var ck7=false;			//address3
		
		$("#signUp").submit(function(){
			
			 if($.trim($("#userId").val()) == ""){
				 $('.ckMsg_id').text("아이디를 입력하세요");     
	             $('.ckMsg_id').css("color","red"); 
	             $('.ckMsg_id').css("padding-left","1rem"); 
	             $("#userId").focus();
	             return false;
			 }
			 if($.trim($("#pw").val()) == ""){
				 $('.ckMsg_pw').text("비밀번호를 입력하세요");     
	             $('.ckMsg_pw').css("color","red"); 
	             $('.ckMsg_pw').css("padding-left","1rem"); 
	             $("#pw").focus();
	             return false;
			 }
			 if($.trim($("#pw1").val()) == ""){
				 $('.ckMsg_pw1').text("비밀번호 확인을 입력하세요");     
	             $('.ckMsg_pw1').css("color","red"); 
	             $('.ckMsg_pw1').css("padding-left","1rem"); 
	             $("#pw1").focus();
	             return false;
			 }
			 if($.trim($("#name").val()) == ""){
				 $('.ckMsg_name').text("이름을 입력하세요");     
	             $('.ckMsg_name').css("color","red"); 
	             $('.ckMsg_name').css("padding-left","1rem"); 
	             $("#name").focus();
	             return false;
			 }
			 if($.trim($("#phone").val()) == ""){
				 $('.ckMsg_ph').text("연락처를 입력하세요");     
	             $('.ckMsg_ph').css("color","red"); 
	             $('.ckMsg_ph').css("padding-left","1rem"); 
	             $("#phone").focus();
	             return false;
			 }
			 if($.trim($("#address1").val()) == ""){
				 $('.ckMsg_addr1').text("주소를 입력하세요");     
	             $('.ckMsg_addr1').css("color","red"); 
	             $('.ckMsg_addr1').css("padding-left","1rem"); 
	             $("#address1").focus();
	             return false;
			 }
			 if($.trim($("#address2").val()) == ""){
				 $('.ckMsg_addr2').text("주소를 입력하세요");     
	             $('.ckMsg_addr2').css("color","red"); 
	             $('.ckMsg_addr2').css("padding-left","1rem"); 
	             $("#address2").focus();
	             return false;
			 }
			 
			 if($.trim($("#address3").val()) == ""){
				$('.ckMsg_addr3').text("상세주소를 입력하세요");     
	            $('.ckMsg_addr3').css("color","red"); 
	            $('.ckMsg_addr3').css("padding-left","1rem"); 
	            $("#address3").focus();
	            return false;											
			 }
			 
			 
			 if(ck1 == false || ck2 == false || ck3 == false || ck4 == false || 
				ck5 == false || ck6 == false ||ck7 == false){
				 return false;
			 }
	
		
	 });	 // signUp (공백체크)
	 
		$("#userId").keyup(function(){
			var userId = $("#userId").val();
			var check = /^[A-Za-z\d_-]{4,15}$/;
			
			$.ajax({
				 url:'./MemberCheckAction.me',
			     type:'post',
			     data:{"userId":userId}, 
			     success:function(data){
		    			    	 
			    	 if(data > 0){
			                $('.ckMsg_id').text("이미 존재하는 아이디입니다");     
			                $('.ckMsg_id').css("color","red"); 
			                $('.ckMsg_id').css("padding-left","1rem"); 
			                ck1 = false; 			                
			    		}else{
			    			
			    			if(userId.match(check) != null){
								$('.ckMsg_id').text("사용가능한 아이디입니다");
								$('.ckMsg_id').css("color","green");
								ck1 = true;
							}else{
								$('.ckMsg_id').text("아이디는 4~15자리만 가능합니다");     
								$('.ckMsg_id').css("color","red"); 
								$('.ckMsg_id').css("padding-left","1rem");
								ck1 = false; 
							}
		                }
		               },
		        		error:function(){
		                alert("에러입니다");
		               	}
		          });
			});//id 중복확인 
		 
		 $("#pw").keyup(function(){
			 var userPass = $("#pw").val();
			 var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/.test(userPass);
			 
			 if(userPass == null){
					$('.ckMsg_pw').text("비밀번호를 입력하세요");     
					$('.ckMsg_pw').css("color","red"); 
 					$('.ckMsg_pw').css("padding-left","1rem"); 
 					ck2 = false;
				
			 }else if(check){
				 	$('.ckMsg_pw').text("사용 가능한 비밀번호입니다");     
					$('.ckMsg_pw').css("color","green");
					$('.ckMsg_pw').css("padding-left","1rem"); 
					ck2 = true; 
			 }else{
				 	$('.ckMsg_pw').text("대소문자,숫자,특수문자(@$!%*#?&) 세가지를 조합한 8~16자리를 입력하세요");     
					$('.ckMsg_pw').css("color","red"); 
				 	$('.ckMsg_pw').css("padding-left","1rem");
		 		 	ck2 = false;									
			 }
			 
		 });//pw
		
		 
		 $("#pw1").keyup(function(){
			 
			 if($("#pw").val() != $("#pw1").val()){
					$('.ckMsg_pw1').text("비밀번호가 일치하지 않습니다");     
					$('.ckMsg_pw1').css("color","red"); 
					$('.ckMsg_pw1').css("padding-left","1rem"); 
					ck3 = false;
			 }else{
					$('.ckMsg_pw1').text("비밀번호가 일치합니다");     
					$('.ckMsg_pw1').css("color","green");
					$('.ckMsg_pw1').css("padding-left","1rem"); 
					ck3 = true;
			 }
			 
		 });//pw1 (pw확인)
		 
		 $("#name").keyup(function(){
			 
			 var name = $("#name").val();
			 var check = /^[A-Z|a-z|가-힣]{2,5}$/;
			 if(name.match(check) != null){
					$('.ckMsg_name').text("");     
					ck4 = true;
				}else{
		            $('.ckMsg_name').text("이름을 정확히 입력하세요");     
					$('.ckMsg_name').css("color","red"); 
					$('.ckMsg_name').css("padding-left","1rem");
					ck4 = false;
				}
			 
		 });//name
		 
		 $("#phone").keyup(function(){
			 
			 var phone = $("#phone").val();
			 var check1 = /^010([0-9]{8})$/;
			 var check2 = /^01([1|6|7|8|9])([0-9]{3})([0-9]{4})$/;
			 	if(phone.match(check1) != null || phone.match(check2) != null ){
					$('.ckMsg_phone').text("");     
					ck5 = true;
				}else{
		            $('.ckMsg_phone').text("연락처를 확인해주세요");     
					$('.ckMsg_phone').css("color","red"); 
					$('.ckMsg_phone').css("padding-left","1rem");
					chkup5 = false; 
				}
			 	
			 	
		 	});//phone
		 	
		  	 
	});//signUp
	
	</script>
	<!-- 유효성 체크  끝 -->
	<!-- 네이버 이메일 세션으로 가져오기 -->
	<%
	String naverLogin = (String)session.getAttribute("naverLogin");
	String kakaoLogin = (String)session.getAttribute("kakaoLogin");
	
	%>
					
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w" action="./MemberJoinAction.me" method="post">
				<!-- <form class="login100-form validate-form flex-sb flex-w" action="./MemberJoinAction.me" method="post" id="signUp" name="signUp"> -->
					<span class="login100-form-title p-b-51">
						회원가입
					</span>

						<input type="hidden" name="naverLogin" value="<%=naverLogin %>">
						<input type="hidden" name="kakaoLogin" value="<%=kakaoLogin %>">

						*아이디 <span class="ckMsg_id"></span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "아이디를 입력해주세요">
								<input class="input100" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
							<span class="focus-input100"></span>
						</div>
						
						*비밀번호 <span class="ckMsg_pw"></span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "비밀번호를 입력해주세요">
								<input class="input100" type="password" id="pw" name="userPass" placeholder="비밀번호를 입력해주세요">
							<span class="focus-input100"></span>
						</div>
						
						*비밀번호 확인 <span class="ckMsg_pw1"></span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
								<input class="input100" type="password" id="pw1" name="passConfirm" placeholder="입력한 비밀번호를 다시 입력해주세요">
							<span class="focus-input100"></span>
						</div>
						
						*이름<span class="ckMsg_name"></span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "이름을 적어주세요">
								<input class="input100" type="text" id="name" name="userName" placeholder="이름을 입력하세요">
							<span class="focus-input100"></span>
						</div>
						
						*생년월일
						<div class="wrap-input100 validate-input m-b-16" data-validate = "생년월일을 입력해주세요">
								<input class="input100" type="date" name="userBirth">
							<span class="focus-input100"></span>
						</div>
						
						*휴대폰 번호 <span class="ckMsg_phone"></span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "휴대폰 번호를 입력해주세요">
								<input class="input100" type="text" id="phone" name="userTel" placeholder="'-'를 제외한 연락처를 입력하세요">
							<span class="focus-input100"></span>
						</div>
						
						*이메일
						
						<% 					
							//System.out.println("=====회원가입======");
							String userEmail=(String)session.getAttribute("userEmail");
						%>
						<div class="wrap-input100 validate-input m-b-16">
						<%
						   if(userEmail != null){
						%>
							<input class="input100" type="email" name="userEmail" value="<%=userEmail%>" readonly>
						<%	   
						   }
						%>	
							<span class="focus-input100"></span>
						</div>  
						
						*성별
						<div class="wrap-input100 validate-input m-b-16">
								<input type="radio" name="userGender" value="남"> 남
						</div>
						<div class="wrap-input100 validate-input m-b-16">
							<input type="radio" name="userGender" value="여"> 여
						</div>
						
						*주소
							<input type="button"  value="우편번호찾기" onclick="DaumPostcode()">
						<div class="wrap-input100 validate-input m-b-16">
							<span class="ckMsg_addr1"></span>
								<input class="input100" type="text" name="address1" id="address1" placeholder="우편번호" readonly>
							<span class="focus-input100"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-16">
							<span class="ckMsg_addr2"></span>
								<input class="input100" type="text" name="address2" id="address2" placeholder="주소를 입력하세요" readonly>
							<span class="focus-input100"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-16">
							<span class="ckMsg_addr3"></span>
								<input class="input100" type="text" name="address3" id="address3" placeholder="상세주소">
							<span class="focus-input100"></span>
						</div>
					
						
						*피부타입
						<div class="wrap-input100 validate-input m-b-16">
							<input type="radio" name="userSkinType" value="건성"> 건성
							<input type="radio" name="userSkinType" value="중성"> 중성
							<input type="radio" name="userSkinType" value="지성"> 지성
							<input type="radio" name="userSkinType" value="복합성"> 복합성
						</div>
					
						*피부고민
						<div class="wrap-input100 validate-input m-b-16">
							<input type="radio" name="userTrouble" value="민감성"> 민감성
							<input type="radio" name="userTrouble" value="여드름"> 여드름
							<input type="radio" name="userTrouble" value="아토피"> 아토피
							<input type="radio" name="userTrouble" value="해당없음"> 해당없음
						</div>
						
						*추천인 아이디
						<div class="wrap-input100 validate-input m-b-16">
								<input type="text" id="referral_id" name="referral_id" placeholder="추천인 아이디">
						</div>
						
			
					<div class="container-login100-form-btn m-t-17">
						<input type="submit" class="login100-form-btn" value="Login">
							
						
					</div>

					

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="./vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/bootstrap/js/popper.js"></script>
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/daterangepicker/moment.min.js"></script>
	<script src="./vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./js/login.js"></script>

    <!-- footer 시작 -->
    
   		<jsp:include page="../footer/footer.jsp" />
   		 
    
    <!-- footer 시작 -->

</body>
</html>