package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;

public class FindPwAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		System.out.println("전달된 userId 값 : " + userId);

		String userEmail = request.getParameter("userEmail");
		System.out.println("전달된 userEmail 값 : " + userEmail);
		
		String userTel = request.getParameter("userTel");
		System.out.println("전달된 userTel 값 : " + userTel);
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.findPwAjax(userId, userEmail, userTel);		
		
		MessageSendAjax ms = new MessageSendAjax();
		PrintWriter out = response.getWriter();

		
		if(check == 0){
			ms.call(userTel);
			
			out.print(check);
			
		}else{
			
			out.print(check);
			
		}
		
		
		return null;
	}

}
