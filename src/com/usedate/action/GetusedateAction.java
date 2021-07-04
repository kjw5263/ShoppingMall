package com.usedate.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usedate.db.UsedateDAO;




public class GetusedateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("userId");
	        
	        ActionForward forward = new ActionForward();
	        if(userId == null){
	        	forward.setPath("./MemberLogin.me");
	        	forward.setRedirect(true);
	        	return forward;
	        }
	        
		
		UsedateDAO uddo = new UsedateDAO();
		Vector totalList= uddo.getusedate(userId);
		request.setAttribute("useList", totalList.get(0));
		request.setAttribute("openList", totalList.get(1));
		
		int pageSize = 2;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){pageNum = "1";}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		UsedateDAO uddo2 = new UsedateDAO();
		Vector totalList2 = uddo2.getorderList(userId, startRow, pageSize);
		request.setAttribute("goodsList", totalList2.get(0));
		request.setAttribute("orderList", totalList2.get(1));
		request.setAttribute("usestatusList", totalList2.get(2));
		
		
		int cnt = uddo2.getordercount(userId);
		request.setAttribute("cnt", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startRow", startRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		
		forward.setPath("./usedate/usedate.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
