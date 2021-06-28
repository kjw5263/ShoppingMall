package com.usedate.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usedate.db.UsedateDAO;




public class GetusedateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("userId");
	        
	        ActionForward forward = new ActionForward();
	        if(userId == null){
	        	forward.setPath("./MemberLogin.me");
	        	forward.setRedirect(true);
	        	return forward;
	        }
	        
		
		UsedateDAO uddo = new UsedateDAO();
		Vector totalList= uddo.getusedate(userId);
		request.setAttribute("goodsList", totalList.get(0));
		request.setAttribute("openList", totalList.get(1));
		
		
		forward.setPath("./usedate/usedate.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
