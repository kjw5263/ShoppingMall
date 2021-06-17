package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M :MemberLoginAction_execute() 실행 ");

		// 전달정보 저장(id,pass)
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");

		// DAO객체 생성 -> idCheck(id,pass)
		MemberDAO mdao = new MemberDAO();
		int check = mdao.idCheck(userId, userPass);

		// 결과에 따른 페이지 이동
		// 컨트롤러 X - 비밀번호,아이디없음 오류(javascript)
		// => 컨트롤러에는 가지만 페이지이동 X
		if (check == 0) { // 비밀번호 오류 - 페이지 뒤로가기
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('비밀번호 오류~!'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			return null;
		} else if (check == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('아이디 없음~!'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			return null;
		}

		// 컨트롤러 O - 로그인성공
		// check == 0 
		// => 메인페이지로 이동
		
		// 아이디 정보를 session객체에 저장
		HttpSession session = request.getSession();
	    session.setAttribute("userId", userId);	
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.me");
		forward.setRedirect(true);
		return forward;
	}

}
