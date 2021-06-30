package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class MemberNaverLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String n_Email = request.getParameter("n_Email");
		
		MemberDAO mdao = new MemberDAO();
		
		String check = mdao.NaverIdCheck(n_Email);
		
		if (check.equals("")) { // 이메일 없음, 회원가입 권유
			
			// 페이지 이동 (./NConnectId.me)
			request.setAttribute("n_Email", n_Email);
			
			ActionForward forward = new ActionForward();
			forward.setPath("./member/NConnectId.jsp");
			forward.setRedirect(false);
			return forward;
		}
		
		// 컨트롤러 O - 로그인성공
		// check == 0 
		// => 메인페이지로 이동
		
		// 아이디 정보를 session객체에 저장
		HttpSession session = request.getSession();
	    session.setAttribute("userId", check);	
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.me");
		forward.setRedirect(true);
		return forward;
	
		}
	}