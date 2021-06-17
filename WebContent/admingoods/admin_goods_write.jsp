<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="#" enctype="multipart/form-data">
		<table border="1">
			<thead>
				<tr>
					<th colspan="2">관리자 상품등록하기</th>
				</tr>
			</thead>
			<tbody>
				 <tr>
		           <td>상품이름</td>
		           <td><input type="text" name="cosName"></td>           
		         </tr>
				 <tr>
		           <td>상품가격</td>
		           <td><input type="text" name="cosPrice"></td>           
		         </tr>
		         <tr>
					<td>브랜드</td>
					<td><input type="text" name="cosBrand"></td> 
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="cosCategory">
							<option value="skin">스킨</option>
							<option value="skin">에센스</option>
							<option value="lotion">로션</option>
							<option value="cream">크림</option>
							<option value="cleansing">클렌징</option>
							<option value="maskpack">마스크팩</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>피부타입</td>
					<td>
						<select name="cosSkinType">
							<option value="drySkin">건성</option>
							<option value="combiSkin">중성</option>
							<option value="oilySkin">지성</option>
						</select>
					</td>
				</tr>								
				<tr>
					<td>피부고민</td>
					<td>
						<select name="cosTrouble">
							<option value="drySkin">민감성</option>
							<option value="acneSkin">여드름</option>
							<option value="normalSkin">해당없음</option>
						</select>
					</td>
				</tr>	
				<tr>
		           <td>수량</td>
		           <td><input type="text" name="cosAmount"></td>           
		        </tr>
 				<tr>
		           <td>용량</td>
		           <td><input type="text" name="cosVolumn"></td>           
		        </tr> 
				<tr>
		           <td>회사</td>
		           <td><input type="text" name="madeCompany"></td>           
		        </tr>      
				<tr>
		           <td>성분</td>
		           <td><textarea name="ingredient"></textarea></td>           
		        </tr> 
				<tr>
		           <td>사용방법</td>
		           <td><textarea name="cosMethod"></textarea></td>           
		        </tr>
				<tr>
		           <td>주의사항</td>
		           <td><textarea name="cosWarning"></textarea></td>           
		        </tr>
		         <tr>
		           <td>제품이미지1(메인)</td>
		           <td>
		              <input type="file" name="file1" accept="cosImage/*,.pdf">           
		           </td>
		         </tr>
		           <tr>
		           <td>제품이미지2</td>
		           <td>
		             <input type="file" name="file2">
		           </td>
		         </tr>
		           <tr>
		           <td>제품이미지3</td>
		           <td>
		             <input type="file" name="file3">
		           </td>
		         </tr>
		           <tr>
		           <td>제품이미지4</td>
		           <td>
		             <input type="file" name="file4">
		           </td>
		         </tr>		 
				         
				<tr>
		          <td colspan="2">
		            <input type="submit" value="상품등록">
		            <input type="reset" value="상품초기화">
		          </td>
		        </tr>     	             		          	         
			</tbody>
		</table>
	</form>
</body>
</html>