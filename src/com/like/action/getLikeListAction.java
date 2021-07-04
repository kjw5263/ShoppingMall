package com.like.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.like.db.LikeDAO;


public class getLikeListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		LikeDAO ldao = new LikeDAO();
		List LikeList = ldao.getLikeList(userId);
		
		request.setAttribute("LikeList", LikeList);
	     
	    forward.setPath("./member/likelist.jsp");
		forward.setRedirect(false);
		return forward; 
	}

}
