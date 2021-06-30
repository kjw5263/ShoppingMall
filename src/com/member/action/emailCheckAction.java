package com.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;


public class emailCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String email = request.getParameter("receiver");
		boolean check=true;
	
		MemberDAO mdao = new MemberDAO();
		
		//전체 회원 email DB 불러오기  (MemberDAO(userEmail))
				

//		for(int i=0; i<mdao.emailList.size();i++)
		{
//			MemberDTO mb = (MembersDramaBean) MemberList.get(i);
			
//			if(mb.getMail().equals(email))
			{ 
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('E-Mail이 중복됩니다');");
				out.print("window.close();");
				out.print("</script>");
				out.close();
				check=false;
			}
		}

		if(check)
		{
			ActionForward forward = new ActionForward();
			forward.setPath("./SendEmail.do?receiver="+email);
			forward.setRedirect(true);
			return forward;
		}
		else
		{
			return null;
		}
		
	}


	
	
}
