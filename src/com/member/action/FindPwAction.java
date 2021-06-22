package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class FindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M :FindIdAction_execute() 실행 ");
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 전달정보 저장(id,pass)
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userTel = request.getParameter("userTel");

		// DAO객체 생성 -> idCheck(id,pass)
		MemberDAO mdao = new MemberDAO();
		String check = mdao.findPw(userName, userEmail, userTel);

		// 결과에 따른 페이지 이동
		// 컨트롤러 X - 비밀번호,아이디없음 오류(javascript)
		// => 컨트롤러에는 가지만 페이지이동 X
		if (check.equals("")) { // 일치하는 아이디 없음
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('없는 정보입니다.'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			return null;
		} 
		
		// 컨트롤러 O - 로그인성공
		// check == 0 
		// => 메인페이지로 이동
		
	    // 페이지 이동 (./Main.me)
		
		request.setAttribute("userId", check);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/findIdConfirm.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
	
}
