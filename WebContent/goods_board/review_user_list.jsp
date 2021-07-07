<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page import="com.goods_board.db.GoodsReviewDTO"%>
<%@ page import="com.goods_board.db.GoodsReviewDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.goods.db.GoodsDTO"%>
<%@ page import="com.goods_board.db.PageInfo"%>
<%@ page import="com.goods.db.GoodsDAO"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">
<script src="./js/chatbot.js" type="text/javascript"></script>
<link rel="stylesheet" href="goods_board/style/review_user_list.css">
<script type="text/javascript">
        function insertPopup(){
            var test = [];
            $("input[name=test_check]:checked").each(function (){
                test.push($(this).val());
            })
            if ($("input[name=test_check]:checked").is(":checked") ===true){
            console.log("체크된 값 total" +test);
            window.name="./ReviewList.rev"
            window.open("ReviewUpdateForm.rev?reviewNum="+test, "new",
                "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=500, left=0, top=0" );
            }else {
                alert("체크해주세요");
            }
        }
    </script>
</head>
<%
    ArrayList<GoodsReviewDTO> reviewList = (ArrayList<GoodsReviewDTO>) request.getAttribute("reviewList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int maxPage = pageInfo.getMaxPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    List cosList = (List) request.getAttribute("cosList");
    GoodsDTO dto = new GoodsDTO();
    GoodsDAO dso = new GoodsDAO();
%>
<body>
	<!-- header 시작 -->
	<jsp:include page="/header/header.jsp" />
	<!-- header 끝 -->

	<div id="Container1">
		<div id="Contents1">

			<!-- Page Add Section Begin -->
			<section class="page-add">
			<div class="row">
				<div class="col-lg-1"></div>

				<div class="col-lg-11">
					<div class="page-breadcrumb">
						<h2>
							MY PAGE<span>.</span>
						</h2>
					</div>
				</div>

			</div>
			</section>
			<!-- Page Add Section End -->


			<div class="mypage-ix1">
				<div class="mypage-lnb1">
								<ul>
									<li>
										<h2>나의 쇼핑</h2>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./getOrderList.or">주문/배송조회</a></li>
											<li class="subMenu"><a href="">취소/반품/교환내역</a></li>
										</ul>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./BasketList.ba">장바구니</a></li>
											<li class="subMenu"><a href="./getLike.li">좋아요</a></li>
											<li class="subMenu"><a href="./MyCoupon.cp">포인트 / 쿠폰</a></li>
										</ul>
									</li>
									<li class="line" style="list-style: none">
										<h2>나의 활동</h2>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./ReviewList.rev">리뷰</a></li>
											<li class="subMenu"><a href="./Usedate.ud">화장품 사용기한 조회</a></li>
										</ul>
									</li>
									<li class="line" style="list-style: none">
										<h2>나의 정보</h2>
										<ul style="list-style: none">
											<li class="subMenu"><a href="./MemberUpdateInfo.me">회원정보수정</a></li>
											<li class="subMenu"><a href="./MemberDelete.me">회원탈퇴</a></li>
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

					<form action="./ReviewDelete.rev" method="post" id="delete_action">


                <ul class="comm1sTabs">
                    <input type="radio" name="test_check" id="check_num" value="<%= reviewList.get(i).getReviewNum()%>" style="">

                    <li class="mypage_review">
                        <div class="table_list">
                            <div class="list_image">


										<%
                            dto= dso.getGoods(reviewList.get(i).getCosNum());

                        %>

                                <input type="hidden" name="cosNum" value="<%= reviewList.get(i).getCosNum()%>">
                                <img src="admingoods/upload/<%=dto.getCosImage().split(",")[0] %>" alt="">
                            </div>
                            <div class="list_cos_title">
                            <%=dto.getCosName() %>
                            </div>
                        </div>
                        <div class="table_bottom">
                            <div class="bottom_list">
                                <div class="bottom_content">
                                    <span class="rating_view_wrap">
                                        <%

                                            switch (reviewList.get(i).getRating()){
                                                case 5:
                                        %> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <%
                                    break;
                                case 4:
                            %> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <%       break;
                                case 3:
                            %> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <%        break;
                                case 2:
                            %> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <%         break;
                                case 1:
                            %> <i class="fa fa-star"></i> <%
                                        break;



                                }%>
											</span>
											<p class="review_content_list">
												<%=reviewList.get(i).getReviewContent() %>
											</p>
										</div>
										<div class="button_view">
											<div>
												<input type="hidden" name="reviewNum"
													value="<%=reviewList.get(i).getReviewNum() %>">
												<button class="update_btn" type="button"
													onclick="insertPopup()">수정하기</button>

											</div>
											<button type="submit" class="delete_btn" id="delete">
												<span class="btn_img"> <img
													src="./goods_board/style/img/iconX.png" alt=""></span> <span
													class="blind">리뷰 삭제</span>
											</button>
										</div>
									</div>
								</div>
							</li>



							<% }%>
						</ul>
					</form>
					<section id="pageList" style="margin-left: 30%; margin-top: 300px">

					<%if(nowPage<=1){ %> [이전] <%}else{ %> <a
						href="./ReviewList.rev?page=<%=nowPage-1 %>">[이전]</a>&nbsp; <%} %> <%for(int a=startPage;a<=endPage;a++){
                        if(a==nowPage){%> [<%=a %>] <%}else{ %> <a
						id="#click" href="./ReviewList.rev?page=<%=a %>"
						onclick="focusOn()">[<%=a %>]
					</a>&nbsp; <%} %> <%} %> <%if(nowPage>=maxPage){ %> [다음] <%}else{ %> <a
						href="./ReviewList.rev?page=<%=nowPage+1 %>">[다음]</a> <%
                        }
                    %> </section>
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
