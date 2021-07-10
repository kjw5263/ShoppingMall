<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>COUPON | JUST SKIN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="./img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="./css/util.css">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<!--===============================================================================================-->

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">

<!-- jquery 준비 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- jquery 준비 끝 -->

	<!-- Js Plugins -->
	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<script src="./js/jquery.slicknav.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/jquery.nice-select.min.js"></script>
	<script src="./js/mixitup.min.js"></script>
	<script src="./js/main.js"></script>


</head>
<body>

<script type="text/javascript">
/* java->jstl->html->js */

var id = "<c:out value='${sessionScope.userId}'/>";


$(document).ready(function () {
	
	$("#cp1").click(function(){
		
 		if(id==""){
			alert("로그인 하러가기");
			location.href="./MemberLogin.me";
		}else{
			$("#myModal").show();
		}

	});

	$("#modalExit").click(function(){
		
		$("#myModal").hide();
	});
	
	$("#modalExit2").click(function(){
		
		$("#myModal").hide();
	});
	
	$(".cpButton").click(function(){
		var cpNum =  $(this).val();
		//alert(cpNum);

		$.ajax({
			url : './couponDown.cp',
			type : 'post',
			data : {"couponNum" : cpNum, "userId" :id},
			success : function(data) {
				//alert(data);
				if (data == 1) {
					alert("쿠폰이 발급되었습니다!");
				}else if(data == 2) {
					alert("이미 발급 받은 쿠폰입니다!");
			 	}else{
					alert("발급 조건에 맞지 않습니다!");}
			},
				error : function() {
				}
			
		});
	});
	
});



</script>

	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->

	<!-- container 시작 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-2" style="background-color: #610B5E;"></div>
			<div class="col-8" align="center">
				<img alt="couponEventImg" src="./img/coupon/couponInfo.png">
			
			</div> 
			<div class="col-2" style="background-color: #610B5E;">
			</div>
		</div>
		<div class="row">
			<div class="col-2" style="background-color: #610B5E;"></div>
			<div class="col-8" align="center">
				<button class="btn btn-secondary" id="cp1">
					쿠폰 다운받기   
				</button>
	
			</div> 
			<div class="col-2" style="background-color: #610B5E;">
			</div>
		</div>
		
				<!-- The Modal -->
				<div class="modal" id="myModal" style="display: none;">
					<div class="modal-dialog" style="max-width: 50%; width: auto;">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">쿠폰받아랑@@@</h4>
								<button type="button" class="close" data-dismiss="modal" id="modalExit">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
							<!-- css 정리해야함 -->
								
								<div class="row" align="center">
									<div style="margin-bottom: 15px">
									 <input type="image" class="cpButton" src="./img/coupon/coupon1.png" width="50%" id="cpImg1" value="${couponList[2].couponNum }">
									</div>
								</div>	
								<div class="row" align="center">
									<div style="margin-bottom: 15px">
									 <input type="image" class="cpButton" src="./img/coupon/coupon2.png" width="50%" id="cpImg2" value="${couponList[3].couponNum }">
									</div>
								</div>	
								<div class="row" align="center">
									<div style="margin-bottom: 15px">
									 <input type="image" class="cpButton" src="./img/coupon/coupon3.png" width="50%" id="cpImg3" value="${couponList[4].couponNum }">
									</div>
								</div>		
									
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal" id="modalExit2">Close</button>
							</div>

						</div>
					</div>
				</div>
	</div>
	<!-- container 끝 -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 시작 -->



</body>
</html>