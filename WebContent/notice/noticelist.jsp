<%@page import="com.var.list.varlist"%>
<%@page import="com.notice.db.noticeDTO"%>
<%@page import="com.notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.security.interfaces.RSAKey"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");

		NoticeDAO noti = new NoticeDAO();	
	
		varlist var = new varlist();
		String noticecontentLink = var.getnoticecontentListSt(); 
		int topcnt = noti.topnoticount();
		int cnt = noti.notiCount();
		int toppageSize = topcnt;
		int pageSize = 10 - toppageSize;
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1 ) * (pageSize  );
		int endRow = (currentPage) * (pageSize);
		
		int a = (Integer.parseInt(pageNum)-1)*pageSize;
	
		int b = pageSize; 
		List topnoticeList = noti.getTopNoticeList();
		List noticeList = noti.getNoticeList(a, b);
		
	
	%>
	<h2>
		게시판 글목록 [총 :
		<%=cnt%>개]
	</h2>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			

		</tr>

		<%
		
			for (int i = 0; i < topnoticeList.size(); i++) {
				
				noticeDTO notid = (noticeDTO) topnoticeList.get(i);
				
				
		%>
		<tr>
			<td><%=notid.getNoticeNum()%></td>
			<td>
			<a href="<%=noticecontentLink %><%=notid.getNoticeNum()%>&pageNum=<%=pageNum%>">
					<%=notid.getNoticeTitle()%></a>
			</td>
			

			<%
			
			
			%>
		</tr>
		<%
			}
		
			for (int i = 0; i < noticeList.size(); i++) {
				
				noticeDTO notid = (noticeDTO) noticeList.get(i);
				
				
		%>
		<tr>
			<td><%=notid.getNoticeNum()%></td>
			<td>
			<a href="<%=noticecontentLink %><%=notid.getNoticeNum()%>&pageNum=<%=pageNum%>">
					<%=notid.getNoticeTitle()%></a>
			</td>

			<%
			
			
			%>
		</tr>
		<%
			}
		%>
	</table>
	<hr>
	<%
    //////////////////////////////////////////////////////
    // 페이징 처리 - 하단부 페이지 링크
    if(cnt != 0){// 글이있을때 표시

    	//전체 페이지수 계산
    	// ex)  총 50개 -> 한페이지당 10개 출력, 5개
		//      총 57개 ->       "        , 6개
		int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1) ;
		
		// 한 화면에 보여줄 페이지 번호의 개수 (페이지 블럭)
		int pageBlock = 4;
		
		// 페이지 블럭의 시작페이지 번호 
		// ex)  1~10 페이지 : 1, 11~20페이지 : 11, 21~30페이지 : 21
        int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		
		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
    	
    	// 이전 (해당 페이지블럭의 첫번째 페이지 호출)
    	if(startPage >= pageBlock){
    		%>
	<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
	<%
    	}   	
    	
    	// 숫자  1....5
    	for(int i=startPage;i<=endPage;i++){
    		%>
	<a href="list.jsp?pageNum=<%=i%>">[<%=i %>]
	</a>
	<%    		
    	}
    	
    	// 다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
    	if(endPage < pageCount){
    		%>
	<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
	<%
    	}
    }
    //////////////////////////////////////////////////////
  %>
	

</body>
</html>