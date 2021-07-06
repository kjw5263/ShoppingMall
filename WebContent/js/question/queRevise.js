/**
 * queRevise.jsp 에서 사용하는 질문 유효성(공란 방지) 스크립트
 */

function check(){
		
		if($.trim($("#Qsub").val())==""){
			alert('질문을 쓰세요')
			return false;
		}
	}