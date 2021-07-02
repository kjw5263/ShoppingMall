<%@page import="com.goods.db.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">

    <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
    <script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
    <script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
    <script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
    
<title>관리자 상품수정</title>
</head>
<body>
<!-- Header Section Begin -->
<jsp:include page="/header/header.jsp"/>
<!-- Header Section End -->

    <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->
    
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
	<div class="row">
		<div class="col-0 text-center">
		<!-- left -->
		</div>
		<div class="col-12 text-center">
			
    <!-- admin goods write Begin -->
    
	<%
		GoodsDTO dto = (GoodsDTO) request.getAttribute("dto"); 
	%>
	
    <section class="admin_goods_modify">
        <div class="container">
	        <table>
		    <tr>
		    <td>
			    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #b0bcc2;">
				  <div class="collapse navbar-collapse">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminGoodsList.ag" style="background-color: #899296; color:white;" ><b>상품목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./GoodsAdd.ag"><b>상품등록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminOrderList.ag"><b>주문목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminMemberList.ag"><b>회원목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminCouponList.ag"><b>쿠폰목록</b></a>
				      </li>			      
				    </ul>
				  </div>
				</nav>
		    </td>
		    </tr>
		    </table><br>
		<form method="post" action="./AdminGoodsModifyAction.ag">
			<!-- 상품번호 저장 -->
			<input type="hidden" name="cosNum" value="<%=dto.getCosNum() %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #b0bcc2; text-align: center; color: white;"><b>관리자 상품수정</b></th>
					</tr>
				</thead>
				<tbody>
				 <tr>
		           <th>상품이름</th>
		           <td><input type="text" name="cosName" value="<%=dto.getCosName() %>" class="form-control" required></td>           
		         </tr>
				 <tr>
		           <th>상품가격</th>
		           <td><input type="text" name="cosPrice" value="<%=dto.getCosPrice() %>" class="form-control" required></td>           
		         </tr>
		         <tr>
					<th>브랜드</th>
					<td><input type="text" name="cosBrand" value="<%=dto.getCosBrand() %>" class="form-control" required></td> 
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="cosCategory" class="form-control">
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
					<th>피부타입</th>
					<td>
						<select name="cosSkinType" class="form-control">
							<option value="건성"
								<%if(dto.getCosSkinType().equals("건성")){ %>
								selected
								<%} %>
							>건성</option>
							<option value="중성"
								<%if(dto.getCosSkinType().equals("중성")){ %>
								selected
								<%} %>
							>중성</option>
							<option value="지성"
								<%if(dto.getCosSkinType().equals("지성")){ %>
								selected
								<%} %>							
							>지성</option>
						</select>
					</td>
				</tr>								
				<tr>
					<th>피부고민</th>
					<td>
						<select name="cosTrouble" class="form-control" required>
							<option value="민감성"
								<%if(dto.getCosTrouble().equals("민감성")){ %>
								selected
								<%} %>							
							>민감성</option>
							<option value="여드름"
								<%if(dto.getCosTrouble().equals("여드름")){ %>
								selected
								<%} %>							
							>여드름</option>
							<option value="아토피"
								<%if(dto.getCosTrouble().equals("아토피")){ %>
								selected
								<%} %>							
							>아토피</option>							
							<option value="해당없음"
								<%if(dto.getCosTrouble().equals("해당없음")){ %>
								selected
								<%} %>							
							>해당없음</option>
						</select>
					</td>
				</tr>	
				<tr>
		           <th>수량</th>
		           <td><input type="text" name="cosAmount" value="<%=dto.getCosAmount()%>" class="form-control" required></td>           
		        </tr>
 				<tr>
		           <th>용량</th>
		           <td><input type="text" name="cosVolumn" value="<%=dto.getCosVolumn() %>" class="form-control" required></td>           
		        </tr> 
				<tr>
		           <th>회사</th>
		           <td><input type="text" name="madeCompany" value="<%=dto.getMadeCompany() %>" class="form-control" required></td>           
		        </tr>      
 				<tr> 
 		           <th>성분</th> 
 		           <td><textarea name="ingredient" rows="4" cols="25" class="form-control" required><%=dto.getIngredient() %></textarea></td>            
 		        </tr>  
 				<tr> 
 		           <th>사용방법</th> 
 		           <td><textarea name="cosMethod" rows="4" cols="25" class="form-control" required><%=dto.getCosMethod() %></textarea></td>            
 		        </tr> 
 				<tr> 
 		           <th>주의사항</th> 
 		           <td><textarea name="cosWarning" rows="4" cols="25" class="form-control" required><%=dto.getCosWarning() %></textarea></td>            
 		        </tr> 	      	          
				</tbody>
			</table>
			<table style="margin-left: auto; margin-right: auto;">
			<tr>
			    <td><input type="submit" value="상품수정" class="btn btn-secondary" style="background-color: #b0bcc2;"></td>  
		    </tr>
		    </table>		
		</form>
        </div>
    </section>
    <!-- admin goods write End -->
			
		</div>
		<div class="col-0">	
		<!-- right -->
		</div>
	</div>
	
	
	
	</div>
	<!-- container 끝 -->	

    
    <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->

	
<!-- Footer Section Begin -->
<jsp:include page="/footer/footer.jsp"/>
<!-- Footer Section End -->

</body>
</html>