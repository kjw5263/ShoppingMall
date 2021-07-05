package com.order.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.db.OrderDAO;

public class OrderdetailAction implements Action {

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
		
		String tradeNum = request.getParameter("tradeNum");
		
		OrderDAO odao = new OrderDAO();		
		Vector totalList = odao.getorderdetail(userId,tradeNum);
		request.setAttribute("goodsList", totalList.get(0));
		request.setAttribute("orderList", totalList.get(1));
		
		forward.setPath("./goods_order/show_order_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
	
}
