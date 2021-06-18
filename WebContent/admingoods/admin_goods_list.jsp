<%@page import="com.admin.goods.db.AdminGoodsDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> 등록 상품 목록 </h2>
	
	<h3><a href="./GoodsAdd.ag">상품 등록하기</a></h3>
	
	<%
		// AdminGoodsDAO 객체 생성
		AdminGoodsDAO adao = new AdminGoodsDAO();
		
		// 디비에 글의 수를 계산하는 메서드 생성 -> 호출
		// getBoardCount();
		int cnt = adao.getGoodsCount();
		
		////////////////////////////////////////////////////
		//게시판 페이징 처리 : DB에서 원하는 만큼만 상품 가져오기
		
		// 한페이지당 보여줄 상품의 개수
		int pageSize = 10;
		
		// 현페이지가 몇페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 페이지별 시작행 계산하기
		// 1p -> 1번, 2p -> 11번,3p->21번, ....=>일반화
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝행 계산하기
		// 1p->10번, 2p->20번, 3p->30번 ....=> 일반화
		int endRow = currentPage*pageSize;
		
		// 디비에 저장된 모든 글중에서 원하는 만큼만 가져오기(페이지 사이즈)
		ArrayList<GoodsDTO> goodsList = adao.getGoodsList(startRow,pageSize);
		
		
	%>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이미지</td>
			<td>이름</td>
			<td>가격</td>
			<td>브랜드</td>
			<td>카테고리</td>
			<td>피부타입</td>
			<td>피부고민</td>
			<td>재고</td>
			<td>용량</td>
			<td>등록일</td>
			<td>수정/삭제</td>
		</tr>
		
		<% for(int i=0;i<goodsList.size();i++){
			GoodsDTO dto = (GoodsDTO)goodsList.get(i);
		%>
		
		<tr>
			<td><%=dto.getCosNum() %></td>
			<td>
				<img src="./upload/<%=dto.getCosImage().split(",")[0] %>"
					 width="100" height="100">
			</td>
			<td><%=dto.getCosName() %></td>
			<td><%=dto.getCosPrice() %></td>
			<td><%=dto.getCosBrand() %></td>
			<td><%=dto.getCosCategory() %></td>
			<td><%=dto.getCosSkinType() %></td>
			<td><%=dto.getCosTrouble() %></td>
			<td><%=dto.getCosAmount() %></td>
			<td><%=dto.getCosVolumn() %></td>
			<td><%=dto.getCosWriteDate() %></td>
			<td>
				<a href="./AdminGoodsModify.ag?cosNum=<%=dto.getCosNum()%>">수정</a>
	                /
				<a href="./AdminGoodsDelete.ag?cosNum=<%=dto.getCosNum()%>">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
	
  <hr>
  <%
    //////////////////////////////////////////////////////
    // 페이징 처리 - 하단부 페이지 링크
    if(cnt != 0){// 글이있을때 표시

    	//전체 페이지수 계산
    	// ex)  총 50개 -> 한페이지당 10개 출력, 5개
		//      총 57개 ->       "        , 6개
		int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1);
		
		// 한 화면에 보여줄 페이지 번호의 개수 (페이지 블럭)
		int pageBlock = 2;
		
		// 페이지 블럭의 시작페이지 번호 
		// ex)  1~10 페이지 : 1, 11~20페이지 : 11, 21~30페이지 : 21
        int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
		
		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
    	
    	// 이전 (해당 페이지블럭의 첫번째 페이지 호출)
    	if(startPage > pageBlock){
    		%>
    		<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
    		<%
    	}   	
    	
    	// 숫자  1....5
    	for(int i=startPage;i<=endPage;i++){
    		%>
    		    <a href="./AdminGoodsList.ag?pageNum=<%=i%>">[<%=i %>]</a> 
    		<%    		
    	}
    	
    	// 다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
    	if(endPage < pageCount){
    		%>
    		<a href="./AdminGoodsList.ag?pageNum=<%=startPage+pageBlock%>">[다음]</a>
    		<%
    	}
    	
    	
    	
    	
    }
    //////////////////////////////////////////////////////
  %>	

</body>
</html>