 function check(){
   		 
		 var userPass = $("#newPass").val();
		 var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/.test(userPass);
   		 
   		 
		if(document.fr.newPass.value == ""){
			alert("비밀번호를 입력하세요.")
			document.fr.newPass.focus();
			return false;
			// 비밀번호 공백 시 차단
		} // if
	
		if(document.fr.newPass2.value == ""){
			alert("비밀번호 확인을 입력하세요.")
			document.fr.newPass2.focus();
			return false;
			// 비밀번호확인 공백 시 차단
		} // if   
		
		if(!check){
			alert("대소문자,숫자,특수문자(@$!%*#?&) 세가지를 조합한 8~16자리를 입력하세요")
			document.fr.newPass.focus();
			return false;
		} // if
		
   	 }