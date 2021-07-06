/**
 * faq_list에서 사용하는 질문 클릭스 답변 보이게 하는 스크립트
 */

$(function() {
    	// 질문 클릭시 답변 보이기 시작
    	$('td').click(function() {
    		// alert('클릭됐습니다.');
    		
			var fnum = $(this).attr('id');
			
			var con = document.getElementById(fnum + "_answer");
			con.style.display = (con.style.display != 'none') ? "none" : "";
			
			//alert(fnum);

    	});
    	// 질문 클릭시 답변 보이기 끝
    	
    	// 글쓰기 버튼 시작
    	$('#write').click(function() {
    		location.href='./FaqWrite.faq';
		});    	
    	// 글쓰기 버튼 끝

    	
    });