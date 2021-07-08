<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.admin.goods.db.AdminGoodsDAO"%>
<%@page import="com.coupon.db.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">

    <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
    <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
    <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
    <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
    
<title>관리자 쿠폰 목록</title>
</head>
<body>
<!-- Header Section Begin -->
<jsp:include page="/header/header.jsp"/>
<!-- Header Section End -->

    <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->
    
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
	<div class="row">
		<div class="col-0 text-center">
		<!-- left -->
		</div>
		
		<div class="col-12 text-center">
			
    <!-- admin coupon list Begin -->
    
    <%
    	List couponList = (List) request.getAttribute("couponList");
    %>
    
    <section class="admin_coupon_list">
        <div class="container">
	        <table>
		    <tr>
		    <td>
			    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="collapse navbar-collapse">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminGoodsList.ag"><b>상품목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./GoodsAdd.ag"><b>상품등록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminOrderList.ag"><b>주문목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminMemberList.ag"><b>회원목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link active" href="./AdminCouponList.ag"><b>쿠폰목록</b></a>
				      </li>			      
				    </ul>
				  </div>
				</nav>
		    </td>
		    </tr>
		    </table><br>
			<table class="table table-active" style="text-align: center; background-color: white;">
				<thead>
					<tr>
						<th colspan="12" style="text-align: center;" ><b>관리자 쿠폰 리스트</b></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<th>쿠폰이름</th>	
						<th>쿠폰정보</th>
						<th>할인율</th>
						<th>수정/삭제</th>
					</tr>
					
					<c:forEach var="i" items="${ couponList }">	
					<tr>
						<td>${i.couponNum }</td>
						<td>${i.couponName }</td>
						<td>${i.couponNote }</td>
						<td>${i.couponDc }</td>
						<td>
							<a href="./AdminCouponsModify.ag?couponNum=${i.couponNum }" class="btn btn-primary btn-sm">수정</a>	
							<a href="./AdminCouponsDelete.ag?couponNum=${i.couponNum }" class="btn btn-danger btn-sm">삭제</a>
						</td>						
					</tr>
					</c:forEach>   	          
				</tbody>
			</table>	
        </div>
    <br>
		<div class="container">
			<form method="post" action="./AdminCouponsAddAction.ag">
				<table class="table table-active" style="text-align: center; background-color: white;">
					<thead>
						<tr>
							<th colspan="2" style="text-align: center;"><b>관리자 쿠폰등록</b></th>
						</tr>
					</thead>
					<tbody>
					 <tr>
			           <th>쿠폰이름</th>
			           <td><input type="text" name="couponName" class="form-control" required></td>           
			         </tr>
					 <tr>
			           <th>쿠폰정보</th>
			           <td><input type="text" name="couponNote" class="form-control" required></td>           
			         </tr>
			         <tr>
						<th>할인율</th>
						<td><input type="text" name="couponDc" class="form-control" required></td> 
					</tr>		      	          
					</tbody>
				</table>
				<div style="margin-left: auto; margin-right: auto;">
				    <input type="submit" value="쿠폰등록" class="btn btn-primary">
				    <input type="reset" value="쿠폰초기화" class="btn btn-primary">
			    </div>		
			</form>		
		</div>
	</section>

    <!-- admin coupon list End -->
			
		</div>
		<div class="col-0">	
		<!-- right -->
		</div>
	</div>
	
	
	
	</div>
	<!-- container 끝 -->	

    
    <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->

	
<!-- Footer Section Begin -->
<jsp:include page="/footer/footer.jsp"/>
<!-- Footer Section End -->

</body>
</html>