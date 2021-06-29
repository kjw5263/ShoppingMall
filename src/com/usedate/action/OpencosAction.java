package com.usedate.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usedate.db.UsedateDAO;

public class OpencosAction implements Action{

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
		
        int usedate = Integer.parseInt(request.getParameter("usedate"));
        UsedateDAO udao = new UsedateDAO();
        udao.regusedate(usedate);
        
        
		
        forward.setPath("./usedate/usedate.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
