<%@ page import="com.goods.db.GoodsDTO" %>
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
    <title>상세페이지</title>


</head>
<body>
<%
    // DB에서 가져온정보를 저장 (request 영역)
    //request.setAttribute("goods", gdao.getGoods(num));
    GoodsDTO dto = (GoodsDTO) request.getAttribute("goods");
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
<jsp:include page="/header/header.jsp"/>
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
                <img src="./img/add.jpg" alt="">
            </div>
        </div>
    </div>
</section>
<!-- Page Add Section End -->

<!-- Product Page Section Beign -->
<section class="product-page">
    <div class="container">
        <div class="product-control">
            <a href="#">Previous</a>
            <a href="#">Next</a>
        </div>
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
                    </div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo
                        viverra maecenas accumsan lacus vel facilisis.</p>
                    <ul class="tags">
                        <li><span>Category :</span> <%=dto.getCosCategory() %></li>
                        <li><span>Brand :</span> <%=dto.getCosBrand() %></li>
                    </ul>
                    <div class="product-quantity">
                        <div class="pro-qty">
                            <input type="text" value="1">
                        </div>
                    </div>
                    <a href="#" class="primary-btn pc-btn">장바구니</a>
                    <a href="#" class="primary-btn pc-btn"> 구매 </a>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Page Section End -->
        <h1>상세페이지</h1>
<!-- Related Product Section Begin -->

<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#id1">상세 이미지</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#id2">구매정보</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#id3">리뷰</a>
    </li>

</ul>
<div class="tab-content">
    <div class="tab-pane fade show active" id="id1"> <h3>상세설명</h3>
        <img src="<%=dto.getCosImage() %>" alt="이미지..."></div>
    <div class="tab-pane fade" id="id2">
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
    </div>
    <div class="tab-pane fade" id="id3">
        <h3>리뷰</h3>
        <button onclick="location.href='/reviewForm.rev'" class="btn-primary">글등록</button>
        <br>
        평점 별 글 갯수 <br>
        <table border="1">
            <tr>

                <td rowspan="2">작성자</td>
                <td>글</td>
            </tr>
            <tr>

                <td><textarea name="" id="" cols="30" rows="10" readonly>
                   글~~~~~
                </textarea></td>
            </tr>
        </table>
    </div>
</div>


<!-- Related Product Section End -->

<!-- Footer Section Begin -->
<jsp:include page="/footer/footer.jsp"/>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/jquery.slicknav.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/jquery.nice-select.min.js"></script>
<script src="./js/mixitup.min.js"></script>
<script src="./js/main.js"></script>




</body>
</html>
