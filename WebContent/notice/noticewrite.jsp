<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.hidden { display:none;}
.shown {display:;} 
</style>
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Violet | Template</title>

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
</head>

<body>

  <!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->


	<h1>공지사항 쓰기</h1>
	<fieldset>
		<form action="noticewritepro.nos" method="post" enctype="multipart/form-data">

			제목 : <input type="text" name="title"><br> 
			중요도 : <input type="checkbox" value="1" id ="imp1" 
			 name = "imp2" onclick="pop()">
			
			<input type="checkbox" value="0" id ="imp2" name = "imp2" checked="checked" class = "hidden" ><br> 
			파일 : <input type="file" name="filename"><br> 
			내용 :
			<textarea rows="10" cols="30" name="content"></textarea>
			<hr>

			<input type="submit" value="글쓰기">
		</form>
	</fieldset>
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
</body>

<script type="text/javascript">
	
	function pop() {
		if(document.getElementById("imp2").checked==true){
			document.getElementById("imp2").checked=false;
		}else{
			document.getElementById("imp2").checked=true;
		}
	}

</script>

</html>