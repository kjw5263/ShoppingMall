
<%@page import="com.goods.db.listDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.var.list.varlist"%>
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
<style type="text/css">
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:34px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}




	#one{
	  border-right:	1px solid #444444;
	}
	#one:last-child {
	border-right: 0;
	}
table {
	margin-top : 10px;
	margin-bottom : 10px;
	margin-left : 50px;
    border-collapse: collapse;
}
table td {
    border:  0px solid black;
}
table tr {
    border-top: 0;
}
table tr {
    border-bottom: 0;
}
table tr td {
    border-left: 10;
}
table tr td {
    
}


</style>

</head>

<body>

	
  <!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
  
  <%
//테스트 버전 업2!
  	listDAO gdao = new listDAO();
  	
    List goodsList = (List)request.getAttribute("goodsList");
    

    String goHead = "./GoodsList.cos";
    varlist var = new varlist();
    String http[][] = var.getHttp();
	String cat[][] = var.getCat();	
    String skin[][] = var.getSkin(); 
    int size = goodsList.size();
  %>
	<section class="latest-products spad">
        <div class="container">
            <div class="product-filter">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="section-title">
                            <h2>Latest Products</h2>
                        </div>
                        <ul class="product-controls">
                            <li data-filter="*">All</li>
                            <%
                            for(int i = 1 ; i<http.length;i++){
                            	
                            %>
                            <li data-filter=".<%=http[i][1] %>"><%=http[i][1] %></li>
                            <%} %>
                            
                        </ul>
                        <br>
                         <ul class="product-controls">
                            <li data-filter="*">All</li>
                            <%
                            for(int i = 1 ; i<cat.length;i++){
                            	
                            %>
                            <li data-filter=".<%=cat[i][1] %>"><%=cat[i][1] %></li>
                            <%} %>
                            
                        </ul>
                         <br>
                         <ul class="product-controls">
                            <li data-filter="*">All</li>
                            <%
                            for(int i = 1 ; i<skin.length;i++){
                            	
                            %>
                            <li data-filter=".<%=skin[i][1] %>"><%=skin[i][1] %></li>
                            <%} %>
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row" id="product-list">
            	<%for(int i = 0 ; i<size ;i++){ 
            	GoodsDTO dto = (GoodsDTO) goodsList.get(i);
            	%>
                <div class="col-lg-3 col-sm-6 mix all <%=dto.getCosBrand() %> <%=dto.getCosCategory() %> <%=dto.getCosSkinType() %>">
                    <div class="single-product-item">
                        <figure>
                            <a href="./GoodsDetail.cos?cosNum=<%=dto.getCosNum()%>"><img src="<%=dto.getCosImage()%>" alt=""></a>
                            <div class="p-status">new</div>
                        </figure>
                        <div class="product-text">
                            <h6><%=dto.getCosName()%></h6>
                            <p><%=dto.getCosPrice() %>원  </p>
                            <button onclick="location.href='http://localhost:8088/
	           		ShoppingMall/Goods_basketpro.cos?cosAmount=1&cosNum=<%=dto.getCosNum()%> '">장바구니 담기</button>	
                        </div>
                    </div>
                </div>
                <%} %>
                
            </div>
        </div>
    </section>
    <!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
    
  
  
  

</body>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/jquery.slicknav.js"></script>
<script src="./js/jquery.nice-select.min.js">
<script src="./js/owl.carousel.min.js"></script></script>
<script src="./js/mixitup.min.js"></script>
<script src="./js/main.js"></script>
<script type="text/javascript">
