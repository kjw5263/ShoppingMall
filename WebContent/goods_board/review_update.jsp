<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.goods.db.GoodsDAO"%>
<%@ page import="com.goods.db.GoodsDTO" %>
<%@ page import="com.goods_board.db.GoodsReviewDTO" %>
<%@ page import="com.goods.db.GoodsDAO" %>
<%@ page import="com.goods_board.db.GoodsReviewDAO" %>
<%@ page import="java.util.List" %><%--
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

     /*레이아웃 외곽 너비 400px 제한*/
    /*body{*/
    /*  max-width: 480px;*/
    /*  margin: 0 auto; !* 화면 가운데로 *!*/
    /*  background-color: #fff;*/
    /*  height: 100%;*/
    /*  padding: 20px;*/
    /*  box-sizing: border-box;*/
    /*}*/
    /*textarea{*/
    /*  width: 100%;*/
    /*  padding: 10px;*/
    /*  box-sizing: border-box;*/
    /*}*/


  </style>
  <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
  <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
  <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="./css/style.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <%
      int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
  %>


</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Accessible rating example</title>
<link rel="stylesheet" type="text/css" href="./goods_board/style/starability-minified/starability-all.min.css"/>


<body>

<div style="margin-left: 90px; max-width: 480px;padding: 20px; height: 100%; margin-top: 30px">
<div style="font-size: 35px; float: left; width: 500px;margin-right: 10px ">별점과 리뷰를 수정해주세요</div>
<form  method="post" action="./ReviewUpdate.rev" target="./ReviewList.rev">

  <div style="margin-left: 80px; width: 300px;font-size: 30px;">별점을 선택해 주세요.</div>
  <fieldset class="starability-basic" id="rating" aria-required="false" style="margin-left: 120px;">
        <input type="hidden" name="reviewNum" value="<%= reviewNum%>">

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


  <div class="warning_msg" style="margin-left: 30px">5자 이상으로 작성해 주세요.</div>
  <label style="margin-left: 30px">
    <textarea rows="10"  class="form-control" cols="40" minlength="5" name="reviewContent" required>
    </textarea>
  </label>

  <br>
  <div style="margin-left: 30px">
  <button type="submit" class="btn btn-primary" onclick="window.close()">수정</button>
  <button type="reset" class="btn btn-danger" onclick="closePopup()">취소</button>
  <button class="btn btn-secondary" id="btn-upload">파일 등록</button>
  <input type="file" id="file1"  style="display: none" name="file1" onchange="changeValue()">
  </div>
</form>
</div>
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
<script>
  $(function () {

    $('#btn-upload').click(function (e) {

      e.preventDefault();
      $('#file1').click();
    });
  });
  function changeValue(obj){

    alert(obj.value);

  }
</script>

</body>

</html>
