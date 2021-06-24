<%@ page import="com.goods.db.GoodsDTO" %>
<%@ page import="com.goods_board.db.GoodsReviewDTO" %>
<%@ page import="com.goods_board.db.GoodsReviewDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.goods.db.GoodsDAO" %>
<%@ page import="com.goods_board.db.PageInfo" %>
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
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">

    <link rel="stylesheet" href="./goods/rating.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <title>상세페이지</title>
    <script type="text/javascript">
        function isBasket() {
            //alert("장바구니 동작");
            if (document.gfr.cosAmount.value == "") {
                alert(" 구매 수량을 입력하세요. ");
                document.gfr.cosAmount.focus();
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

    int rating=0;
    int avg = 0;
    if (reviewList.size() != 0){

        for (int i = 0; i < reviewList.size(); i++) {
            rating += reviewList.get(i).getRating();
        }
        avg = rating/reviewList.size();
    }

    System.out.println(avg);



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
                    <%-- <h2><%=dto.getCosCategory() %><span>.</span></h2> --%>
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
            <a href="GoodsDetail.cos?cosNum=<%=dto.getCosNum()-1%>">Previous</a>
            <a href="GoodsDetail.cos?cosNum=<%=dto.getCosNum()+1 %>">Next</a>
        </div>
        <input type="hidden" name="cosNum" value="<%= dto.getCosNum()%>">
        <div class="row">
            <div class="col-lg-6">
                <div>
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
                <div class="product-content" style="padding: 0">
                    <h2 style="margin-bottom: 20px"><%=dto.getCosName() %></h2>

                    <div class="pc-meta">
                        <h5><%= dto.getCosPrice()%>원</h5>

                        <div class="rating">
                            <%
                                switch (avg){
                                    case 5:
                            %>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <%
                                    break;
                                case 4:
                            %>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>


                            <%       break;
                                case 3:
                            %>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>


                            <%        break;
                                case 2:
                            %>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <%         break;
                                case 1:
                            %>
                            <i class="fa fa-star"></i>


                            <%
                                        break;



                            }%>
                            리뷰(<%=reviewList.size()%>)
                        </div>

                       <br> <br>
                        <div style="margin-left: 0px">
                            <jsp:include page="goods_toggle.jsp"/>
                        </div>

                    </div>

                    <ul class="tags">
                        <li><span>Category :</span> <%=dto.getCosCategory() %></li>
                        <li><span>Brand :</span> <%=dto.getCosBrand() %></li>
                    </ul>
                    <div class="product-quantity">
                        <div class="pro-qty">
                            <input type="number" name="cosAmount" value="1">
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
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>

<div>
    <ul class="nav nav-tabs">
        <li class='active'><a href="#tabmenu_01" data-toggle="tab">상세이미지</a></li>
        <li><a href="#tabmenu_02" data-toggle="tab">사용설명</a></li>
        <li><a href="#tabmenu_03" data-toggle="tab">리뷰(<%=reviewList.size() %>)</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="tabmenu_01">
            <p style="margin: 100px 0 200px 400px">
                <img src="<%=dto.getCosImage() %>" alt="이미지...">
            </p>
        </div>
        <div class="tab-pane fade" id="tabmenu_02">

            <table border="1" style="margin: 100px 50px 200px 50px; height: 500px; text-align: center">
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
        <div class="tab-pane fade" id="tabmenu_03">

            <h3>리뷰</h3>
            <div class="wrap_area_view" style="width: 80%; margin: 50px 50px 100px 150px;">
             <div class="review_rating_area">
                <div class="inner">
                    <div class="grade_img">

                    </div>
                    <div class="start_area">
                        <p class="total">
                            총
                        <em><%=reviewList.size()%></em>
                            건
                        </p>
                        <p class="num">
                            <strong><%=avg%></strong>
                            <span>점</span>
                        </p>
                        <div class="star_list">
                            <div class="rating">
                                <%
                                    switch (avg){
                                        case 5:
                                %>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>

                                <%
                                        break;
                                    case 4:
                                %>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>


                                <%       break;
                                    case 3:
                                %>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>


                                <%        break;
                                    case 2:
                                %>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>

                                <%         break;
                                    case 1:
                                %>
                                <i class="fa fa-star"></i>


                                <%
                                            break;

                                    }
                                %>
                            </div>
                        </div>
                    </div>

                    <div class="goods_name">
                        <div class="name_list">
                            <%= dto.getCosName()%>
                        </div>

                    </div>
                    <div class="write_info">
                        <dl>
                            <dt>리뷰를 써보세요</dt>
                        </dl>
                        <p class="alignCenter">
                            <button class="btn-primary" onclick="location.href='/reviewForm.rev?cosNum=<%=dto.getCosNum() %>'" >글등록</button>
                        </p>
                    </div>
                </div>
            </div>
            </div>


            <jsp:include page="/goods_board/review_list.jsp"/>
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
