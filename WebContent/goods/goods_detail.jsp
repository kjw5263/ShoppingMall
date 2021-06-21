<%@ page import="goods.db.GoodsDTO" %>
<%@ page import="goods_board.db.GoodsReviewDTO" %>
<%@ page import="goods_board.db.GoodsReviewDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="goods.db.GoodsDAO" %>
<%@ page import="goods_board.db.PageInfo" %>
<%@ page import="java.util.List" %>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--

  Created by IntelliJ IDEA.
  User: jun
  Date: 2021/06/16
  Time: 2:28 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <link rel="stylesheet" href="./violet-master/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./violet-master/css/style.css" type="text/css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <title>상세페이지</title>
    <script type="text/javascript">
        function isBasket() {
            //alert("장바구니 동작");
            if (document.gfr.amount.value == "") {
                alert(" 구매 수량을 입력하세요. ");
                document.gfr.amount.focus();
                return;
            }
            var result = confirm("장바구니에 저장 하시겠습니까?");

            if(result){
                document.gfr.action = "./BasketAdd.ba";
                document.gfr.submit();
            }
        }
    </script>

</head>
<body>
<%
    // DB에서 가져온정보를 저장 (request 영역)
//    request.setAttribute("goods", gdao.getGoods(num));

    ArrayList<GoodsReviewDTO> reviewList = (ArrayList<GoodsReviewDTO>) request.getAttribute("reviewList");
    GoodsDTO dto = (GoodsDTO) request.getAttribute("goods");
    ArrayList<GoodsReviewDTO> grdto = (GoodsReviewDTO) request.getAttribute("grdto");
//    GoodsReviewDTO grdto = request.getAttribute("grdto");
//    GoodsReviewDAO grdao = new GoodsReviewDAO();
//    int cnt = grdao.getReviewCount();

%>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Search model -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Header Section Begin -->
<jsp:include page="/violet-master/header/header.jsp"/>
<!-- Header Info Begin -->

<!-- Header Info End -->
<!-- Header End -->

<!-- Page Add Section Begin -->



<section class="page-add">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="page-breadcrumb">
                    <h2><%=dto.getCosCategory() %><span>.</span></h2>
                    <a href="#">홈</a>
                    <a href="#">??</a>
                    <a class="active" href="#">??</a>
                </div>
            </div>
            <div class="col-lg-8">
                <img src="img/add.jpg" alt="">
            </div>
        </div>
    </div>
</section>
<!-- Page Add Section End -->

<!-- Product Page Section Beign -->
<form action="" method="post" name="gfr">
<section class="product-page">
    <div class="container">
        <div class="product-control">
            <a href="#">Previous</a>
            <a href="#">Next</a>
        </div>
        <input type="hidden" name="cosNum" value="<%= dto.getCosNum()%>">
        <div class="row">
            <div class="col-lg-6">
                <div class="product-slider owl-carousel">
                    <div class="product-img">
                        <figure>
                            <img src="" alt="">
                            <div class="p-status">new</div>
                        </figure>
                    </div>
                    <div class="product-img">
                        <figure>
                            <img src="<%= dto.getCosImage()%>" alt="">
                            <div class="p-status">new</div>
                        </figure>
                    </div>
                </div>

            </div>
            <div class="col-lg-6">
                <div class="product-content">
                    <h2><%=dto.getCosName() %></h2>
                    <div class="pc-meta">
                        <h5><%= dto.getCosPrice()%>원</h5>
                        <div class="rating">
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
                            별 평점
                        </div>
                        <jsp:include page="goods_toggle.jsp"/>
                    </div>
                    <ul class="tags">
                        <li><span>Category :</span> <%=dto.getCosCategory() %></li>
                        <li><span>Brand :</span> <%=dto.getCosBrand() %></li>
                    </ul>
                    <div class="product-quantity">
                        <div class="pro-qty">
                            <input type="text" value="1" name="amount">
                        </div>
                    </div>
                    <a href="javascript:isBasket();" class="primary-btn pc-btn">장바구니</a>
                    <a href="" class="primary-btn pc-btn"> 구매 </a>

                </div>
            </div>
        </div>
    </div>
</section>
</form>
<!-- Product Page Section End -->


<div style='width:1400px;margin:0;margin-top:100px;'>
    <ul class="nav nav-tabs">
        <li class='active'><a href="#tabmenu_01" data-toggle="tab">탭메뉴1</a></li>
        <li><a href="#tabmenu_02" data-toggle="tab">탭메뉴2</a></li>
        <li><a href="#tabmenu_03" data-toggle="tab">탭메뉴3</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="tabmenu_01">
            <p>
                <img src="<%=dto.getCosImage() %>" alt="이미지...">
            </p>
        </div>
        <div class="tab-pane fade" id="tabmenu_02">
            <p>
            <table border="1">
                <tr>
                    <td>용량</td>
                    <td>
                        <%= dto.getCosVolumn()%>
                    </td>
                </tr>
                <tr>
                    <td>주요사양</td>
                    <td><%=dto.getIngredient() %></td>
                </tr>
                <tr>
                    <td>사용기간</td>
                    <td><%=dto.getUseDate() %></td>
                </tr>
                <tr>
                    <td>사용방법</td>
                    <td><%= dto.getCosMethod()%></td>
                </tr>
                <tr>
                    <td>사용시주의사항</td>
                    <td><%=dto.getCosWarning() %></td>
                </tr>
            </table>
            </p>
        </div>
        <div class="tab-pane fade" id="tabmenu_03">

            <h3>리뷰</h3>
            <button onclick="location.href='/reviewForm.rev?cosNum=<%=dto.getCosNum() %>'" class="btn-primary">글등록</button>
            <br>
            평점 별 글 갯수 <br>

            <%

                if (request.getAttribute("grdto")!=null){

            %>

            <%}%>
            <jsp:include page="/goods_board/review_list.jsp"/>


        </div>
    </div>
</div>


<!-- Related Product Section End -->

<!-- Footer Section Begin -->
<jsp:include page="/violet-master/footer/footer.jsp"/>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="./violet-master/js/jquery-3.3.1.min.js"></script>
<script src="./violet-master/js/bootstrap.min.js"></script>
<script src="./violet-master/js/jquery.magnific-popup.min.js"></script>
<script src="./violet-master/js/jquery.slicknav.js"></script>
<script src="./violet-master/js/owl.carousel.min.js"></script>
<script src="./violet-master/js/jquery.nice-select.min.js"></script>
<script src="./violet-master/js/mixitup.min.js"></script>
<script src="./violet-master/js/main.js"></script>




</body>
</html>
