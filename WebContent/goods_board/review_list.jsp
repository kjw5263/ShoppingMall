<%@ page import="goods_board.db.GoodsReviewDTO" %>
<%@ page import="goods.db.GoodsDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="goods_board.db.GoodsReviewDAO" %>
<%@ page import="goods_board.db.PageInfo" %><%--
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
</head>
    <%
    ArrayList<GoodsReviewDTO> reviewList = (ArrayList<GoodsReviewDTO>) request.getAttribute("reviewList");
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
    int listCount = pageInfo.getListCount();
    int nowPage = pageInfo.getPage();
    int maxPage = pageInfo.getMaxPage();
    int startPage = pageInfo.getStartPage();
    int endPage = pageInfo.getEndPage();
    %>
<body>


<%
    if(reviewList != null && listCount > 0){
%>

<%
    for(int i=0;i<reviewList.size();i++){

%>
<table border="1">
    <tr>
        <td rowspan="2"><%=reviewList.get(i).getUserid() %></td>
        <td>아이디</td>
    </tr>
    <tr>
        <td><%=reviewList.get(i).getReviewContent() %></td>
        <td></td>
    </tr>
</table>
<br>

<%--    <td><%=reviewList.get(i).getBOAR %></td>--%>
<%--    <td><%=reviewList.get(i).getBOARD_READCOUNT() %></td>--%>

<%} %>


    </section>

    <section id="pageList">
        <%if(nowPage<=1){ %>
        [이전]&nbsp;
        <%}else{ %>
        <a href="reviewList.rev?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
        <%} %>

        <%for(int a=startPage;a<=endPage;a++){
            if(a==nowPage){%>
        [<%=a %>]
        <%}else{ %>
        <a href="reviewList.rev?cosNum=2&page=<%=a %>">[<%=a %>]
        </a>&nbsp;
        <%} %>
        <%} %>

        <%if(nowPage>=maxPage){ %>
        [다음]
        <%}else{ %>
        <a href="reviewList.rev?page=<%=nowPage+1 %>">[다음]</a>
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
