package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;

public class MemberCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	    // 한글처리
	    request.setCharacterEncoding("UTF-8");
	  

			String id = request.getParameter("userId");
		      
		     // MemberDAO mdao = new MemberDAO();
		      
				boolean result=true;
		      
		      
//		        if(mdao.signUpIdCheck(userId)==1)
//		        {
//		           result = false;
//		        }

//		      int result = mdao.signUpIdCheck(userId);


		
		return null; //result;
		
		
		
		
		
	}


	
}
