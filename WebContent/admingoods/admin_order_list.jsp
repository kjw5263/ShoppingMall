<%@page import="com.order.db.OrderDTO"%>
<%@page import="com.admin.goods.db.AdminGoodsDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.ArrayList"%>
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
    
<title>관리자 주문 목록</title>
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
			
    <!-- admin goods list Begin -->
    
   	<%
	// AdminGoodsDAO 객체 생성
	AdminGoodsDAO adao = new AdminGoodsDAO();
	
	// 디비에 글의 수를 계산하는 메서드 생성 -> 호출
	// getBoardCount();
	int cnt = adao.getOrderCount();
	
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
	ArrayList<OrderDTO> orderList = adao.getOrderList(startRow,pageSize);
	%>
    
    <section class="admin_order_list">
        <div class="container">
	        <table>
		    <tr>
		    <td>
			    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #b0bcc2;">
				  <div class="collapse navbar-collapse">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminGoodsList.ag"><b>상품목록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./GoodsAdd.ag"><b>상품등록</b></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="./AdminOrderList.ag" style="background-color: #899296; color:white;"><b>주문목록</b></a>
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="12" style="background-color: #b0bcc2; text-align: center; color: white;" ><b>상품 등록 리스트</b></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>주문번호</th>
						<th>주문자</th>
						<th>상품명</th>
						<th>결제방법</th>
						<th>주문금액</th>
						<th>주문상태</th>
						<th>주문일시</th>
						<th>수정/삭제</th>
					</tr>
					
					<% for(int i=0;i<orderList.size();i++){
					   OrderDTO dto = (OrderDTO)orderList.get(i);
					%>

					<tr>
						<td><%=dto.getO_tradeNum()%></td>
						<td><%=dto.getO_userId() %></td>
						<td><%=dto.getO_cosName() %></td>
						<td><%=dto.getPayType() %></td>
						<td><%=dto.getSumMoney() %></td>
						<form name="form" method="post" action="./OrderStatusModify.ag">
						<td>		
							<input type="hidden" name="o_Num" class="o_Num" value="<%=dto.getO_Num() %>"/>				
							<ul class="nav flex-column " style="width: 100px; margin-left: 0; margin-right: auto;">
							  <li class="nav-item mb-2">
								<select name="orderStatus" class="form-control">
									<option value="결제완료"
										<%if(dto.getOrderStatus().equals("결제완료")){ %>
										selected
										<%} %>
									>결제완료</option>
									<option value="상품준비"
										<%if(dto.getOrderStatus().equals("상품준비")){ %>
										selected
										<%} %>
									>상품준비</option>
									<option value="상품준비완료"
										<%if(dto.getOrderStatus().equals("상품준비완료")){ %>
										selected
										<%} %>							
									>상품준비완료</option>
									<option value="주문취소"
										<%if(dto.getOrderStatus().equals("주문취소")){ %>
										selected	
										<%} %>						
									>주문취소</option>
									<option value="배송준비"
										<%if(dto.getOrderStatus().equals("배송준비")){ %>
										selected
										<%} %>							
									>배송준비</option>
									<option value="배송중"
										<%if(dto.getOrderStatus().equals("배송중")){ %>
										selected
										<%} %>							
									>배송중</option>
									<option value="배송완료"
										<%if(dto.getOrderStatus().equals("배송완료")){ %>
										selected
										<%} %>							
									>배송완료</option>								
								</select>	
							  </li>
							  <li class="nav-item mb-2">
	 						  <input type="submit" value="수정" class="btn btn-secondary btn-sm" style="background-color: #b0bcc2;"/> 
							  </li>
							</ul>
						</td>
						</form>
						<td><%=dto.getOrderDate() %></td>
						<td>
						<ul class="nav flex-column ">
						  <li class="nav-item mb-2">
							<a href="./AdminOrderDetail.ag?o_tradeNum=<%=dto.getO_tradeNum()%>" class="btn btn-secondary btn-sm" style="background-color: #b0bcc2;">상세</a>	
						  </li>
						  <li class="nav-item mb-2">
							<a href="./AdminOrderDelete.ag?o_tradeNum=<%=dto.getO_tradeNum()%>" class="btn btn-secondary btn-sm" style="background-color: #b0bcc2;">삭제</a>
						  </li>
						</ul>
						</td>
					</tr>
					<%} %>      
				</tbody>
			</table>	
        </div>
    </section>
    
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
	    		<a href="./AdminOrderList.ag?pageNum=<%=startPage-pageBlock%>" class="btn btn-secondary btn-sm">이전</a>
	    		<%
	    	}   	
	    	
	    	// 숫자  1....5
	    	for(int i=startPage;i<=endPage;i++){
	    		%>
	    		    <a href="./AdminOrderList.ag?pageNum=<%=i%>"class="btn btn-secondary btn-sm" style="background-color: #b0bcc2;"><%=i %></a> 
	    		<%    		
	    	}
	    	
	    	// 다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
	    	if(endPage < pageCount){
	    		%>
	    		<a href="./AdminOrderList.ag?pageNum=<%=startPage+pageBlock%>" class="btn btn-secondary btn-sm">다음</a>
	    		<%
	    	}
	    	
	    }
	    //////////////////////////////////////////////////////
	  %>
    <!-- admin goods list End -->
			
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