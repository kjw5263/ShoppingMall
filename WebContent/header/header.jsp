<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
 String userId = (String)session.getAttribute("userId");
%>

	<!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="inner-header">
                <div class="logo">
                    <a href="./Main.me"><img src="./img/logo.png" alt=""></a>
                </div>
                
                <div class="header-right">
                    <img src="./img/icons/search.png" alt="" class="search-trigger">
                    <%
						if(userId !=null && userId.equals("admin") ){
					%>
					   <img src="./img/icons/man.png" alt="" onclick="location.href='./AdminList.ag'">
					<%
					   } else {
					%>
                    <img src="./img/icons/man.png" alt="" onclick="location.href='./MemberInfo.me'">
                    <% } %>
                    <a href="#">
                        <img src="./img/icons/bag.png" alt="" onclick="location.href='./BasketList.ba'">
                        <span>2</span>
                    </a>
                    
                    <%
	        		 if(session.getAttribute("userId") != null){
	        		%>
                    <a href="./MemberLogout.me" class="m-2">로그아웃</a>
                    <%} %>
                    
                </div>
                
                
                <%
        		 if(session.getAttribute("userId") == null){
        		%>
                <div class="user-access">
                    <a href="#">Register</a>
                    <a href="./MemberLogin.me" class="in">Sign in</a>
                </div>
                <%}else{%>
                <div class="user-access">
                    <span class="mt-5"><%=userId %>님 반갑습니다.</span>
                </div>
                <%}%>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a class="active" href="./index.jsp">Home</a></li>
                        <li><a href="./GoodsList.cos">Shop</a>
                            <ul class="sub-menu">
                                <li><a href="./product-page.jsp">Product Page</a></li>
                                <li><a href="./shopping-cart.jsp">Shopping Card</a></li>
                                <li><a href="./check-out.jsp">Check out</a></li>
                            </ul>
                        </li>
                        <li><a href="./product-page.jsp">About</a></li>
                        <li><a href="./check-out.jsp">Blog</a></li>
                        <li><a href="./contact.jsp">Contact</a></li>
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
                        <p>최강1조 화이팅 !!</p>
                    </div>
                </div>
                <div class="col-md-4 text-left text-lg-center">
                    <div class="header-item">
                        <img src="./img/icons/voucher.png" alt="">
                        <p>20% Student Discount</p>
                    </div>
                </div>
                <div class="col-md-4 text-left text-xl-right">
                    <div class="header-item">
                    <img src="./img/icons/sales.png" alt="">
                    <p>30% off on dresses. Use code: 30OFF</p>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Info End -->
    
    
    <!-- Header End -->


</body>
</html>