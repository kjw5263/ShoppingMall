<%@page import="com.goods_board.db.PageInfo"%>
<%@page import="com.goods_board.db.GoodsReviewDTO"%>
<%@ page import="com.goods_board.db.GoodsReviewDTO" %>
<%@ page import="com.goods.db.GoodsDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.goods_board.db.GoodsReviewDAO" %>
<%@ page import="com.goods_board.db.PageInfo" %><%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2021/06/18
  Time: 7:27 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./goods_board/style/reviewList.css">
</head>
<%
    ArrayList<GoodsReviewDTO> reviewList = (ArrayList<GoodsReviewDTO>) request.getAttribute("reviewList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int maxPage = pageInfo.getMaxPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    int cosNum = Integer.parseInt(request.getParameter("cosNum"));

%>

<body>


<%
    if(reviewList != null && listCount > 0){
%>

<%
    for(int i=0;i<reviewList.size();i++){

%>

    <div class="review_list_wrap">
        <div class="info_test">
            <div class="user_fix">
                <div class="thum">
                    <span class="bg">
                    <img src="./goods_board/style/img/user.png" alt="...">
                    </span>
                </div>
                <p class="info_user">
                    <%=reviewList.get(i).getUserid() %>
                </p>
            </div>
        </div>
        <div class="review_cont">
            <div class="score_area">
                <span class="review_point">
                    <span class="point">
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
                </span>
                <span class="date">
                        <%=reviewList.get(i).getReviewdate() %>
                    </span>

            </div>
            <div class="poll_sample"></div>
            <div class="tet_inner">
                <span><%=reviewList.get(i).getReviewContent() %></span>
            </div>
            <div class="review_thum_type1">
                <ul class="inner_clrfix">
                    <li style="list-style: none">
                        <span class="img_size11" style="max-width: 100%">
                            <% if (reviewList.get(i).getReviewImage() !=null){%>
                            <img src="./goods_board/upload/<%=reviewList.get(i).getReviewImage()%>" alt="..">
                            <%}%>



                        </span>
                    </li>
                </ul>
            </div>
            <div class="recom_area">
                <form action="./ReviewLike.rev" method="post">
                <input type="hidden" name="reviewNum" value="<%=reviewList.get(i).getReviewNum() %>">
                <input type="hidden" name="cosNum" value="<%=reviewList.get(i).getCosNum() %>">
                <input type="hidden" name="userId" value="<%=reviewList.get(i).getUserid() %>">
                <button type="submit" class="btn_recom">
                    이 리뷰가 도움이 돼요!
                <span class="num1" style="padding: 0 15px;">
                  <img src="./goods_board/style/img/goodsIcon.png" alt="" style="width: 17px;">
                    <%=reviewList.get(i).getReviewUp() %>
                </span>
            </button>
                </form>
            </div>
        </div>
    </div>

<%} %>

    <section id="pageList" style="margin-left: 50%">

        <%if(nowPage<=1){ %>
        [이전]
        <%}else{ %>
        <a href="./GoodsDetail.cos?cosNum=<%= cosNum%>&page=<%=nowPage-1 %>">[이전]</a>&nbsp;

        <%} %>

        <%for(int a=startPage;a<=endPage;a++){
            if(a==nowPage){%>
        [<%=a %>]
        <%}else{ %>
        <a href="./GoodsDetail.cos?cosNum=<%=cosNum %>&page=<%=a %>" id="p2" >[<%=a %>]
        </a>&nbsp;
        <%} %>
        <%} %>

        <%if(nowPage>=maxPage){ %>
        [다음]
        <%}else{ %>
        <a href="./GoodsDetail.cos?cosNum=<%=cosNum%>&page=<%=nowPage+1 %>" id="next">[다음]</a>


        <%} %>

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

</body>
</html>
