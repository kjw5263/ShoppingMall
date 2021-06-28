<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page import="com.goods_board.db.GoodsReviewDTO" %>
<%@ page import="com.goods_board.db.GoodsReviewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.goods.db.GoodsDTO" %>
<%@ page import="com.goods_board.db.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
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
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">

    <link rel="stylesheet" href="goods_board/style/review_user_list.css">

</head>
<%
    ArrayList<GoodsReviewDTO> reviewList = (ArrayList<GoodsReviewDTO>) request.getAttribute("reviewList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int maxPage = pageInfo.getMaxPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    GoodsDTO dto = new GoodsDTO();


%>
<body>
<!-- header 시작 -->
<jsp:include page="/header/header.jsp" />
<!-- header 끝 -->

<div id="Container1">
    <div id="Contents1">

        <div class="mypage_head1">
            <h1 class="tit1">
                <a href="#">마이페이지</a>
            </h1>
            <div class="grd-box1">
            <div class="info1"></div>
            <div class="point-box1">
            </div>
            </div>
        </div>

        <div class="mypage-ix1">
            <div class="mypage-lnb1">
                <ul>
                    <li>
                        <h2>마이 쇼핑</h2>
                        <ul>
                            <li class="subMenu"><a href="">주문/배송조회</a></li>
                            <li class="subMenu"><a href="">취소/반품/교환내역</a></li>
                        </ul>
                        <ul class="line">
                            <li class="subMenu"><a href="">장바구니</a></li>
                            <li class="subMenu"><a href="">좋아요</a></li>
                            <li class="subMenu"><a href="">쿠폰</a></li>
                        </ul>
                    </li>
                    <li>
                        <h2>마이 활동</h2>
                        <ul>
                            <li class="subMenu"><a href="">1:1문의내역</a></li>
                            <li class="subMenu"><a href="">리뷰</a></li>
                            <li class="subMenu"><a href="">상품Q&A내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <h2>마이 정보</h2>
                        <ul>
                            <li class="subMenu"><a href="">회원정보수정</a></li>
                            <li class="ubMenu"><a href="">배송지/환불계좌</a></li>
                            <li class="subMenu"><a href="">회원탈퇴</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <%-- 마이페이지 본문 시작!!           --%>
            <div class="mypage-contents1">
                <div class="title-area1">
                    <h2 class="tit2">리뷰</h2>

                </div>
                <%
                    if(reviewList != null && listCount > 0){
                %>

                <%
                    for (int i = 0; i <reviewList.size() ; i++) {
                %>
                <form action="./reviewDelete.rev" method="post" id= "delete_action" >
                <ul class="comm1sTabs">
                    <li class="mypage_review">
                        <div class="table_list">
                            <div class="list_image">

                            </div>
                            <div class="list_cos_title">

                            </div>
                        </div>
                        <div class="table_bottom">
                            <div class="bottom_list">
                                <div class="bottom_content">
                                    <span class="rating_view_wrap">
                                        <%
                                            switch (reviewList.get(i).getRating()){
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
                                    </span>
                                    <p class="review_content_list">
                                        <%=reviewList.get(i).getReviewContent() %>
                                    </p>
                                </div>
                                <div class="button_view">
                                    <div>
                                        <button class="update_btn" type="button" onclick="location.href='reviewUpdateForm.rev?reviewNum=<%=reviewList.get(i).getReviewNum() %>'">수정하기</button>

                                    </div>
                                    <button type="submit" class="delete_btn" id="delete">
                                        <span class="btn_img">
                                            <img src="../goods_board/style/img/iconX.png" alt=""></span>
                                        <span class="blind">리뷰 삭제</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>

                <input type="hidden" name="reviewNum" value="<%=reviewList.get(i).getReviewNum() %>">
                    <% }%>
                </ul>
                </form>
                <section id="pageList" style="margin-left: 30%; margin-top: 300px">

                    <%if(nowPage<=1){ %>
                    [이전]

                    <%}else{ %>
                    <a href="reviewList.rev?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
                    <%} %>

                    <%for(int a=startPage;a<=endPage;a++){
                        if(a==nowPage){%>
                    [<%=a %>]
                    <%}else{ %>
                    <a id="#click" href="reviewList.rev?page=<%=a %>" onclick="focusOn()">[<%=a %>]
                    </a>&nbsp;
                    <%} %>
                    <%} %>

                    <%if(nowPage>=maxPage){ %>
                    [다음]
                    <%}else{ %>
                    <a href="reviewList.rev?page=<%=nowPage+1 %>">[다음]</a>
                    <%
                        }
                    %>
                </section>
                <%
                }
                else
                {
                %>
                <section id="emptyArea">등록된 글이 없습니다.</section>
                <%
                    }
                %>
            </div>
        </div>
    </div>


</div>



            <!-- footer 시작 -->
<div>
    <jsp:include page="/footer/footer.jsp" />
</div>

            <!-- footer 시작 -->

</body>
</html>
