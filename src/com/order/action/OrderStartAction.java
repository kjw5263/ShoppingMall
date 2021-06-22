package com.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.db.OrderDAO;

public class OrderStartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : OrderStartAction_execute() 호출!");
		
		/* 세션 처리 */
		// HttpSession session = request.getSession();
		// String id = (String)session.getAttribute("id");
		String userId = "jiwon";
		
		ActionForward forward = new ActionForward();
		/*if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}*/
		
		
		// 장바구니 DB의 장바구니 정보 가져오기
		// 
		OrderDAO orDAO = new OrderDAO();
		orDAO.getBasketList(userId);
		
		
		forward.setPath("");
		forward.setRedirect(false);
		return forward;
	}
	
}
