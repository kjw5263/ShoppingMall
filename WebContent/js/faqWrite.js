/**
 *	faqWrite.jsp 에서 사용하는 유효성 체크 스크립트
 */

function check(){
		if($.trim($("#faqCategory").val())==""){
			alert('카테고리를 정하세요')
			return false;
		}
		
		if($.trim($("#faqQuestion").val())==""){
			alert('자주묻는 질문을 쓰세요')
			return false;
		}
		
		if($.trim($("#faqAnswer").val())==""){
			alert('답변을 쓰세요')
			return false;
		}
	}