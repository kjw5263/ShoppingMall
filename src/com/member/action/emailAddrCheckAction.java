package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class emailAddrCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userEmail = request.getParameter("userEmail").trim();
		
		MemberDAO mdao = new MemberDAO();
		
//		System.out.println(userEmail);
		
		int check = 0;
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
			check = mdao.mailAddrCheck(userEmail);
			
			ActionForward forward = new ActionForward();
			if(check == 1)
			{ 
			 out.println(
				"<script>"
				+ "var result = confirm('이미 등록된 메일주소입니다. 로그인 하러 가시겠습니까?');"
				+ " if(result == true){location.href='./MemberLogin.me';} "
				+ "else{history.back();}</script>");
			}else if(check == 0){
				HttpSession session = request.getSession();
				//인증 해야되는 메일주소
				session.setAttribute("userEmail", userEmail);
				
					System.out.println("==============================================================");
					System.out.println(userEmail);
				forward.setPath("./emailSendAction.me");
				forward.setRedirect(true);
				return forward;	
			}
			
		out.print(check);
		
		out.flush();
		out.close();
		
		return null;
		
	}
	
}
