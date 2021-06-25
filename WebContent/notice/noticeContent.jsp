<%@page import="com.notice.db.noticeDTO"%>
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
		// 페이지 이동시 전달정보가 있으면(파라미터) 항상 가장먼저 저장
		// num,pageNum
		
	    String pageNum = request.getParameter("pageNum");
		
	    // BoardDAO 객체 생성
	    
	    noticeDTO notit = (noticeDTO)request.getAttribute("noti");
		// DB에서 글번호(num)에 해당하 글정보를 모두 가져와서 출력
		
		String type;
		if(notit.getNoticeType()==1){
			type = "공지";
		}else{
			type = "이벤트";
		}
		
	%> 

<table>
<tr>
<td><%=type %>
</td>
<td><%=notit.getNoticeTitle() %></td>
</tr>
</table>

<br>
 <tr>
        <td><b>첨부파일</b> :</td>
        
        
        <%
        if (notit.getNoticeFile() == null){
        	%>
        	첨부파일 없음
        	<%
        	
        }else{
        %><a href="./notice/filedown.jsp?filename=<%=notit.getNoticeFile()%>"><%=notit.getNoticeRealFileName() %></a> <%
        }
        
        %>
         
         </td>
      </tr>
<br>
<br>


<table>
<tr>
<td><%=notit.getNoticeContent() %></td>

</tr>
</table>
<button onclick="location.href='http://localhost:8088/ShoppingMall/noticedel.nos'">글삭제</button>
<button onclick="location.href='http://localhost:8088/ShoppingMall/noticeup.nos'">글수정</button>	
<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
    


</body>
</html>