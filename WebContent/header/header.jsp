<%@page import="java.util.Vector"%>
<%@page import="com.basket.db.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/header.css" type="text/css">
</head>
<body>

<%
	String userId = (String)session.getAttribute("userId");
	BasketDAO bkdao = new BasketDAO();
	Vector totalList = bkdao.getBasketList(userId);
	List basketList = (List)totalList.get(0);
%>


    <!-- Search model -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form" action="Goodssearch.cos" method="post">
				<input type="text" name = "searchname" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->
	<!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="inner-header">
                <div class="logo">
                    <a href="./Main.me"><img src="./img/logo5.png" alt="" style=" margin-top:-22px; margin-left: 16px; "></a>
                </div>
                
                <div class="header-right">
                    <img src="./img/icons/search.png" alt="" class="search-trigger">
                    <%
						if(userId !=null && userId.equals("admin") ){
					%>
					   <img src="./img/icons/man.png" alt="" onclick="location.href='./AdminGoodsList.ag'">
					<%
					   } else {
					%>
                    <img src="./img/icons/man.png" alt="" onclick="location.href='./MemberInfo.me'">
                    <% } %>
                    <a href="#">
                        <img src="./img/icons/bag.png" alt="" onclick="location.href='./BasketList.ba'">
                    <%
	                	int count = 0;
	
	                	for(int i=0; i<basketList.size();i++){
	                		BasketDTO bkDTO = (BasketDTO) basketList.get(i);
	                		count += bkDTO.getBasketCosAmount();
                    %>
                        <span><%=count %></span>
                    <%} %>
                    </a>
                    
                    <%
	        		 if(session.getAttribute("userId") != null){
	        		%>
                    <a href="./MemberLogout.me" class="m-2">로그아웃</a>
                    <%} %>
                    
                </div>
                
                
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a class="active" href="./index.jsp">Home</a></li>
                        <li><a href="./GoodsList.cos">Products</a></li>
                        <li><a href="./Question.que">피부진단</a></li>
                        <li><a href="./notice.nos">공지사항</a></li>
                        <li><a href="./FaqList.faq">FQA</a></li>
		                <%
		        		 if(session.getAttribute("userId") == null){
		        		%>
		                    <li><a href="./emailJoin.me">Register</a></li>
		                    <li><a href="./MemberLogin.me" class="in">Sign in</a></li>
		                <%}else{%>
		                    <li><span class="mt-5" style="color:black;">
		                    <b><%=userId %></b>님 반갑습니다.</span></li>
		                <%}%>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    
    
    <!-- Header Info Begin -->
    <div class="header-info">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="header-item">
                        <img src="./img/icons/delivery.png" alt="">
                        <p>10시 이전 주문 시 <b>당일배송</b></p>
                    </div>
                </div>
                <div class="col-md-4 text-left text-lg-center">
                    <div class="header-item">
                        <img src="./img/icons/voucher.png" alt=""
                        onclick="location.href='./couponEvent.cp'"
                        style='cursor:pointer;'>
                        <p onclick="location.href='./couponEvent.cp'"
                        style='cursor:pointer;'>20% Student Discount</p>
                    </div>
                </div>
                <div class="col-md-4 text-left text-xl-right">
                    <div class="header-item">
                    <img src="./img/icons/sales.png" alt="">
                    <p>회원가입 시 <b>추천인</b> 입력하면 <b>500포인트</b> 즉시 적립! </p>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Info End -->
    
    

</body>
    <!-- Header End -->
 <!-- Js Plugins -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/jquery.magnific-popup.min.js"></script>
    <script src="./js/jquery.slicknav.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
    <script src="./js/jquery.nice-select.min.js"></script>
    <script src="./js/mixitup.min.js"></script>
    <script src="./js/main.js"></script>

</html>