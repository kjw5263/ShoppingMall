<%@page import="com.order.db.OrderDTO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
    <!-- admin order detail Begin -->
    
   <%
   	  List detailGoods = (List)request.getAttribute("detailGoods");
   	  List detailOrder = (List)request.getAttribute("detailOrder");
   %>
    <section class="admin_goods_write">
        <div class="container">
	        <table>
		    <tr>
		    <td>
			    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="collapse navbar-collapse">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminGoodsList.ag"><b>????????????</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./GoodsAdd.ag"><b>????????????</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link active" href="./AdminOrderList.ag"><b>????????????</b></a>
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
						<th colspan="6" style="text-align: left;">?????? ??????</th>
					</tr>
				</thead>
				<tbody>		     
					<tr>
						<th>?????????</th>
						<th>?????????</th>
						<th>????????????</th>
						<th>??????</th>
						<th>??????</th>
					</tr>
					
				 	<c:forEach var="i" items="${ detailGoods }" varStatus="deo">
				      <tr>  
						 <td><img src="./admingoods/upload/${i.cosImage.split(',')[0] }"
						 width="80" height="80"></td>	
				         <td>${detailOrder[deo.index].o_cosName }</td>
				         <td>${detailOrder[deo.index].o_cosAmount }</td>
				         <td>???<fmt:formatNumber value="${i.cosPrice }" pattern="#,###"/></td>
				         <td>???<fmt:formatNumber value="${i.cosPrice * detailOrder[deo.index].o_cosAmount }" pattern="#,###"/></td>
				         
				    </c:forEach>
				</tbody>
 			</table>
 			<br>
			<table class="table table-active" style="text-align: center; background-color: white;">
				<thead>				  
					<tr>
					  <th colspan="6" style="text-align: left;">????????? ??????</th>      
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>?????? ??????</th>
						<td>${detailOrder[0].receiverName }</td>
					</tr>
					<tr>
					    <th>?????????</th>
					    <td>${detailOrder[0].receiverTel }</td>
					</tr>
					<tr>
					    <th>???????????????</th>
					    <c:choose>
					        <c:when test="${detailOrder[0].receiverTel2 eq null}">
					        <td>??????</td>
					        </c:when>
						<c:otherwise>
						<td>${detailOrder[0].receiverTel2 }</td>
					    </c:otherwise>
					    </c:choose>					    
					    
					</tr>
					<tr>
					    <th>?????????</th>
					    <td>${detailOrder[0].receiverEmail }</td>
					</tr>
					<tr>
					    <th>??????</th>
					    <td>${detailOrder[0].receiverAddr }</td>
					</tr>	 
					<tr>
					    <th>????????????</th>
					    <c:choose>
					        <c:when test="${detailOrder[0].o_msg eq null}">
					       	<td>??????</td>
					        </c:when>
						<c:otherwise>
							<td>${detailOrder[0].o_msg }</td>
					    </c:otherwise>
					    </c:choose>
					</tr>     					      
				</tbody>	
			</table>
			<br>	
			<table class="table table-active" style="text-align: center; background-color: white;">
				<thead>     
					<th colspan="6" style="text-align: left;">?????? ??????</th>      
				</thead>
				<tbody>
					<tr>
						<th style="font-size: 20px;">????????????</th>
						<th style="font-size: 20px;">????????????</th>
						<th style="font-size: 20px;">??? ????????????</th>
					</tr>
					<tr>  		      
						<th style="font-size: 20px;">???<fmt:formatNumber value="${detailOrder[0].sumMoney }" pattern="#,###"/></th>
				        <th style="color: #0A82FF; font-size: 20px;"> 
				        	?????? : ${detailOrder[0].cpUseAmount }<br>
				        	????????? : ${detailOrder[0].ptUseAmount }
				        </th>
				        <th style="font-size: 20px;">???<fmt:formatNumber value="${detailOrder[0].payMoney }" pattern="#,###"/></th>
				    </tr> 
				</tbody>
			</table>
        </div>
        
    </section>
    <!-- admin order detail End -->
			
		</div>
		<div class="col-12">	
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