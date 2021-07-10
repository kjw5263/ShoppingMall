<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.admin.goods.db.AdminGoodsDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    
<title>회원 정보 목록 | JUST SKIN</title>
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
			
    <!-- admin member list Begin -->
    
    <section class="admin_member_list">
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
				        <a class="nav-link active" href="./AdminMemberList.ag"><b>회원목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminCouponList.ag"><b>쿠폰목록</b></a>
				      </li>			      
				    </ul>
				  </div>
				</nav>
		    </td>
		    </tr>
		    </table><br>
			<br>
			<table class="table table-active" style="text-align: center; background-color: white;">
				<thead>
					<tr>
						<th colspan="12" style="text-align: center;"><b>회원 리스트</b></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th width="6%">아이디</th>
						<th width="8%">이름</th>
						<th width="11%">이메일</th>
						<th width="18%">주소</th>
						<th width="15%">전화번호</th>
						<th width="6%">성별</th>
						<th width="9%">피부타입</th>
						<th width="8%">피부고민</th>
						<th width="8%">회원등급</th>
					</tr>
					
					<c:forEach var="i" items="${ memberList }">

					<tr>
						<td>${i.userId }</td>
						<td>${i.userName }</td>
						<td>${i.userEmail }</td>
						<td>${i.userAddr }</td>
						<td>${i.userTel }</td>
						<td>${i.userGender }</td>
						<td>${i.userSkinType }</td>
						<td>${i.userTrouble }</td>
						<td>${i.userLevel }</td>
					</tr>     
					</c:forEach>	          
				</tbody>
			</table>	
        </div>
    </section>

	  <hr>
	  
						<!--페이징 처리  -->
						<div style="margin-left: 45%;">
							<ul class="pagination">
								<c:if test="${cnt != 0}">
									
									<c:set var="pageCount" value="${cnt/pageSize+(cnt % pageSize == 0? 0:1)}"/>
									<c:set var="pageBlock" value="1"/>
									<fmt:parseNumber var= "startPage" integerOnly= "true" value="${((currentPage-1)/pageBlock) * pageBlock + 1}" />
									<c:set var="endPage" value="${startPage + pageBlock-1 }"/>
									<c:if test="${endPage > pageBlock}">
										<c:set var="endPage" value="${pageCount}"/>
									</c:if>
								
									
									<c:if test="${startPage > pageBlock}">
											<li class="page-item"><a class="page-link"
											href="./AdminMemberList.ag?pageNum=${startPage-pageBlock}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
									</c:if>
	
									
										<c:forEach begin="${startPage }" end="${endPage}" var="i">
											<li class="page-item"><a class="page-link"
											href="./AdminMemberList.ag?pageNum=${i}" class="btn btn-primary btn">${i}</a></li>
										</c:forEach>

									
									<c:if test="${endPage < pageCount }">
											<li class="page-item"><a class="page-link"
										href="./AdminMemberList.ag?pageNum=${startPage+pageBlock}" ara-label="Next"> 
										<span aria-hidden="true">&raquo;</span></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
						<!-- 페이징 처리 -->

    <!-- admin member list End -->
			
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