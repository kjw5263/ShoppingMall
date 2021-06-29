<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function(){
	
	  
	  IMP.init('imp73455665'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	  var msg;
	  
	  IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : $('#hidden_goodsTitle').val(),
		    amount : $('#hidden_ttMoneyData').val()
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
		    		}
		    	}).done(function(data) {
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;

		    			alert(msg);
		    		} else {
		    		}
		    	});
		    	//window.opener.parent.document.redirectFunc();
		    	//window.opener.parent.location.href="./OrderConfirm.or";
		    	window.opener.redirectFunc();
		    	window.close();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;

		        alert(msg);
		        window.close();
		    }
		});
  }); 


</script>
</head>
<body>
<%	
	//request.setCharacterEncoding("UTF-8");
%>

<input type="hidden" id="hidden_goodsTitle" value="<%=request.getParameter("goods") %>">
<input type="hidden" id="hidden_ttMoneyData" value="<%=request.getParameter("amount") %>">
<%-- <input type="hidden" id="hidden_email" value="<%=request.getParameter("userEmail")%> "> --%>
<%-- <input type="hidden" id="hidden_userName" value="<%=request.getParameter("userName") %>"> --%>
<%-- <input type="hidden" id="hidden_userTel" value="<%=request.getParameter("userTel") %>"> --%>
</body>
</html>