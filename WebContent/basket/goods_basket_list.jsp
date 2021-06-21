<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
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
		// 전달된 정보를 저장
		List basketList = (List) request.getAttribute("basketList");
		List goodsList = (List) request.getAttribute("goodsList");
		
		// 장바구니 정보 출력
		// (장바구니 번호, 상품이미지, 상품명, 사이즈, 색상, 수량, 가격, 제거)
	%>
	
	

		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="12" style="background-color: #b0bcc2; text-align: center; color: white;"><b>장바구니 리스트</b></th>
				</tr>
			</thead>		
			<tbody>
				<tr>
					<td>번호</td>
					<td>이미지</td>
					<td>이름</td>
					<td>수량</td>
					<td>가격</td>
					<td>제거</td>
				</tr>
				
				<%for(int i=0;i<basketList.size();i++){
					BasketDTO bkDTO = (BasketDTO) basketList.get(i);
					GoodsDTO gDTO = (GoodsDTO) goodsList.get(i);
				%>
				<tr>
					<td><%=bkDTO.getBasketNum() %></td>
					<td>
						<img src="./admingoods/upload/<%=gDTO.getCosImage().split(",")[0] %>"
						width="50" height="50">
					</td>
					<td><%=gDTO.getCosName() %></td>
					<td><%=bkDTO.getBasketCosAmount() %></td>
					<td><%=bkDTO.getBasketCosAmount() %></td>
					<td><%=gDTO.getCosPrice() %></td>
					<td>
						<a href="./BasketDelete.ba?basketNum=<%=bkDTO.getBasketNum() %>">제거</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		
		<a href="#">[구매하기]</a>
		<a href="./GoodsList.cos">[계속 쇼핑하기]</a>

	

</body>
</html>