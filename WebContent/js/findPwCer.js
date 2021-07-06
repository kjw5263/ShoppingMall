/**
 * findPwCer.jsp 에서 인증번호 확인할 때 사용하는 스크립트(에이잭스)
 */

$(function() {
		
	        $('#confirm').click(function(){
        	
				var checkNum = $('#checkNum').val();

	           $.ajax({
	            url: "./PwCheckAction.me",
	            type:"post",
	            data:{checkNum:checkNum},
	            success:function(data){

	            	if(data == 1){

  		            	alert('확인됐습니다.')
		            	
  						$('#PwCerCheck').val('Y');
  		            	
  		            	
 	               }else{
 	            	   
 	            	   	alert('인증번호가 다릅니다.')

  						$('#PwCerCheck').val('N');

 	               } // if else
            	   
	            }
	         });
           
           
	        })   
		});