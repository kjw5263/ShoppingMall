package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class findPwCerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		System.out.println("전달된 userId 값 : " + userId);

		String userEmail = request.getParameter("userEmail");
		System.out.println("전달된 userEmail 값 : " + userEmail);
		
		String userTel = request.getParameter("userTel");
		System.out.println("전달된 userTel 값 : " + userTel);
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.findPwCerAction(userId, userEmail, userTel);		
		
		MessageSendAjax ms = new MessageSendAjax();
		

		RandNum RandNum = new RandNum();
		
		String rm;
		
		
		if(check == -1){
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('잘못된 정보입니다.'); ");
			out.print(" history.back(); ");
			out.print("</script>");

			out.close();
			return null;
			
			
		}
		
		// 수신자 전화번호로 넘기기 + 랜덤 번호도 같이 넘기기( 구현해야함 )
		
		rm = RandNum.rand();

		// 세션에 해당 아이디 저장
		// session.setAttribute("PwCheckId", userId);
		
		// 디비에 인증번호 저장 -> 세션으로 변경하기
		// mdao.CheckPw(userId, rm);
		session.setAttribute("rm", rm);
	
		
		//
		ms.call(userTel, rm);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/findPwCer.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
