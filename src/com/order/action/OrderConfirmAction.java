package com.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;

public class OrderConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String tradeNum = request.getParameter("tradeNumber");
		ActionForward forward = new ActionForward();
		//System.out.println("OrderConfirmAction >>>>> " + userId);
		/* 세션 처리 */
		if(userId == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 주문 내역 가져오기
		AdminGoodsDAO agDAO = new AdminGoodsDAO();
		
		Vector orVector = agDAO.detailOrder(tradeNum);
		List goodsList = (List)orVector.get(0);
		List orderList = (List)orVector.get(1);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("goodsList", goodsList);
		
		
		forward.setPath("./goods_order/order_confirm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
