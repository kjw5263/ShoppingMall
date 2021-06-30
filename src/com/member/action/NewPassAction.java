package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class NewPassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();

		
		// 전달정보 저장(id,pass)
		String newPass = request.getParameter("newPass");
		String newPass2 = request.getParameter("newPass2");
		String userId = (String)session.getAttribute("PwCheckId");


		if(newPass.equals(newPass2)){
			
			// DAO객체 생성 -> idCheck(id,pass)
			MemberDAO mdao = new MemberDAO();
			mdao.NewPassCheck(newPass, userId);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert(' 비밀번호 변경완료.'); ");
			out.print(" location.href='./MemberLogin.me' ");
			out.print("</script>");

			out.close();			
			
		    // 페이지 이동 (./Main.me)
			ActionForward forward = new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
			
		}else{
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert(' 새 비밀번호가 다릅니다.'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			
			return null;
		}
	}

}
