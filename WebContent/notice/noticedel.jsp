<%@page import="com.notice.db.NoticeDAO"%>
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

	<%
		// 전달정보 저장 - pageNum
		String noticeNum = (String) request.getParameter("noticeNum");
		String pageNum =  (String)request.getParameter("pageNum");
		String id =  (String)request.getParameter("userId");
		// 전달정보 저장 - 액션태그 (자바빈)- num,pass
		NoticeDAO noti = new NoticeDAO();
		int check1 = noti.deleteCheckNotice(id);
		
		
		 if(check1 == 1){
	     	
	      }else{
	    	  %>
		<script type="text/javascript">
			alert("삭제 권한이 없습니다");
			history.back();
		</script>
		<%
			}
		
	%>
	<form action="noticedelpro.nos?pageNum=<%=pageNum%>&noticeNum=<%=noticeNum%>"
		method="post">
		<input type="submit" value="삭제하기">
	</form>
	

 <!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
    

</body>
</html>