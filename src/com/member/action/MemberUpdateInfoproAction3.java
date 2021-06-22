package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberUpdateInfoproAction3 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M :MemberUdtInfoPsproAction3_execute");
		
		HttpSession session = request.getSession();
		
		String userId = (String)session.getAttribute("userId");
		ActionForward forward = new ActionForward();
		if(userId==null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO mdto = mdao.getMemberInfo(userId);
		request.setAttribute("mdto", mdto);
		
		
		forward = new ActionForward();
		forward.setPath("./member/update_info.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
	
}
