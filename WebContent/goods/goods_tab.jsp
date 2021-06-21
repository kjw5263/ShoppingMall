<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2021/06/21
  Time: 3:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="style/style.css">
</head>
<body>
<section>
  <div class="tab-inner">
    <ul class="btn">
      <li data-alt="tab1" class="active">상세 페이지</li>
      <li data-alt="tab2">CSS3</li>
      <li data-alt="tab3">JQUERY</li>
      <li data-alt="tab4">JAVASCRIPT</li>
      <li data-alt="tab5">CSS FRAMEWORKS</li>
    </ul>
    <div class="tabs">
      <div id="tab1" class="active">
        <h2>HTML5</h2>
        <img src="images/platform-logo-01.png">
        <p>
          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae consequatur nemo cum eos repellat recusandae ullam natus cupiditate laboriosam, aliquid nisi aperiam laborum illo ut omnis saepe quam eveniet voluptate, eaque voluptatum? Nobis, libero est. Deleniti perferendis minima modi cum, ut mollitia ipsam unde totam laboriosam fuga sapiente qui autem ipsa repellendus, quis harum, illo explicabo quidem aut officia eaque? Libero doloremque officiis eos. Illum quis architecto porro nemo facilis itaque alias, fugiat possimus debitis iure a? Laborum consequatur esse natus reprehenderit quae velit ex repellendus. Excepturi, pariatur ad, sequi voluptatum quaerat placeat sed assumenda repudiandae quibusdam perferendis eum illo.
        </p>
      </div>
      <div id="tab2">
        <h2>CSS3</h2>
        <img src="images/platform-logo-02.png">
        <p>
          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae consequatur nemo cum eos repellat recusandae ullam natus cupiditate laboriosam, aliquid nisi aperiam laborum illo ut omnis saepe quam eveniet voluptate, eaque voluptatum? Nobis, libero est. Deleniti perferendis minima modi cum, ut mollitia ipsam unde totam laboriosam fuga sapiente qui autem ipsa repellendus, quis harum, illo explicabo quidem aut officia eaque? Libero doloremque officiis eos. Illum quis architecto porro nemo facilis itaque alias, fugiat possimus debitis iure a? Laborum consequatur esse natus reprehenderit quae velit ex repellendus. Excepturi, pariatur ad, sequi voluptatum quaerat placeat sed assumenda repudiandae quibusdam perferendis eum illo.
        </p>
      </div>
      <div id="tab3">
        <h2>JQUERY</h2>
        <img src="images/platform-logo-03.png">
        <p>
          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae consequatur nemo cum eos repellat recusandae ullam natus cupiditate laboriosam, aliquid nisi aperiam laborum illo ut omnis saepe quam eveniet voluptate, eaque voluptatum? Nobis, libero est. Deleniti perferendis minima modi cum, ut mollitia ipsam unde totam laboriosam fuga sapiente qui autem ipsa repellendus, quis harum, illo explicabo quidem aut officia eaque? Libero doloremque officiis eos. Illum quis architecto porro nemo facilis itaque alias, fugiat possimus debitis iure a? Laborum consequatur esse natus reprehenderit quae velit ex repellendus. Excepturi, pariatur ad, sequi voluptatum quaerat placeat sed assumenda repudiandae quibusdam perferendis eum illo.
        </p>
      </div>
      <div id="tab4">
        <h2>JAVASCRIPT</h2>
        <img src="images/platform-logo-04.png">
        <p>
          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae consequatur nemo cum eos repellat recusandae ullam natus cupiditate laboriosam, aliquid nisi aperiam laborum illo ut omnis saepe quam eveniet voluptate, eaque voluptatum? Nobis, libero est. Deleniti perferendis minima modi cum, ut mollitia ipsam unde totam laboriosam fuga sapiente qui autem ipsa repellendus, quis harum, illo explicabo quidem aut officia eaque? Libero doloremque officiis eos. Illum quis architecto porro nemo facilis itaque alias, fugiat possimus debitis iure a? Laborum consequatur esse natus reprehenderit quae velit ex repellendus. Excepturi, pariatur ad, sequi voluptatum quaerat placeat sed assumenda repudiandae quibusdam perferendis eum illo.
        </p>
      </div>
      <div id="tab5">
        <h2>CSS FRAMEWORKS</h2>
        <img src="images/platform-logo-05.png">
        <p>
          Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae consequatur nemo cum eos repellat recusandae ullam natus cupiditate laboriosam, aliquid nisi aperiam laborum illo ut omnis saepe quam eveniet voluptate, eaque voluptatum? Nobis, libero est. Deleniti perferendis minima modi cum, ut mollitia ipsam unde totam laboriosam fuga sapiente qui autem ipsa repellendus, quis harum, illo explicabo quidem aut officia eaque? Libero doloremque officiis eos. Illum quis architecto porro nemo facilis itaque alias, fugiat possimus debitis iure a? Laborum consequatur esse natus reprehenderit quae velit ex repellendus. Excepturi, pariatur ad, sequi voluptatum quaerat placeat sed assumenda repudiandae quibusdam perferendis eum illo.
        </p>
      </div>
    </div>
  </div>
</section>

<script>
  $('.btn li').click(function(){
    $(this).addClass('active')
    $(this).siblings().removeClass('active')

    var result = $(this).attr('data-alt')
    $('.tabs div').removeClass('active')
    $('#' + result).addClass('active')
  })
</script>
</body>
</html>
