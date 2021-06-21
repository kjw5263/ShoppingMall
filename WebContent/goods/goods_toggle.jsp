<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2021/06/21
  Time: 12:23 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid" style="min-height: calc(5vh - 136px);">
    <!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
        <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
        <div class="panel panel-default">
            <div class="panel-heading" role="tab">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false">
                    무료배송
                </a>
            </div>
            <div id="collapse" class="panel-collapse collapse" role="tabpanel">
                <div class="panel-body">
                    최종 결제금액이 20,000원 이상이면 무료로 배송됩니다.
                </div>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading" role="tab">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
                    포인트 적립
                </a>
            </div>
            <div id="collapse1" class="panel-collapse collapse" role="tabpanel">
                <div class="panel-body">
                    포인트가 적립되지 않는 상품입니다.
                </div>
            </div>
        </div>
    </div>
</div>
</body>



</html>
