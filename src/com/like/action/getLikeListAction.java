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
		
		

		
	     
		
		int pageSize = 3;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){pageNum = "1";}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		LikeDAO ldao = new LikeDAO();
		//List LikeList = ldao.getLikeList(userId);
		List LikeList = ldao.getLikeList(userId,startRow,pageSize);
		request.setAttribute("LikeList", LikeList);
		
		
		int cnt = ldao.getlistCount(userId);
		request.setAttribute("cnt", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startRow", startRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		
		
	    forward.setPath("./member/likelist.jsp");
		forward.setRedirect(false);
		return forward; 
	}

}
