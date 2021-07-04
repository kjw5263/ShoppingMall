$(function() {
			
 	        $('#certify').click(function(){
	        	
 				var con = document.getElementById("i1");
 				var userId = $('#userId').val();
 				var userEmail = $('#userEmail').val();
 				var userTel = $('#userTel').val();

 	           $.ajax({
 	            url: "./FindPwAjax.me",
 	            type:"post",
 	            data:{userId:userId,userEmail:userEmail,userTel:userTel},
 	            success:function(data){

 	               if(data == 0){

  		            	alert('인증번호를 발송합니다.')
  		       			con.style.display = (con.style.display != 'none') ? "none" : "block";
		            	
 	               }else{
 	            	   	alert('잘못된 정보입니다.')
	            	   
 	               } // if else
	            	   
 	            }
 	         });
	           
	           
 	        })   
 		});