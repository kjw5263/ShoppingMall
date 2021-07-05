package com.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;

public class OrderConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// HttpSession session = request.getSession();
		// String id = (String)session.getAttribute("id");
		
		String userId = "jiwon";
		
		/* 세션 처리 */
		/*if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		} */
		
	
		AdminGoodsDAO agDAO = new AdminGoodsDAO();
		Vector orVector = agDAO.detailOrder("20210702-24"); //request.getParameter("tradeNumber")
		List goodsList = (List)orVector.get(0);
		List orderList = (List)orVector.get(1);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("goodsList", goodsList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./goods_order/order_confirm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
