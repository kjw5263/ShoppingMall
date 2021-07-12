<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- model2 실행페이지 -->
	<%
		 // index.jsp 페이지
		//response.sendRedirect("./MemberJoin.me");
		//response.sendRedirect("./MemberLogin.me");
		 
		 // 메인 페이지로 이동
		
		 response.sendRedirect("./Main.me");
		// 내가 모델2에서 실행할 수 있는 jsp 파일은, index.jsp 밖에 없다!
		
		// response.sendRedirect("./couponEvent.cp");
		
		// 쇼핑몰 - 상품등록/관리/주문/장바구니
		
		// 관리자 - 상품 등록
		//response.sendRedirect("./GoodsAdd.ag"); // 컨트롤러의 GoodsAdd.ag 부분으로 간다!
		
		// 관리자 상품 리스트로 바로 가기
		//response.sendRedirect("./AdminGoodsList.ag");
		
		
	%>

	
</body>
</html>