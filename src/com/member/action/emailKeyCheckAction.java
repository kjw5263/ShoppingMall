package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class emailKeyCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		System.out.println("-----------emailKeyCheckAction----------");
		System.out.println(session.getAttribute("userEmail"));
		System.out.println(session.getAttribute("content"));
		System.out.println(request.getParameter("emailKey"));
		System.out.println("---------------");
		
	
		String userEmail= (String)session.getAttribute("userEmail");
		String content = (String)session.getAttribute("content");
		String emailKey = (String)request.getParameter("emailKey");
		PrintWriter out = response.getWriter();
		
		if(content.equals(emailKey)){
			
			ActionForward forward = new ActionForward();
			
			forward.setPath("./MemberJoin.me");
			forward.setRedirect(true);
			
			return forward;

		}else{
			out.println(
					"<script>"
					+ "alert('인증번호를 다시 확인해 주세요.'); "
					+ "history.back();"
					+ "</script>");
			
		}

		return null;
	}

	
	
	
}
