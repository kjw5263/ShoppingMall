package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	    // 한글처리
	    request.setCharacterEncoding("UTF-8");
	    // 전달정보를 저장(자바빈객체 - 액션태그) id,pw

			String id = request.getParameter("userId");
		      
		      //UserDAO udao = new UserDAO();
		      
				boolean result=true;
		      
		      
//		        if(udao.joinIDCheck(id)==1)
//		        {
//		           result = false;
//		        }

//		      int result = udao.joinIDCheck(id);


		
		return null;
	}

	


	          
	    

	
}
