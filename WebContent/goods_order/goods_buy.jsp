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

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">
    
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

	 function redirectFunc() {
		 document.getElementById("submitForm").submit();
		 // 인풋태그에서 입력한 값 가져와서
		 // 폼 태그 만들어서값 넣어주고 
		 // 폼을 submit 하기
		 
		 
		 //var un = document.getElementById("userName").value;
<%-- 		 <% --%>
// 		   RequestDispatcher dispatcher =request.getRequestDispatcher("/OrderConfirm.or");
// 		   dispatcher.forward(request, response);
		 
<%-- 		 %>	 --%>
		//document.frmData.action="./OrderConfirm.or";
		//document.frmData.submit();
	}




function payClick() {
	
	var radioVal = $('input[name="payType"]:checked').val();
	if(radioVal == "카드결제"){
		
	}else if(radioVal == "계좌이체"){
		
	}else if(radioVal == "카카오페이"){
// 		var url = "./kakaoSuccess.or";
// 		var title = "kakao payment";
// 		var status = "width=426, height=542";
		var amount = $('#ttmoneyData').val();
		var goods =  $('#goodsTitle').val();
		window.open("./kakaoSuccess.or?amount="+amount+"&goods="+goods, "", "width=426, height=542");
		
// 		var frmData = document.frmData;
// 		frmData.target=title;
// 		frmData.action = url;
// 		frmData.method="post";
// 		frmData.submit();
		
	}
	else if(radioVal == "무통장입금"){
		
	}
// 	function openPopup() {
// 		window.open("./kakaoSuccess.jsp", "","width=426, height=542");
// 	}
	
	//배송지 정보 입력 여부 체크
	
	// 받는사람 입력여부 
	if(document.getElementById("receiverName").value==""){
		alert("받는사람을 입력하세요 ");
		return false;
	}
	
	if(document.getElementById("receiverTel").value==""){
		alert("연락처를 입력해주세요.");
		return false;
	}
	
	if(document.getElementById("zonecode").value == "" || document.getElementById("addr").value== ""|| document.getElementById("addr_detail").value == "" ){
		alert("주소는 필수입력 항목입니다.");
		return false;
	}
	

}


</script>
<script type="text/javascript">
$(document).ready(function () {

	
	
	// 천단위 콤마 찍기
	function addComma(str){
		str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	/* 주소지 지정- 기존배송지, 신규배송지 radio 선택 */
	$('input[name="addrType"]').change(function(){
		if($('input[name="addrType"]:checked').val() == 'savedAddr'){
			$('#receiverName').val('${memberDTO.userName}');
			$('#receiverTel').val('${memberDTO.userTel}');
			$('#receiverTel2').val('');
			$('#receiverMail').val('${memberDTO.userEmail}');
			$('#zonecode').val('${(memberDTO.userAddr).split(",")[0]}');
			$('#addr').val('${(memberDTO.userAddr).split(",")[1]}');
			$('#addr_detail').val('${(memberDTO.userAddr).split(",")[2]}');
		} else {
			$('#receiverName').val('');
			$('#receiverTel').val('');
			$('#receiverTel2').val('');
			$('#zonecode').val('');
			$('#addr').val('');
			$('#addr_detail').val('');
			$('#receiverEmail').val('');
		}
	});
	/* 주소지 지정- 기존배송지, 신규배송지 radio 선택 */
	
	// 총금액 콤마빼고 숫자값만 저장
	var sumMoney = Number($('#summoney').text().replace(/,/g, ""));	//합계금액
	var ttMoney = Number($('#ttmoney').text().replace(/,/g, ""));	//최종금액
	var cpDc = 0;
	var pointDc= 0;
	
	// 배송 메시지 '직접 입력' 선택 시 input 박스 생성
	$('#o_msg').change(function(){
		var a = $('#o_msg option:selected').val();
		if(a == 80){
			$('#shipmsg').prop('type', 'text');
			$('#shipmsg').focus();
		} else {
			$('#shipmsg').prop('type', 'hidden');
		}
	});
	
	
	/* 쿠폰 선택하면 됨 */
	$('#selectCoupon').change(function(){
		var e = Number($('#selectCoupon option:selected').val());
		var cname = $('#selectCoupon option:selected').text();
		$('#delCp').prop('value', cname);
		var dcNum = sumMoney * e/100;		//할인율(10%)
		$('#usecoupon').text(addComma(dcNum*(-1)));	//차감될금액(-1000원) 화면에 표시
		cpDc = dcNum;
		$('#ttmoney').text(addComma(ttMoney-(pointDc+cpDc)));
		$('#ttmoneyData').prop('value',ttMoney-(pointDc+cpDc));
		$('#cpUseAmount').prop('value',cpDc*-1);
	});
	
	
	/* 포인트 입력 keyup 이벤트 */
	// 1. 소유한 포인트보다 많이 입력할경우 경고
	$('#userPoint').keyup(function() {
		if(Number($('#userPoint').val()) > ${memberDTO.userPoint}){
			alert("소유한 포인트보다 초과하여 적용할 수 없습니다.");
			$('#userPoint').val(0);
			//$('#ttmoney').text($('#summoney').text());
			$('#ttmoney').text(addComma(ttMoney-(pointDc+cpDc)));
		} else if(Number($('#userPoint').val())<0){
			alert("포인트는 0포인트 이상 입력해야 합니다.");
			$('#userPoint').val(0);
		}
	});
	
	// 2. 포인트 입력칸 포커스 해제 시 적용
	$('#userPoint').blur(function() {
		$('#usepoint').text(addComma(($('#userPoint').val())*-1));
		pointDc = Number($('#userPoint').val());
		$('#ttmoney').text(addComma(ttMoney-(pointDc+cpDc)));
		$('#ttmoneyData').prop('value',ttMoney-(pointDc+cpDc));
		$('#ptUseAmount').prop('value',pointDc*-1);
	});
	

	
// 	$('input[name="payType"]').change(function(){
// 		if($('input[name="payType"]:checked').val() == "cardPay"){
			
// 		} else {
			
// 		}
// 	});
	
	
	
	
});


</script>
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
	<div class="col-8 " style="padding-bottom:100px;">
	
	<h2 style="margin:30px 30px 30px 0;">주문/결제</h2>
	<div style="margin:50px 30px 10px 0;"><h4>배송상품</h4></div>
	<div style="margin:10px 30px 10px 0;"><h5>총 <%=basketList.size() %>개의 상품</h5></div> 
	<div style="width : 100%;">
		<table class="table" style="text-align: center; margin-bottom:50px;">
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
					<td style="color:black;"><strong><%=fmMoney.format(sumMoney) %>원</strong></td>
				</tr>
		</table>
		</div> <!-- 장바구니 정보 테이블 닫는 div -->
		
		
		
		<!-- onsubmit="return payClick()" -->
		<form action="./OrderAdd.or" id="submitForm" name="frmData" method="post" accept-charset="utf-8" >
		<%
			GoodsDTO gdto = (GoodsDTO)goodsList.get(0);
		%>
		<input type="hidden" name="goodsTitle" id="goodsTitle" value="<%=gdto.getCosName()%> 외 <%=basketList.size()-1 %>개">
		<!-- 새로운 inner Layout : 사용자/쿠폰 영역, 금액영역 -->
		<input type="hidden" name="userId" value="<%=mDTO.getUserId() %>">			<!-- 사용자 아이디  -->
		<input type="hidden" name="delCp" value="" id="delCp"> 						<!--사용한 쿠폰이름 -->
		<input type="hidden" name="sumMoneyData" id="sumMoneyData" value="<%=sumMoney %>"> <!-- 합계금액 -->
		<input type="hidden" name="ttmoneyData" id="ttmoneyData" value="<%=sumMoney%>"> 	<!-- 최종금액 -->
		<input type="hidden" name="addPoint" id="addPoint" value=<%=sumMoney*1/100 %>><!-- 적립예정 포인트 -->
		<input type="hidden" name="userEmail" value="<%=mDTO.getUserEmail() %>">		<!-- 사용자 이메일 -->
		<input type="hidden" name="userName" value="<%=mDTO.getUserName() %>">		<!--  사용자 이메일 -->
		<input type="hidden" name="cpUseAmount" id="cpUseAmount" value=0>			<!-- 사용한 쿠폰 할인율 -->
		<input type="hidden" name="ptUseAmount" id="ptUseAmount" value=0>			<!-- 사용한 포인트 할인율 -->
		<div class="row">
		<div class="col-8">
		
		
		<!-- 회원정보 테이블 묶는 div -->
		<div style="width : 100%;">
		
		<h4 style="margin:10px 30px 10px 0;">배송지 정보</h4>
		<table class="table">
			<tr>
				<th scope="row" class="table-active" style="width:150px;">배송지 선택</th>
				<td>
					<span><input type="radio" name="addrType" id="savedAddr" checked value="savedAddr">기존 배송지</span>
					<span><input type="radio" name="addrType" id="newAddr" value="newAddr">신규 배송지</span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="table-active"><span style="color:red">*</span>받는 분</th>
				<td><input type="text" class="form-control" name="receiverName" id="receiverName" value="<%=mDTO.getUserName()%>"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active"><span style="color:red">*</span>연락처</th>
				<td><input type="text" class="form-control" name="receiverTel" id="receiverTel" value="<%=mDTO.getUserTel()%>" placeholder="-제외 입력"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active">연락처2</th>
				<td><input type="text" class="form-control" name="receiverTel2" id="receiverTel2" placeholder="-제외 입력"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active">이메일</th>
				<td><input type="text" class="form-control" name="receiverEmail" id="receiverEmail" value="<%=mDTO.getUserEmail()%>"></td>
			</tr>
			<tr>
				<th scope="row" class="table-active"><span style="color:red">*</span>주소</th>
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
					<div class="input-group">
						<select class="form-control" name="o_msg" id="o_msg">
							<option value="">배송메시지를 선택하세요.</option>
							<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
							<option value="부재시 문 앞에 놓아주세요.">부재시 문 앞에 놓아주세요.</option>
							<option value="파손의 위험이 있는 상품이오니, 배송 시 주의해주세요.">파손의 위험이 있는 상품이오니, 배송 시 주의해주세요.</option>
							<option value="배송 전 연락주세요.">배송 전 연락주세요.</option>
							<option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
							<option value="80">직접 입력</option>
						</select>
					</div>
					<div class="input-group"><input type="hidden" class="form-control" name="o_msg" id="shipmsg" value="" maxlength="30"></div>
				</td>
			</tr>
		</table>
		</div> <!-- 회원정보 테이블 묶는 div -->
		
		
		<!-- 포인트/쿠폰 테이블 묶는 div -->
		
		<div  style="width : 100%;">
		<h4 style="margin:50px 30px 10px 0;">포인트/쿠폰 사용</h4>
		<table class="table">
			<tr>
				<th scope="row" class="table-active" style="width:150px;">쿠폰</th>
				<td>
					<select class="form-control" name="selectCoupon" id="selectCoupon">
						<option value="0">쿠폰선택 안함</option>
						<c:forEach var="i" items="${couponList }">
						<option value="${i.couponDc }">${i.couponName }</option>
						</c:forEach>
					</select>
					
				</td>
			</tr>
			<tr>
				<th scope="row" class="table-active" id="addrName">포인트</th>
				<td><input type="text" value="" name="userPoint" id="userPoint" style="width:80px;"> / <%= fmMoney.format(mDTO.getUserPoint()) %>원</td>
			</tr>
		</table>
		</div> <!-- 포인트/쿠폰 테이블 묶는 div -->
		
		
		<!-- 결제수단 테이블 묶는 div -->
		<h4  style="margin:50px 30px 10px 0;">결제수단 선택</h4>
		<div  style="width : 100%;">
		<table class="table" id="payTable">
			<tr>
				<td colspan="2">
					<span id="ptFloat" style="display: inline-block;"><input type="radio" name="payType" id="cardPay" value="카드" checked>카드결제</span>
					<span id="ptFloat" style="display: inline-block;"><input type="radio" name="payType" id="accountPay" value="계좌이체">계좌이체</span>
					<span id="ptFloat" style="display: inline-block;"><input type="radio" name="payType" id="kakaoPay" value="카카오페이">카카오페이</span>
					<span id="ptFloat" style="display: inline-block;"><input type="radio" name="payType" id="cashPay" value="무통장입금">무통장입금</span>
				</td>
			</tr>
			<tr id="payArea" >
				<!-- 추후에 해결하기  -->
			</tr>
		</table>
		</div> <!-- 결제수단 테이블 묶는 div -->
		
		
		</div>  <!-- 배송정보,쿠폰 영역 묶는 div -->
		
		
		<!-- 금액 영역 묶는 div -->
		<div class="col-4" >
		<div  style="margin:10px 30px 10px 0;"><h4>최종 결제정보 </h4></div>
		<div style="width : 100%;">
		<table class="table table-bordered">
			<tr>
				<th scope="row" style="width:200px;">총 상품금액</th>
				<td style="width:200px; font-weight:bold; text-align:right;"><span id="summoney"><%=fmMoney.format(sumMoney) %></span> 원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;">적립예정 포인트</th>
				<td style="width:200px; text-align:right;"><span><%=fmMoney.format(sumMoney*1/100) %></span> 원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;">쿠폰 할인금액</th>
				<td style="width:200px; text-align:right; color:red;"><span id="usecoupon">0</span> 원</td>
			</tr>
			<tr>
				<th scope="row" style="width:200px;" >포인트</th>
				<td style="width:200px; text-align:right; color:red;"><span id="usepoint">0</span> 원</td>
			</tr>
			
			<tr>
				<th scope="row" style="width:200px;" ><strong>최종금액</strong></th>
				<td style="width:200px; font-weight:bold; text-align:right; color:#0054FF"><span id="ttmoney"><%=fmMoney.format(sumMoney) %></span> 원</td>
			</tr>
			<tr>
				<td scope="row" colspan="2" style="text-align:center;"><input type="button" onclick="payClick()" id="payButton" class="btn btn-secondary btn-lg" value="결제하기"></td>
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