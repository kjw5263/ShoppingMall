<%@page import="com.goods.db.GoodsDTO"%>
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
		GoodsDTO dto = (GoodsDTO) request.getAttribute("dto"); 
	%>
	
	<form action="./AdminGoodsModifyAction.ag" method="post">
		<!-- 상품번호 저장 -->
		<input type="hidden" name="cosNum" value="<%=dto.getCosNum() %>">
		<table border="1">
			<thead>
				<tr>
					<th colspan="2">관리자 상품수정하기</th>
				</tr>
			</thead>	
			<tbody>
				 <tr>
		           <td>상품이름</td>
		           <td><input type="text" name="cosName" value="<%=dto.getCosName() %>"></td>           
		         </tr>
				 <tr>
		           <td>상품가격</td>
		           <td><input type="text" name="cosPrice" value="<%=dto.getCosPrice() %>"></td>           
		         </tr>
		         <tr>
					<td>브랜드</td>
					<td><input type="text" name="cosBrand" value="<%=dto.getCosBrand() %>"></td> 
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="cosCategory">
							<option value="스킨"
								<%if(dto.getCosCategory().equals("스킨")){ %>
								selected
								<%} %>
							>스킨</option>
							<option value="에센스"
								<%if(dto.getCosCategory().equals("에센스")){ %>
								selected
								<%} %>
							>에센스</option>
							<option value="로션"
								<%if(dto.getCosCategory().equals("로션")){ %>
								selected
								<%} %>							
							>로션</option>
							<option value="크림"
								<%if(dto.getCosCategory().equals("크림")){ %>
								selected	
								<%} %>						
							>크림</option>
							<option value="클렌징"
								<%if(dto.getCosCategory().equals("클렌징")){ %>
								selected
								<%} %>							
							>클렌징</option>
							<option value="마스크팩"
								<%if(dto.getCosCategory().equals("마스크팩")){ %>
								selected
								<%} %>							
							>마스크팩</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>피부타입</td>
					<td>
						<select name="cosSkinType">
							<option value="건성"
								<%if(dto.getCosCategory().equals("건성")){ %>
								selected		
								<%} %>					
							>건성</option>
							<option value="중성"
								<%if(dto.getCosCategory().equals("중성")){ %>
								selected
								<%} %>							
							>중성</option>
							<option value="지성"
								<%if(dto.getCosCategory().equals("지성")){ %>
								selected	
								<%} %>						
							>지성</option>
						</select>
					</td>
				</tr>								
				<tr>
					<td>피부고민</td>
					<td>
						<select name="cosTrouble">
							<option value="민감성"
								<%if(dto.getCosCategory().equals("민감성")){ %>
								selected
								<%} %>							
							>민감성</option>
							<option value="여드름"
								<%if(dto.getCosCategory().equals("여드름")){ %>
								selected
								<%} %>							
							>여드름</option>
							<option value="해당없음"
								<%if(dto.getCosCategory().equals("해당없음")){ %>
								selected
								<%} %>							
							>해당없음</option>
						</select>
					</td>
				</tr>	
				<tr>
		           <td>수량</td>
		           <td><input type="text" name="cosAmount" value="<%=dto.getCosAmount()%>"></td>           
		        </tr>
 				<tr>
		           <td>용량</td>
		           <td><input type="text" name="cosVolumn" value="<%=dto.getCosVolumn() %>"></td>           
		        </tr> 
				<tr>
		           <td>회사</td>
		           <td><input type="text" name="madeCompany" value="<%=dto.getMadeCompany() %>"></td>           
		        </tr>      
 				<tr> 
 		           <td>성분</td> 
 		           <td><input type="text" name="ingredient" value="<%=dto.getIngredient() %>"></td>            
 		        </tr>  
 				<tr> 
 		           <td>사용방법</td> 
 		           <td><input type="text" name="cosMethod" value="<%=dto.getCosMethod() %>"></td>            
 		        </tr> 
 				<tr> 
 		           <td>주의사항</td> 
 		           <td><input type="text" name="cosWarning" value="<%=dto.getCosWarning() %>"></td>            
 		        </tr> 

				         
				<tr>
		          <td colspan="2">
		            <input type="submit" value="상품수정">
		            <input type="reset" value="상품초기화">
		          </td>
		        </tr>     	             		          	         
			</tbody>		
		</table>
	</form>

</body>
</html>