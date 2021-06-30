package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberUpdateInfoproAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M :MemberUdtInfoPsproAction_execute");
		
		HttpSession session = request.getSession();
		
		String userId = (String)session.getAttribute("userId");
		ActionForward forward = new ActionForward();
		if(userId==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		String userPass = request.getParameter("userPass");
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.PassCheck(userId,userPass);
		
		if(check == 0){
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('비밀번호가 일치 하지 않습니다.'); ");
			out.print(" location.href = './MemberUpdateInfopro3.me'; ");
			out.print("</script>");

			out.close();
			return null;
		}
		
		
		
		MemberDTO mdto = mdao.getMemberInfo(userId);
		request.setAttribute("mdto", mdto);
		
		
		forward = new ActionForward();
		forward.setPath("./member/update_info.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
	
}
