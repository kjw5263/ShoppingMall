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
    <link rel="stylesheet" href="./css/topimage.css" type="text/css">
    

    <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
    <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
    <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
    <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
    
<title>?????? ?????? ?????? | JUST SKIN</title>
</head>
<body>
<!-- Header Section Begin -->
<jsp:include page="/header/header.jsp"/>
<!-- Header Section End -->

   <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>ADMIN PAGE<span>.</span></h2>
                        <h3>?????? ?????? ?????????</h3>
                        <p style="border: 1px solid #B0BCC2;"></p>
                    </div>
                </div>
                <div class="col-lg-8">
               </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->
    
	<!-- container ?????? -->	
	<div class="container-fluid">	
	
	<div class="row">
		<div class="col-0 text-center">
		<!-- left -->
		</div>
		
		<div class="col-12 text-center">
			
    <!-- admin goods list Begin -->

    <section class="admin_goods_list">
        <div class="container">
	        <table>
		    <tr>
		    <td>
			    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="collapse navbar-collapse">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link active" href="./AdminGoodsList.ag"><b>????????????</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./GoodsAdd.ag"><b>????????????</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminOrderList.ag"><b>????????????</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminMemberList.ag"><b>????????????</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminCouponList.ag"><b>????????????</b></a>
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
						<th colspan="12" style="text-align: center;"><b>?????? ?????? ?????????</b></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th width="6%">??????</th>
						<th width="12%">?????????</th>
						<th>??????</th>
						<th>??????</th>
						<th width="9%">?????????</th>
						<th width="9%">????????????</th>
						<th width="9%">????????????</th>
						<th width="7%">??????</th>
						<th width="7%">??????</th>
						<th width="7%">?????????</th>
						<th width="9%">??????/??????</th>
					</tr>
					
				<c:if test="${goodsList != null}">
					<c:forEach var="goodsList" items="${goodsList}">
					
					<tr>
						<td><b>${goodsList.cosNum}</b></td>
						<td>
							<img src="./admingoods/upload/${goodsList.cosImage.split(',')[0] }"
								 width="120px" height="120px">
						</td>
						<td>${goodsList.cosName}</td>
						
						<td>???<fmt:formatNumber value="${goodsList.cosPrice }" pattern="#,###"/></td>
						<td>${goodsList.cosBrand}</td>
						<td>${goodsList.cosCategory}</td>
						<td>${goodsList.cosSkinType}</td>
						<td>${goodsList.cosAmount}</td>
						<td>${goodsList.cosVolumn}ml</td>
						<td>${goodsList.cosWriteDate}</td>
						<td>
						<ul class="nav flex-column ">
						  <li class="nav-item mb-2">
							<a href="./AdminGoodsModify.ag?cosNum=${goodsList.cosNum}" class="btn btn-primary btn-sm">??????</a>	
						  </li>
						  <li class="nav-item mb-2">
							<a href="./AdminGoodsDelete.ag?cosNum=${goodsList.cosNum}" class="btn btn-danger btn-sm">??????</a>
						  </li>
						</ul>
						</td>
					</tr>   
					</c:forEach>
					</c:if>  	          
				</tbody>
			</table>	
        </div>
    </section>
    
    <hr>
    
				<!--????????? ??????  -->
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
									href="./AdminGoodsList.ag?pageNum=${startPage-pageBlock}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
							</c:if>

							
								<c:forEach begin="${startPage }" end="${endPage}" var="i">
									<li class="page-item"><a class="page-link"
									href="./AdminGoodsList.ag?pageNum=${i}" class="btn btn-primary btn">${i}</a></li>
								</c:forEach>

							
							<c:if test="${endPage < pageCount }">
									<li class="page-item"><a class="page-link"
								href="./AdminGoodsList.ag?pageNum=${startPage+pageBlock}" ara-label="Next"> 
								<span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
				<!-- ????????? ?????? -->
    
	 
    <!-- admin goods list End -->
			
		</div>
		<div class="col-0">	
		<!-- right -->
		</div>
	</div>
	
	
	
	</div>
	<!-- container ??? -->	

    
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