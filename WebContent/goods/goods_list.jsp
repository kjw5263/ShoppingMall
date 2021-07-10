<%@page import="com.goods.db.listDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.var.list.varlist"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JUST SKIN</title>

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
    <link rel="stylesheet" href="./css/goods_list.css" type="text/css">
    <script src="./js/chatbot.js" type="text/javascript"></script>

</head>


<body>

	
  <!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
  
  <%
	//테스트 버전 업2!
  	listDAO gdao = new listDAO();
  	
	List goodsList = (List)request.getAttribute("goodsList");
	List bestgoodsList = (List)request.getAttribute("bestgoodsList");

    String goHead = "./GoodsList.cos";
    varlist var = new varlist();
    String http[] = gdao.getCateGoodsList();
	String cat[] =  gdao.getbrandGoodsList();
    String skin[] =  gdao.getSkinGoodsList();
   	
    int size = goodsList.size();
    int bestsize = bestgoodsList.size();
  %>
	<section class="latest-products spad">
        <div class="container">
            <div class="product-filter">
                <div class="row">
                    <div class="col-lg-12 text-center">
						<div class="section-title">
							<div class="page-breadcrumb">
								<h2 style="margin-bottom:60px">
									PRODUCTS<span>.</span>
								</h2>
							</div>
						</div>

                        <ul class="product-controls">
                       	 	<li data-filter=".allgoods" id="all"><b>All</b></li>
                           
                           
                            <li data-filter=".베스트상품" id="best"><b>베스트상품</b></li>

                         
                            <%
                            for(int i = 0 ; i<http.length;i++){
                            %>
                            <li data-filter=".<%=http[i] %>" id="cate"><b><%=http[i] %></b></li>
                            <%} %>
                        </ul>
                        <hr> 
                        <ul class="product-controls">
                            <%
                            for(int i = 0 ; i<cat.length;i++){
                            	if(i==8){
                            %>
                            <br>
                            <%} else { %>
                            <li data-filter=".<%=cat[i] %>" id="cat"><b><%=cat[i] %></b></li>
                            <%} }%> 
                        </ul>                        
                        <hr>
                         <ul class="product-controls">
                            <%
                            for(int i = 0 ; i<skin.length;i++){
                            %>
                            <li data-filter=".<%=skin[i] %>" id="type"><b><%=skin[i] %></b></li>
                            <%} %>
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row" id="product-list">
            	<%for(int i = 0 ; i<size ;i++){ 
            	GoodsDTO dto = (GoodsDTO) goodsList.get(i);
            	%>
                <div class="col-lg-3 col-sm-6 mix all allgoods <%=dto.getCosBrand() %> <%=dto.getCosCategory() %> <%=dto.getCosSkinType() %>">
                    <div class="single-product-item" id="product">
                        <figure>
                            <a href="./GoodsDetail.cos?cosNum=<%=dto.getCosNum()%>"><img src="./admingoods/upload/<%=dto.getCosImage()%>" alt="" id="image"></a>
                        </figure>
                        <div class="product-text">
                        	<div>
								<div style="text-align: center;"><%=dto.getCosName()%></div>
                            	<div id="price">
                            	<fmt:formatNumber value="<%=dto.getCosPrice() %>" pattern="#,###"/>원</div>                	
                        		</div>
                            <img src="./img/add_basket.png" width="35px" height="30px" alt="" 
                            onclick="basketact(<%=dto.getCosNum()%>)"
                            style='cursor:pointer;'>
                            
                            <img src="./img/icons/heart1.png" width="40px" id="heart"
                            onclick="location.href='./insertLike.li?cosNum=<%=dto.getCosNum()%>'">
                        	</p>
                        </div>
                    </div>
                </div>
                <%} %>
                <%for(int i = 0 ; i<bestsize ;i++){ 
            	GoodsDTO dto = (GoodsDTO) bestgoodsList.get(i);
            	%>
                <div class="col-lg-3 col-sm-6 mix all 베스트상품">
                    <div class="single-product-item">
                        <figure>
                            <a href="./GoodsDetail.cos?cosNum=<%=dto.getCosNum()%>"><img src="./admingoods/upload/<%=dto.getCosImage()%>" alt=""></a>
                            <div class="p-status">best</div>
                        </figure>
                        <div class="product-text">
                        	<div>
								<div style="text-align: center;"><%=dto.getCosName()%></div>
                            	<div id="price">
                            	<fmt:formatNumber value="<%=dto.getCosPrice() %>" pattern="#,###"/>원</div>                	
                        	</div>
                            <img src="./img/add_basket.png" width="35px" height="30px" alt="" 
                            onclick="basketact(<%=dto.getCosNum()%>)"
                            style='cursor:pointer;'>
                            
                            <img src="./img/icons/heart1.png" width="40px" id="heart"
                            onclick="location.href='./insertLike.li?cosNum=<%=dto.getCosNum()%>'">
                        	</p>
                        </div>
                    </div>
                </div>
                <%} %>
                
            </div>
        </div>
    </section>
    
    <!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 100px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->
    
    <!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->


</body>

<script type="text/javascript">

function basketact(x) {
	var sure  = confirm("장바구니에 담으시겠습니까?");
	if(sure == true){
	 location.href = "./BasketAdd.ba?cosAmount=1&cosNum="+x;
	}else{
		
	}
	
}

</script>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/jquery.slicknav.js"></script>
<script src="./js/jquery.nice-select.min.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/mixitup.min.js"></script>
<script src="./js/main.js"></script>
