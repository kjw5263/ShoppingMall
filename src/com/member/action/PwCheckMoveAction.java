package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;

public class PwCheckMoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
System.out.println("M :FindIdAction_execute() 실행 ");
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 전달정보 저장(id,pass)
		String PwCerCheck = request.getParameter("PwCerCheck");

		// 결과에 따른 페이지 이동
		// 컨트롤러 X - 비밀번호,아이디없음 오류(javascript)
		// => 컨트롤러에는 가지만 페이지이동 X
		if (PwCerCheck.equals("N")) { // 일치하는 아이디 없음
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('전화번호 인증을 해주세요.'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			return null;
		} 
		
		// 컨트롤러 O - 로그인성공
		// check == 0 
		// => 메인페이지로 이동
		
	    // 페이지 이동 (./Main.me)
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/findPwConfirm.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
