<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="java.util.List"%>
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
    
<title>장바구니</title>
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
			
    <!-- goods basket list start -->
    
	<%
		// 전달된 정보를 저장
		List basketList = (List) request.getAttribute("basketList");
		List goodsList = (List) request.getAttribute("goodsList");
	%>
    
    <section class="admin_goods_list">
        <div class="container">
        <form name="form" method="post" action="./BasketList.ba">
	        <div align="left">
			    <input type="submit" value="선택삭제" onclick="javascript: form.action='BasketDelete.ba'" class="btn btn-secondary"/>
		    </div><hr>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					
					<tr>
						<th style="background-color: #b0bcc2; text-align: center; color: white;">
						<input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">
						&nbsp;모두 선택</label>
						<script>
							$("#allCheck").click(function(){
								var chk = $("#allCheck").prop("checked");
								if(chk){
									$(".del-id").prop("checked", true);
								} else {
									$(".del-id").prop("checked", false);
								}
							});
						</script>						
						</th>
						<th colspan="12" style="background-color: #b0bcc2; text-align: center; color: white;"></th>
					</tr>
				</thead>
				<tbody>
				<tr style="text-align: center; color: #7b7b7b;">
					<th>선택</th>
					<th>이미지</th>
					<th>이름</th>
					<th>가격</th>
					<th colspan="4">수량</th>
				</tr>
				
				<%for(int i=0;i<basketList.size();i++){
					BasketDTO bkDTO = (BasketDTO) basketList.get(i);
					GoodsDTO gDTO = (GoodsDTO) goodsList.get(i);
				%>
				
				<tr>
					<td>
						<input type="checkbox" name="del-id" class="del-id" value="<%=bkDTO.getBasketNum() %>"/>
 							<script>
 							 $(".del-id").click(function(){
 							  $("#allCheck").prop("checked", false);
 							 });
 							</script>			
					</td>
					<td>
						<input type="hidden" name="bkNum" class="bkNum" value="<%=bkDTO.getBasketNum() %>"/>
						<img src="./admingoods/upload/<%=gDTO.getCosImage().split(",")[0] %>"
						width="80" height="80">
					</td>
					<td><%=gDTO.getCosName() %></td>
					<td><%=gDTO.getCosPrice() %></td>
					<td><input type=hidden name="sell_price" value="<%=gDTO.getCosPrice() %>"><td>
					<form name="form" method="post" action="./BasketList.ba">
					<input type="hidden" name="bkNum" class="bkNum" value="<%=bkDTO.getBasketNum() %>"/>
					<td>
						<ul class="nav flex-column " style="width: 100px; margin-left: 0; margin-right: auto;">
						  <li class="nav-item mb-2">
							<input type="number" name="amount" min="1" style="width:45px" value="<%=bkDTO.getBasketCosAmount()%>">	
						  </li>
						  <li class="nav-item mb-2">
 						  <input type="submit" value="수정" class="btn btn-secondary btn-sm"
						  	onclick="javascript: form.action='BasketModify.ba'"/> 
						  </li>
						</ul>
					</td>
					</form>
				</tr>
				<%} %>
				</tbody>
			</table>
				<hr>
				<%
				int count = 0;
				int hap = 0;
				int mul = 0;
				for(int i=0; i<basketList.size();i++){
					BasketDTO bkDTO = (BasketDTO) basketList.get(i);
					GoodsDTO gDTO = (GoodsDTO) goodsList.get(i);
					mul = gDTO.getCosPrice() * bkDTO.getBasketCosAmount();
					count += bkDTO.getBasketCosAmount();
					hap += mul;
				} %>
				<p>
				<div align="right">
					<button class="btn btn-secondary" onclick="#'">주문하기</button>
					<button class="btn btn-secondary" onclick="javascript: form.action='GoodsList.cos'">계속 쇼핑하기</button>
				</div>
				</p>
				<div align="right">
					<b style="text-align: right; font-size: 20px;">상품갯수 : <%=count %></b><br>
					<b style="text-align: right; color: #0A82FF; font-size: 20px;">합계금액 : <%=hap %></b>
		        </div>
        	</form>
        </div>
    </section>
    
    <!-- goods basket list End -->
			
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