<%@page import="com.order.db.OrderDTO"%>
<%@page import="com.admin.goods.db.AdminGoodsDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
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

<link rel="stylesheet"
	href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

<title>관리자 주문 목록 | JUST SKIN</title>
</head>
<body>
	<!-- Header Section Begin -->
	<jsp:include page="/header/header.jsp" />
	<!-- Header Section End -->

	<!-- Page Add Section Begin -->
	<section class="page-add">
	<div class="container"></div>
	</section>
	<!-- Page Add Section End -->

	<!-- container 시작 -->
	<div class="container-fluid">

		<div class="row">
			<div class="col-0 text-center">
				<!-- left -->
			</div>

			<div class="col-12 text-center">

				<!-- admin order list Begin -->
				
				<section class="admin_order_list">
				<div class="container">
					<table>
						<tr>
							<td><nav
									class="navbar navbar-expand-lg navbar-light bg-light">
								<div class="collapse navbar-collapse">
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link"
											href="./AdminGoodsList.ag"><b>상품목록</b></a></li>
										<li class="nav-item"><a class="nav-link"
											href="./GoodsAdd.ag"><b>상품등록</b></a></li>
										<li class="nav-item"><a class="nav-link active"
											href="./AdminOrderList.ag"><b>주문목록</b></a></li>
										<li class="nav-item"><a class="nav-link"
											href="./AdminMemberList.ag"><b>회원목록</b></a></li>
										<li class="nav-item"><a class="nav-link"
											href="./AdminCouponList.ag"><b>쿠폰목록</b></a></li>
									</ul>
								</div>
								</nav></td>
						</tr>
					</table>
					<br>
					<table class="table table-active"
						style="text-align: center; background-color: white;">
						<thead>
							<tr>
								<th colspan="12" style="text-align: center;"><b>회원 주문
										리스트</b></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>주문번호</th>
								<th>주문자</th>
								<th>상품명</th>
								<th>결제방법</th>
								<th>주문금액</th>
								<th>주문상태</th>
								<th>주문일시</th>
								<th>상세/삭제</th>
							</tr>

							<c:forEach var="i" items="${ orderList }">

								<tr>
									<td>${i.o_tradeNum }</td>
									<td>${i.o_userId }</td>
									<td>${i.o_cosName }</td>
									<td>${i.payType }</td>
									<td>₩<fmt:formatNumber value="${i.sumMoney }" pattern="#,###"/></td>
									<form name="form" method="post" action="./OrderStatusModify.ag">
										<td><input type="hidden" name="o_tradeNum"
											class="o_tradeNum" value="${i.o_tradeNum }" />
											<ul class="nav flex-column ">
												<li class="nav-item mb-2">
												<select name="orderStatus" class="form-control"
													style="padding: 6px 10px;">
														<option value="결제완료"
															<c:if test="${i.orderStatus eq '결제완료'}">selected</c:if>>결제완료</option>
														<option value="상품준비"
															<c:if test="${i.orderStatus eq '상품준비'}">selected</c:if>>상품준비</option>
														<option value="상품준비완료"
															<c:if test="${i.orderStatus eq '상품준비완료'}">selected</c:if>>상품준비완료</option>
														<option value="주문취소"
															<c:if test="${i.orderStatus eq '주문취소'}">selected</c:if>>주문취소</option>
														<option value="배송준비"
															<c:if test="${i.orderStatus eq '배송준비'}">selected</c:if>>배송준비</option>
														<option value="배송중"
															<c:if test="${i.orderStatus eq '배송중'}">selected</c:if>>배송중</option>
														<option value="배송완료"
															<c:if test="${i.orderStatus eq '배송완료'}">selected</c:if>>배송완료</option>
												</select> 
												</li>
												<li class="nav-item mb-2"><input type="submit"
													value="수정" class="btn btn-primary btn-sm" /></li>
											</ul></td>
									</form>
									<td>${i.orderDate }</td>
									<td>
										<ul class="nav flex-column ">
											<li class="nav-item mb-2"><a
												href="./AdminOrderDetail.ag?o_tradeNum=${i.o_tradeNum }"
												class="btn btn-primary btn-sm">상세</a></li>
											<li class="nav-item mb-2"><a
												href="./AdminOrderDelete.ag?o_tradeNum=${i.o_tradeNum }"
												class="btn btn-danger btn-sm">삭제</a></li>
										</ul>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</section>

				<hr>
				<!-- admin order list End -->

				
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
									href="./AdminOrderList.ag?pageNum=${startPage-pageBlock}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
							</c:if>

							
								<c:forEach begin="${startPage }" end="${endPage}" var="i">
									<li class="page-item"><a class="page-link"
									href="./AdminOrderList.ag?pageNum=${i}" class="btn btn-primary btn">${i}</a></li>
								</c:forEach>

							
							<c:if test="${endPage < pageCount }">
									<li class="page-item"><a class="page-link"
								href="./AdminOrderList.ag?pageNum=${startPage+pageBlock}" ara-label="Next"> 
								<span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
				<!-- 페이징 처리 -->


			</div>
			<div class="col-0">
				<!-- right -->
			</div>
		</div>



	</div>
	<!-- container 끝 -->


	<!-- Page Add Section Begin -->
	<section class="page-add">
	<div class="container"></div>
	</section>
	<!-- Page Add Section End -->


	<!-- Footer Section Begin -->
	<jsp:include page="/footer/footer.jsp" />
	<!-- Footer Section End -->

</body>
</html>