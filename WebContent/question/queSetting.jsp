<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>피부진단 | JUST SKIN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./img/icons/favicon.ico"/>
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
    <link rel="stylesheet" href="./css/question/Que_style.css" type="text/css">



	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->


</head>
<body>

	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
    
 	<!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>ADMIN PAGE<span>.</span></h2>
                        <h3>점수 세팅 페이지</h3>
						<p style="border: 1px solid #B0BCC2;"></p>
                        
                    </div>
                </div>
                <div class="col-lg-8">
               </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->
    	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
		<div class="row">
			<div class="col-2 text-center"></div>
			
			
			<div class="col-8">

				<!-- 글쓰기 폼 시작 -->
				<form action="./QueSettingAction.que" 
				method="post" id="fr" onsubmit="return check()">
						
						<table class="table" style="text-align: center;" id="score-table">
						<thead>
							<tr class="thead-light">
								<th colspan="16">피부타입</th>
							</tr>
							<tr>
								<th colspan="3" id="skinborder">건성</th>
								<th colspan="5" id="skinborder">중성</th>
								<th colspan="5" id="skinborder">복합성</th>
								<th colspan="3">지성</th>
							</tr>
						</thead>
						<tbody>
						<tr>
							<!--건성  -->
							<td id="score-txt"><p style="margin-top: 20%;"></p>
								 &nbsp;&nbsp;점수
							</td>
							<td><p style="margin-top: 20%;"></p>
							<b>&#60;</b>
							</td>
							<td id="skinborder" class="scorewid">
								<div>
								<input type="text" class="form-control"
								placeholder="점수" name="score1" id="score1"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"
								value="${qsdto.score1 }">
								</div>
							</td>
							<!--건성  -->
							<!--중성  -->
							<td class="scorewid">
								<div>
								<input type="text" class="form-control"
								placeholder="점수" name="score2" id="score2"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"
								value="${qsdto.score2 }">
								</div>
							</td>
							<td><p style="margin-top: 20%;"></p>
							<b>&#60;</b></td>
							<td id="score-txt"><p style="margin-top: 20%;"></p>
							점수
							</td>
							<td><p style="margin-top: 20%;"></p>
							<b>&#60;</b></td>
							<td id="skinborder" class="scorewid">
								<div>
								<input type="text" class="form-control"
								placeholder="점수" name="score3" id="score3"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"
								value="${qsdto.score3 }">
								</div>
							</td>
							<!--중성  -->
							
							<!--복합성  -->
							<td class="scorewid">
								<div>
								<input type="text" class="form-control"
								placeholder="점수" name="score4" id="score4"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"
								value="${qsdto.score4 }">
								</div>
							</td>
							<td><p style="margin-top: 20%;"></p>
							<b>&#60;</b></td>
							<td id="score-txt"><p style="margin-top: 20%;"></p>
							점수</td>
							<td><p style="margin-top: 20%;"></p>
							<b>&#60;</b></td>
							<td id="skinborder" class="scorewid"> 
								<div>
								<input type="text" class="form-control"
								placeholder="점수" name="score5" id="score5"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"
								value="${qsdto.score5 }" style="width: 50px">
								</div>
							</td>
							<!--복합성  -->
							<!--지성  -->
							<td id="score-txt" class="scorewid"><p style="margin-top: 20%;"></p>
							이외 점수</td>
							<!--지성  -->
						</tr>
						</tbody>
					</table>
				
					<hr>
					<div style="text-align: right;">
					<button type="submit" class="btn btn-primary mb-3">세팅하기</button>
					</div>
				</form>
				<!-- 글쓰기 폼 끝 -->
				
			</div>
			
			<div class="col-2">	
			</div>			
		</div>
		
	</div>
	<!-- container 끝 -->	

	<!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 120px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
</body>
</html>