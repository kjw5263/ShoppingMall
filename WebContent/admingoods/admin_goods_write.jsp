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
    
<title>관리자 상품등록</title>

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
    <section class="admin_goods_write">
        <div class="container">
	        <table>
		    <tr>
		    <td>
			    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				  <div class="collapse navbar-collapse">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminGoodsList.ag"><b>상품목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link active" href="./GoodsAdd.ag"><b>상품등록</b></a>
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
		<form method="post" action="./GoodsAddAction.ag" enctype="multipart/form-data">
			<table class="table table-active" style="text-align: center; background-color: white;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;"><b>관리자 상품등록</b></th>
					</tr>
				</thead>
				<tbody>
				 <tr>
		           <th>상품이름</th>
		           <td><input type="text" name="cosName" class="form-control" required></td>           
		         </tr>
				 <tr>
		           <th>상품가격</th>
		           <td><input type="text" name="cosPrice" class="form-control" required></td>           
		         </tr>
		         <tr>
					<th>브랜드</th>
					<td><input type="text" name="cosBrand" class="form-control" required></td> 
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="cosCategory" class="form-control">
							<option value="스킨">스킨</option>
							<option value="에센스">에센스</option>
							<option value="로션">로션</option>
							<option value="크림">크림</option>
							<option value="클렌징">클렌징</option>
							<option value="마스크팩">마스크팩</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>피부타입</th>
					<td>
						<select name="cosSkinType" class="form-control">
							<option value="건성">건성</option>
							<option value="중성">중성</option>
							<option value="지성">지성</option>
						</select>
					</td>
				</tr>								
				<tr>
					<th>피부고민</th>
					<td>
						<select name="cosTrouble" class="form-control">
							<option value="민감성">민감성</option>
							<option value="여드름">여드름</option>
							<option value="아토피">아토피</option>
							<option value="해당없음">해당없음</option>
						</select>
					</td>
				</tr>	
				<tr>
		           <th>수량</th>
		           <td><input type="text" name="cosAmount" class="form-control" required></td>           
		        </tr>
 				<tr>
		           <th>용량</th>
		           <td><input type="text" name="cosVolumn" class="form-control" required></td>           
		        </tr> 
				<tr>
		           <th>회사</th>
		           <td><input type="text" name="madeCompany" class="form-control" required></td>           
		        </tr>      
				<tr>
		           <th>성분</th>
		           <td><textarea name="ingredient" rows="4" cols="25" class="form-control" required></textarea></td>           
		        </tr> 
				<tr>
		           <th>사용방법</th>
		           <td><textarea name="cosMethod" rows="4" cols="25" class="form-control" required></textarea></td>           
		        </tr>
				<tr>
		           <th>주의사항</th>
		           <td><textarea name="cosWarning" rows="4" cols="25" class="form-control" required></textarea></td>           
		        </tr>
		         <tr>
		           <th>제품이미지1(메인)</th>
		           <td>
		              <input type="file" name="file1" accept="cosImage/*,.pdf">           
		           </td>
		         </tr>
		           <tr>
		           <th>제품이미지2</th>
		           <td>
		             <input type="file" name="file2">
		           </td>
		         </tr>
		           <tr>
		           <th>제품이미지3</th>
		           <td>
		             <input type="file" name="file3">
		           </td>
		         </tr>
		           <tr>
		           <th>제품이미지4</th>
		           <td>
		             <input type="file" name="file4">
		           </td>
		         </tr>		      	          
				</tbody>
			</table>
			<div style="margin-left: auto; margin-right: auto;">
			    <input type="submit" value="상품등록" class="btn btn-primary">
			    <input type="reset" value="상품초기화" class="btn btn-primary">
		    </div>		
		</form>
        </div>
    </section>
    <!-- admin goods write End -->
			
		</div>
		<div class="col-12">	
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