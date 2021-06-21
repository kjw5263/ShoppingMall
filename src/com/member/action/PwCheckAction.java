package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class PwCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		// 한글 처리
		request.setCharacterEncoding("utf-8");

		// 넘어온게 같으면 비밀번호 확인 페이지로 이동
		String checkNum = request.getParameter("checkNum");
		System.out.println("전달된 checkNum 값 : " + checkNum);
		
//		String checkRm = request.getParameter("checkRm");
//		System.out.println("전달된 checkRm 값 : " + checkRm);
		
		String PwCheckId = (String)session.getAttribute("PwCheckId");
		
		MemberDAO mdao = new MemberDAO();
		String check = mdao.PwCheck(checkNum, PwCheckId);
		
		
		if(check.equals("")){
			// 넘겨온 값이 다를 때
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('인증번호가 다릅니다.'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			
			return null;
		}
		
		// 넘겨온 값이 같을 때
	    // 페이지 이동 (./Main.me)
		
		request.setAttribute("userPass", check);

		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/findPwConfirm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
