<%@page import="com.goods.db.listDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.var.list.varlist"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>PRODUCT | JUST SKIN</title>

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
        <link rel="stylesheet" href="./css/goods_searchre.css" type="text/css">
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
                    <div class="page-breadcrumb">
                        <h2><b id="input1">'${paka}'</b> 검색결과</h2>
      					<hr> 
                    </div>
                    </div>
                </div>
            </div>
            
            <%if(size == 0){%>
		        <div class="container">
		        <section class="page-add">
		        <p><img src="./img/result.png" alt="result" id="result"></p><br>
		        <p id="coment1">검색하신 <b id="input2">'${paka}'</b>에 대한 검색 결과가 없습니다.</p>
		        
		        <div class="guide">
		        	<p id="re1"><img src="./img/search.png" alt="search" id="search">&nbsp;&nbsp;다시 검색해 보세요</p>
		        	<ul id="re2">
		        		<li>검색어의 철자가 정확한지 확인해보세요.</li>
		        		<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해보세요.</li>
		        		<li>검색어의 띄어쓰기를 다르게 해보세요.</li>
		        	</ul>
		        </div>
		        <div class="container">
		        </div>
		    	</section>
		        </div>
            <%}else{ %>
            
            <div class="row" id="product-list">
            	<%for(int i = 0 ; i<size ;i++){ 
            	GoodsDTO dto = (GoodsDTO) goodsList.get(i);
            	%>
                <div class="col-lg-3 col-sm-6 mix all allgoods <%=dto.getCosBrand() %> <%=dto.getCosCategory() %> <%=dto.getCosSkinType() %>">
                    <div class="single-product-item" id="product">
                        <figure>
                            <a href="./GoodsDetail.cos?cosNum=<%=dto.getCosNum()%>">
                            <img src="./admingoods/upload/<%=dto.getCosImage()%>" alt="" id="image"></a>
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
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
            
            <%} %>
            
            
        </div>
    </section>
      <!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 70px;">
        <div class="container">
        </div>
    </section>
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
