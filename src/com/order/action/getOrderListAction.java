package com.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class getOrderListAction implements Action{

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
		OrderDAO odao = new OrderDAO();
		Vector totalList = odao.getOrderList(userId);
		request.setAttribute("orderList", totalList.get(0));
		request.setAttribute("goodsList", totalList.get(1));
		
		
		forward.setPath("./goods_order/showorder.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
