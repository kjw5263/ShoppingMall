<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN | JUST SKIN</title>

<!-- 네이버 로그인 스크립트 시작 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 네이버 로그인 스크립트 끝 -->


<!-- jquery 준비 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- jquery 준비 끝 -->

<!-- 네이버 로그인 정보 받아오기 시작 -->
	<script type="text/javascript">

	  var clientId = "1mD8QYbgRfV_N72vzXmC";
	  var callbackUrl = "http://localhost:8088/ShoppingMall/member/logincallback.jsp";
	  var naver_id_login = new naver_id_login(clientId, callbackUrl);
	  var n_Email;
	  // 접근 토큰 값 출력
	  // alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    
	    n_Email = naver_id_login.getProfileData('email')
	    //alert(naver_id_login.getProfileData('nickname'));
	    //alert(naver_id_login.getProfileData('age'));
	    
		document.fr.n_Email.value = naver_id_login.getProfileData('email');
		
		// alert(document.fr.n_Email.value)
		
	    document.getElementById("fr").submit();
	  }
	</script>
	<!-- 네이버 로그인 정보 받아오기 끝 -->
</head>
<body>

	<form action="../MemberNaverLoginAction.me" method="post" id="fr" name="fr">
		<input type="hidden" name="n_Email" id="n_Email" value="">
	</form>

</body>
</html>