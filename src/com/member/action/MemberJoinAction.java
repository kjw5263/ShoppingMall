package com.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberJoinAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinAction_execute() 호출!!");
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보 파라미터 저장
		MemberDTO mdto = new MemberDTO();
		mdto.setUserId(request.getParameter("userId"));
		mdto.setUserPass(request.getParameter("userPass"));
		
		
		
		
		
		// DB에 저장 
		//MemberDAO mdao = new MemberDAO();
		// 회원가입 메서드  - insertMember(mdto);
		//mdao.insertMember(mdto);
		
		
		// 페이지 이동(ActionForward객체)
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		
		return forward;
	}

}
