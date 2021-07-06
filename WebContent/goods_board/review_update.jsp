<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.goods.db.GoodsDAO"%>
<%@ page import="com.goods.db.GoodsDTO" %>
<%@ page import="com.goods_board.db.GoodsReviewDTO" %>
<%@ page import="com.goods.db.GoodsDAO" %>
<%@ page import="com.goods_board.db.GoodsReviewDAO" %><%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2021/06/16
  Time: 9:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>

  <style>

    /* 레이아웃 외곽 너비 400px 제한*/
    body{
      max-width: 480px;
      margin: 0 auto; /* 화면 가운데로 */
      background-color: #fff;
      height: 100%;
      padding: 20px;
      box-sizing: border-box;
    }
    textarea{
      width: 100%;
      padding: 10px;
      box-sizing: border-box;
    }


  </style>
  <%
      int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
  %>


</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Accessible rating example</title>
<link rel="stylesheet" type="text/css" href="./goods_board/style/starability-minified/starability-all.min.css"/>


<body>


<h1>별점과 리뷰를 수정해주세요</h1>
<form  method="post" action="./ReviewUpdate.rev" target="./ReviewList.rev">
<%--  <img src="<%= gdto.getCosImage()%>" alt="상품...." style="width: 350px">--%>
  <fieldset class="starability-basic" id="rating" aria-required="false">
    <legend>별점을 선택해 주세요.</legend>
        <input type="hidden" name="reviewNum" value="<%= reviewNum%>"/>




    <input type="radio" id="no-rate" class="input-no-rate" name="rating" value="0" checked aria-label="No rating." />
    <input type="radio" id="rate1" name="rating" value="1" />
    <label for="rate1">1 star.</label>

    <input type="radio" id="rate2" name="rating" value="2" />
    <label for="rate2">2 stars.</label>

    <input type="radio" id="rate3" name="rating" value="3" />
    <label for="rate3">3 stars.</label>

    <input type="radio" id="rate4" name="rating" value="4" />
    <label for="rate4">4 stars.</label>

    <input type="radio" id="rate5" name="rating" value="5" />
    <label for="rate5">5 stars.</label>

    <span class="starability-focus-ring"></span>
  </fieldset>

<%--  <input type="hidden" name="cosNum" value="<%=grdto.getCosNum() %>">--%>

  <br>
  <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
  <label>
    <textarea rows="10" minlength="5" name="reviewContent" required></textarea>
  </label>


  <input type="submit" id="save" value="수정" onclick="window.close()">
  <input type="reset" value="취소" onclick="closePopup()">
  <input type="file" name="reviewImage">
</form>
<script type="text/javascript">
  function closePopup(){
    window.close();

  }
  function popupClose(form){
    form.target = opener.name;
    form.submit();
    if (opener !=null){
      opener.insert =null;
      self.close();
    }
  }
</script>
</body>

</html>
