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
    
     <style type="text/css">
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:34px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
table {
    width: 80%;
    margin-left : 5%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
   th {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
  </style>
</head>
<body>

  <!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->


<%
		// 페이지 이동시 전달정보가 있으면(파라미터) 항상 가장먼저 저장
		// num,pageNum
		
	    String pageNum = request.getParameter("pageNum");
		String num = request.getParameter("noticeNum");
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
	<br>
<button onclick="location.href='http://localhost:8088/ShoppingMall/notice.nos'">목록으로</button>	
<br>
<table>
<tr>
<td><%=type %>
</td>
<td><%=notit.getNoticeTitle() %></td>
</tr>


<br>

 <tr>
        <td><b>첨부파일 </b> </td><td> 
        
        
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

<tr>
<td height="300px" colspan="2" style="position: static; top: 3px; left: 5px; text-align: inherit;"><%=notit.getNoticeContent() %></td>

</tr>
</table>
<br>
<br>
<button onclick="location.href='http://localhost:8088/ShoppingMall/noticedel.nos?noticeNum=<%=num%>&pageNum=<%=pageNum%>'">글삭제</button>
<button onclick="location.href='http://localhost:8088/ShoppingMall/noticeup.nos?noticeNum=<%=num%>&pageNum=<%=pageNum%>'">글수정</button>	
<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
    


</body>
</html>