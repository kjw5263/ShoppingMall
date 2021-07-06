/**
 *  카카오톡 로그인 api
 */

Kakao.init('b1ca6ddb15d32d81700309a8f4611657'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.loginForm({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  
	        	  var k_id = response.id;
	        	  var k_email = response.kakao_account.email;
	        	  var k_nickname = response.properties.nickname;
	        	  var k_gender = response.kakao_account.gender;
	        	  // 연령대, 생일 가져오기
	        	  
	        	  $('#userEmail').val(k_email)
	        	  $('#userGender').val(k_gender)
	        	  
	        	  $('#kl').submit();
	        	  
// 	        	  alert(k_id)
// 	        	  alert(k_email)
// 	        	  alert(k_gender)

	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        	alert('카카오 로그아웃 성공')
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  