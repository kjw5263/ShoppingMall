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
  <meta charset="UTF-8">
  <meta name="description" content="Yoga Studio Template">
  <meta name="keywords" content="Yoga, unica, creative, html">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">


  <!-- Google Font -->
<%--  <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">--%>
<%--  <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"--%>
<%--        rel="stylesheet">--%>

  <!-- Css Styles -->
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

  <style>

    /*textarea{*/
    /*  width: 100%;*/
    /*  padding: 10px;*/
    /*  box-sizing: border-box;*/
    /*}*/


  </style>
  <script type="text/javascript">

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


  <%
    GoodsDAO gdao = new GoodsDAO();
    int cosNum = Integer.parseInt(request.getParameter("cosNum"));
    request.setAttribute("goods",gdao.getGoods(cosNum));
    GoodsDTO gdto = (GoodsDTO) request.getAttribute("goods");
  %>


</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰 등록</title>
<link rel="stylesheet" type="text/css" href="goods_board/style/starability-minified/starability-all.min.css"/>

<body>


<section class="section_area" style="max-width: 480px;margin-top:10px;background-color: #fff; height: 100%; padding: 10px; box-sizing: border-box; margin-bottom: 200px; margin-left: 24%;">
 <h1 style="margin-left: 0px">별점과 리뷰를 남겨주세요.</h1>
  <form  method="post" action="./ReviewFormPro.rev" enctype="multipart/form-data" target="ReviewFormPro.rev">
    <img src="./admingoods/upload/<%= gdto.getCosImage().split(",")[0]%>" alt="상품...." style="width: 250px; margin-left: 45px;">
        <fieldset class="starability-basic" id="rating" aria-required="false" style="margin-left: 100px">
          <br>
          별점을 선택해 주세요.
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

        <input type="hidden" name="cosNum" value="<%=gdto.getCosNum() %>">

    <br>


    <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
    <label>
      <textarea rows="10" minlength="5" name="reviewContent" required style="width: 350px; padding: 10px;box-sizing: border-box;"></textarea>
    </label>
    <br>
    <div>
      <button class="btn btn-primary" type="submit" onclick="window.close()">등록</button>
      <button class="btn badge-danger" type="reset" onclick="closePopup()">취소</button>
      <button class="btn btn-secondary" id="btn-upload">파일 등록</button>
    <input type="file" id="file1"  style="display: none" name="file1" onchange="changeValue()">

    </div>
  </form>

</section>
<%--<jsp:include page="/footer/footer.jsp"/>--%>

</body>
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
<%--<script src="./js/jquery-3.3.1.min.js"></script>--%>
<%--<script src="./js/bootstrap.min.js"></script>--%>
<%--<script src="./js/jquery.magnific-popup.min.js"></script>--%>
<%--<script src="./js/jquery.slicknav.js"></script>--%>
<%--<script src="./js/owl.carousel.min.js"></script>--%>
<%--<script src="./js/jquery.nice-select.min.js"></script>--%>
<%--<script src="./js/mixitup.min.js"></script>--%>
<%--<script src="./js/main.js"></script>--%>

</html>
