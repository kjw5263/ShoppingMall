<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="com.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 상세 내역</title>


<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
    rel="stylesheet">
    
 <!--  다음 우편번호 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function openAddrPop() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zonecode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr_detail').focus();
        }
    }).open();
}
</script>
<script type="text/javascript">
$(document).ready(function () {
	
	/* 주소지 지정- 기존배송지, 신규배송지 radio 선택 */
	$('input[name="addrType"]').change(function(){
		if($('input[name="addrType"]:checked').val() == 'savedAddr'){
			$('#receiverName').val('${memberDTO.userName}');
			$('#receiverTel1').val('${memberDTO.userTel}');
			$('#receiverTel2').val('');
			$('#zonecode').val('${(memberDTO.userAddr).split(",")[0]}');
			$('#addr').val('${(memberDTO.userAddr).split(",")[1]}');
			$('#addr_detail').val('${(memberDTO.userAddr).split(",")[2]}');
		} else {
			$('#receiverName').val('');
			$('#receiverTel1').val('');
			$('#receiverTel2').val('');
			$('#zonecode').val('');
			$('#addr').val('');
			$('#addr_detail').val('');
		}
	});
	/* 주소지 지정- 기존배송지, 신규배송지 radio 선택 */
	
	
	/* 포인트 입력 keyup 이벤트 */
	$('#userPoint').keyup(function() {
		if(Number($('#userPoint').val()) > ${memberDTO.userPoint}){
			alert("소유한 포인트보다 초과하여 적용할 수 없습니다.");
			$('#userPoint').val(0);
		}
	});
	

	$('#userPoint').blur(function() {
		$('#usepoint').text(($('#userPoint').val())*-1);
		$('#ttmoney').text(Number($('#ttmoney').text())-Number($('#userPoint').val()));
	});
	
	
});


</script>
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
		// OrderStartAction.java 에서 넘긴 영역 정보 저장하기
		List basketList = (List)request.getAttribute("basketList");
		List goodsList = (List)request.getAttribute("goodsList");
		MemberDTO mDTO = (MemberDTO)request.getAttribute("memberDTO");
		List couponList = (List)request.getAttribute("couponList");
		
		DecimalFormat fmMoney = new DecimalFormat("###,###");
		int sumAmount=0;
		int sumMoney =0;

	%>
	
	
	<!-- container 시작 -->	
	<div class="container-fluid">	
	
	<div class="row">
	<div class="col-2 text-center"></div>
	<div class="col-8 " >
	
	<h2>주문/결제</h2>
	<div><h4>배송상품</h4></div>
	<div><h5>총 <%=basketList.size() %>개의 상품</h5></div> 
	<div style="width : 100%;">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col" colspan="2">상품정보</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">합계</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i=0; i<basketList.size(); i++){
						BasketDTO bkDTO = (BasketDTO)basketList.get(i);
						GoodsDTO gDTO = (GoodsDTO)goodsList.get(i);
						sumAmount += bkDTO.getBasketCosAmount();
						sumMoney += (bkDTO.getBasketCosAmount()*gDTO.getCosPrice());
				%>
				<tr>
					<td><img src="<%=gDTO.getCosImage().split(",")[0] %>" width="100" height="100"></td>
					<td><b><%=gDTO.getCosBrand() %></b><br><%=gDTO.getCosName() %></td>
					<td><%=fmMoney.format(gDTO.getCosPrice()) %>원</td>
					<td><%=bkDTO.getBasketCosAmount() %></td>
					<td><%=fmMoney.format(bkDTO.getBasketCosAmount()*gDTO.getCosPrice()) %>원</td>
				</tr>
				<% } %>
				
			</tbody>
				<tr class="table-active">
					<th scope="col" colspan="3" style="color:black;">합계</th>
					<td style="color:black;"><strong><%=sumAmount %></strong></td>
					<td style="color:#ff0000;"><strong><%=fmMoney.format(sumMoney) %>원</strong></td>
				</tr>
		</table>
		</div> <!-- 장바구니 정보 테이블 닫는 div -->
		
		<form action="#" method="post">
		<!-- 새로운 inner Layout : 사용자/쿠폰 영역, 금액영역 -->
		<div class="row">
		<div class="col-8">
		<h4>배송지 정보</h4>
		
		
		<!-- 회원정보 테이블 묶는 div -->
		<div style="width : 100%;">
		<table class="table">
			<tr>
				<th scope="row" class="table-active" style="width:150px;">배송지 선택</th>
				<td>
					<span><input type="radio" name="addrType" id="savedAddr" checked value="savedAddr">기존 배송지</span>
					<span><input type="radio" name="addrType" id="newAddr" value="newAddr">신규 배송지</span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="table-active" id="addrName">배송지명</th>
				<td><input type="text" style="width:200px;" id="addrName"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active">받는 분</th>
				<td><input type="text" class="form-control" name="receiverName" id="receiverName" value="<%=mDTO.getUserName()%>"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active">연락처1</th>
				<td><input type="text" class="form-control" name="receiverTel1" id="receiverTel1" value="<%=mDTO.getUserTel()%>"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active">연락처2</th>
				<td><input type="text" class="form-control" name="receiverTel2" id="receiverTel2"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active">주소</th>
				<td>
					<div class="form-inline">
					<div class="form-group mx-sm mb-2">
				    	<input type="text" class="form-control" name="zonecode" id="zonecode" value="${(memberDTO.userAddr).split(',')[0] }" readonly>
				 	</div>
					<input type="button"  id="addr_btn" class="btn btn-secondary mx-sm-1 mb-2" value="우편번호 찾기" onclick="openAddrPop()">
				</div>
				
				<div class="form-inline">
					<div class="form-group mx-sm mb-2">
				    	<input type="text" class="form-control" name="addr" id="addr" value="${(memberDTO.userAddr).split(',')[1] }" readonly>
				    	<input type="text" class="form-control mx-sm-1" name="addr_detail" id="addr_detail" value="${(memberDTO.userAddr).split(',')[2]}">
				 	</div>
				</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="table-active">배송 메시지</th>
				<td>
					<select class="form-control" name="o_msg">
						<option value="">배송메시지를 선택하세요.</option>
						<option value="10">부재시 경비실에 맡겨주세요.</option>
						<option value="20">부재시 문 앞에 놓아주세요.</option>
						<option value="30">파손의 위험이 있는 상품이오니, 배송 시 주의해주세요.</option>
						<option value="40">배송 전 연락주세요.</option>
						<option value="50">택배함에 넣어주세요.</option>
						<option value="80">직접 입력</option>
					</select>
				</td>
			</tr>
		</table>
		</div> <!-- 회원정보 테이블 묶는 div -->
		
		
		<!-- 포인트/쿠폰 테이블 묶는 div -->
		<h4>포인트/쿠폰 사용</h4>
		<div  style="width : 100%;">
		<table class="table">
			<tr>
				<th scope="row" class="table-active" style="width:150px;">쿠폰</th>
				<td>
					<select class="form-control" name="selectCoupon">
						<option value="">쿠폰선택 안함</option>
						<c:forEach var="i" items="${couponList }">
						<option value="${i.couponName }">${i.couponName }</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						for(var i=0; i<couponList.size(); i++){
							
						}
					</script>
				</td>
			</tr>
			<tr>
				<th scope="row" class="table-active" id="addrName">포인트</th>
				<td><input type="text" value="" name="userPoint" id="userPoint" style="width:80px;"> / <%= fmMoney.format(mDTO.getUserPoint()) %>원</td>
			</tr>
		</table>
		</div> <!-- 포인트/쿠폰 테이블 묶는 div -->
		
		
		</div>  <!-- 배송정보,쿠폰 영역 묶는 div -->
		
		
		<!-- 금액 영역 묶는 div -->
		<div class="col-4">
		<div><h4>최종 결제정보 </h4></div>
		<div style="width : 100%;">
		<table class="table table-bordered">
			<tr>
				<th scope="row" style="width:200px;">총 상품금액</th>
				<td style="width:200px;"><span><%=fmMoney.format(sumMoney) %></span>원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;" >쿠폰 할인금액</th>
				<td style="width:200px;"><span>0</span>원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;" >포인트</th>
				<td style="width:200px;"><span id="usepoint">0</span>원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;" >적립예정 포인트</th>
				<td style="width:200px;"><span><%=fmMoney.format(sumMoney*1/100) %></span>원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;" ><strong>최종금액</strong></th>
				<td style="width:200px;"><span id="ttmoney"><strong><%=sumMoney%></strong></span>원</td>
			</tr>
			<tr>
				<td scope="row" colspan="2"><input type="submit" value="결제하기" onclick="" class="btn btn-secondary btn-lg"></td>
			</tr>
		</table>
		</div> <!-- 금액 테이블 묶는 div -->
			
		</div> <!-- 금액 영역 묶는 div -->
		</div> <!-- innerLayout 묶는 div -->
		</form>
		
		</div> <!--  col-8 클래스 닫는 div  -->
		
		<div class="col-2"></div>
	</div> <!-- 레이아웃 col-2,8,2 묶는 div -->
	
	</div> <!-- 전체 묶는 -->
	<!-- container 끝 -->	
	
	
	
	
	
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
</body>
</html>