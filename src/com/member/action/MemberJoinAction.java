package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberJoinAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinAction_execute() 호출!!");
		 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보 파라미터 저장 
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		String userName = request.getParameter("userName");			
		String userEmail = request.getParameter("userEmail");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String userAddr = address1 + "," + address2 + "," +address3;
		String userTel = request.getParameter("userTel");
		String userBirth = request.getParameter("userBirth");
		String userGender = request.getParameter("userGender");
		String userSkinType = request.getParameter("userSkinType");
		String userTrouble = request.getParameter("userTrouble");
		
		
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
