/**
 * queWrite.jsp 에서 사용하는 유효성 체크 
 */

function check(){
		
		if($.trim($("#Qsub").val())==""){
			alert('질문을 쓰세요')
			return false;
		}
		
	}