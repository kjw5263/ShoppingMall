<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Login V10</title>
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



    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Violet | Template</title>

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



	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->




</head>
<body>

<%String userSkinType = ""; %>
	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
		<div class="row m-5">
			<div class="col-2">
			</div>
			<div class="col-8 text-center" >
				<h4>피부타입 테스트 진단결과</h4>
				<br>
				<img alt="" src="./img/question/skin.png" width="150px" height="150px">
			</div>
			<div class="col-2">	
			</div>			
		</div>
	
	
<!-- 		<div class="row"> -->
<!-- 			<div class="col-2"> -->
<!-- 			</div> -->
<!-- 			<div class="col-8 text-center" > -->
<%-- 				점수는 ${param.sum} 입니다. <br> --%>
<!-- 			</div> -->
<!-- 			<div class="col-2">	 -->
<!-- 			</div>			 -->
<!-- 		</div> -->
		
		<div class="row">
			<div class="col-2">
			</div>
			<div class="col-8 text-center" >
			  
				당신의 피부타입은
				<c:choose>
		         <c:when test = "${param.sum < 10}">
		           	건성입니다.
		           	<%
		           	request.setAttribute("userSkinType", "건성");
		           	userSkinType = "건성";
		           	%>
		         </c:when>
		         <c:when test = "${param.sum < 30 && param.sum < 11}">
		         	중성입니다.
		           	<%
		           	request.setAttribute("userSkinType", "중성");
		           	userSkinType = "중성";
		         	%>
		         </c:when>
				 <c:when test = "${param.sum < 40 && param.sum < 31}">
		         	복합성입니다.
		           	<%
		           	request.setAttribute("userSkinType", "복합성"); 
		           	userSkinType = "복합성";
		           	%>
		         </c:when>		         
		         <c:otherwise>
		         	지성입니다.
		           	<%
		           	request.setAttribute("userSkinType", "지성"); 
		           	userSkinType = "지성";
		           	%>
		         </c:otherwise>
		      </c:choose>

			<div class="alert alert-info mt-3" role="alert">
					<h5>Care Point !</h5>
					  
					 <div class="alert alert-light mt-3" role="alert">
					 	<c:choose>
					 		<c:when test="${userSkinType eq '건성' }">
							  	로션과 크림은 수분보다 유분 함량이 많은 것을 선택하는 것이 좋습니다. <br>
							 	건조해지기 쉬운 눈가는 아이전용 에센스나 크림을 발라 피부 보습막을 형성시켜 줍니다. <br>
							 	보습에센스와 보습크림을 이용하여 매일 마사지하고 여양보습공급팩으로 일주일에 1~2회 정도 관리하여 줍니다.
						 	</c:when>
						 	<c:when test="${userSkinType eq '중성' }">
							  	매일 아침,저녁 규칙적이고 올바른 기초손질을 계속하여 피부의 유분과 수분의 균형을 유지시켜줍니다. <br>
							 	계절과 연령의 변화에 따라 화장품을 변화있게 선택하여 알맞은 피부 손질을 합니다.<br>
							 	피부 청결을 위해 스크럽제품, 효소제품 등을 이용한 딥클렌징을 올바른 사용 방벅에 의해 정기적으로 행합니다.
						 	</c:when>
						 	<c:when test="${userSkinType eq '복합성' }">
							  	지성피부용 에센스를 꾸준히 사용하시고, 피지를 제거할 수 있는 팩을 1주 1~2회 정도 꾸준히 사용합니다. <br>
								양볼이 건성피부로 변할 수 있으므로 볼에 한해서는 피지제거 팩의 횟수를 줄이고 보습전용 에센스를 사용합니다.
						 	</c:when>
						 	<c:otherwise>
							  	지성피부는 무엇보다 청결에 신경을 써야 합니다. <br>
							 	철저한 세안이 필요하므로 클렌징제를 이용해 메이크업이나 더러움을 닦아낸 후 미지근한 물을 이용하여 폼 클렌져로 이중 세안을 합니다. <br>
							 	충분히 헹군 후 찬물로 가볍게 패팅을 해주면 모공이 일시적으로 수축하여 피지분비가 적어지므로 효과적입니다.						 	
						 	</c:otherwise>
					 	</c:choose>
					</div>
				</div>
				<div class="alert alert-danger" role="alert">
				
					<h5>주의사항 !</h5>
				  
					<div class="alert alert-light mt-3" role="alert">
					 	<c:choose>
					 		<c:when test="${userSkinType eq '건성' }">
							 	심한 사우나나 더운 열은 피하고 피부의 수분 공급을 위해 물을 충분히 마시도록 합니다. <br>
							 	잦은 세안은 피부의 유분을 제거하므로 피하고 뜨거운 물보다는 미지근한 물을 이용하여 사용합니다. <br>
							 	건성이 심할 때는 아침에 물로만 세안을 하는 것이 좋습니다.
							 </c:when>	
							 <c:when test="${userSkinType eq '중성' }">
							  	세월과 환경적 요인들에 의해 아무리 정상 피부라 하더라도 여러 가지 피부 변화를 가져오게 되므로, 평생 신경을 곤두세워 관리해야 합니다. <br>
							 	외출시에는 자외선 차단제를 30분전에 반드시 발라줍니다. <br>
							 	피부에 영향을 미치는 냉방, 난방, 찬바람 강한 태양광선 등의 외적 환경과 스트레스 등의 내적 환경에 항상 주의합니다.
						 	</c:when>
						 	<c:when test="${userSkinType eq '복합성' }">
							  	이마, 코 주위의 과잉 피지를 제거하고 볼의 수분을 공급하여 이상적인 중성으로 만드는 것이 목적이므로 세심한 관리가 필요합니다. <br>
							 	세안 시 이마나 콧망울, 턱 부분은 스펀지나 중지 보볼을 이용하여 세심하게 문질러 주고 뺨은 간단히 더러움만 제거합니다.
						 	</c:when>
						 	<c:otherwise>
							  	수면 부족이나 스트레스, 변기등은 여드름이나 뾰루지를 유발하므로 규칙적인 생활을 하도록 합시다. <br>
							 	당분, 지방분은 피하고, 버섯, 해조류, 시금치, 양배추 등을 섭취하십시오. <br>
							 	기초화장품과 수렴화장품을 사용하는 것이 좋습니다.						 	
						 	</c:otherwise>
						</c:choose>	 	
							 	
					</div>				  
				  
				</div>
					
			</div>
			<div class="col-2">	
			</div>			
		</div>
		
		<div class="row m-3">
			<div class="col-2">
			</div>
			<div class="col-8 text-center" >
			
			<button type="button" class="btn btn-secondary" onclick="location.href='./Question.que'">🔎 다시 테스트</button>
			
			<button type="button" class="btn btn-success" onclick="location.href='./Customized.que?userSkinType=<%=userSkinType%>'">🧐 나에게 맞는 제품 보기</button>
						
			</div>
			<div class="col-2">	
			</div>			
		</div>
	
	</div>
	<!-- container 끝 -->	
	
	
	
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
</body>
</html>