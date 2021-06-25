<%@page import="com.notice.db.NoticeDAO"%>
<%@page import="com.notice.db.noticeDTO"%>
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
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		// DB에서 글번호에 해당하는 정보를 가져와서 출력

		// DAO 객체 생성

		// 글번호에 해당하는 정보를 가져오는 메서드 
		noticeDTO notit = new noticeDTO();
		NoticeDAO noti = new NoticeDAO();
		notit = noti.getNoticeData(num);
		//bdao.getBoard(num).getNum(); (x)
	%>

	<!-- Db에 처리해야하는 데이터 폼태그 안에 저장(hidden)
            "  안하는 경우  주소줄에 저장(url)
   -->
  <fieldset>
    <form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
     <input type="hidden" name="index" value="<%=notit.getNoticeNum()%>">
          
          
          제목 : <input type="text" name="title" value="<%=notit.getNoticeTitle() %>"><br>
          내용 : <textarea rows="10" cols="30" name="context"><%=notit.getNoticeContent() %></textarea>
       글쓴이 : <input type="text" name="id_name" value="<%=notit.getNoticeFile()%>" readonly> <br>
      <hr>
          
      <input type="submit" value="글 수정 하기">
    </form>
  </fieldset>
  

 <!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
    

</body>
</html>