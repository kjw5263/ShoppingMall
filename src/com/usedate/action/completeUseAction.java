package com.usedate.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usedate.db.UsedateDAO;

public class completeUseAction implements Action{

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
        
        int openNum = Integer.parseInt(request.getParameter("openNum"));
        
        UsedateDAO udao = new UsedateDAO();
        udao.completeuse(openNum);

        response.setContentType("text/html; charset=utf-8");
		
        PrintWriter out = response.getWriter();

		out.print("<script>");
		out.print(" alert('사용 완료 처리 되었습니다.'); ");
		out.print("location.href='./Usedate.ud';");
		out.print("</script>");

		out.close();
        
    	forward.setPath("/Usedate.ud");
		forward.setRedirect(false);
		return forward;
	}

	
}
