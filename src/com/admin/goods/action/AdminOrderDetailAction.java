package com.admin.goods.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class AdminOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminCouponsModifyAction_execute() 호출");

		// 세션제어 (세션+관리자)
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null || !userId.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		String o_tradeNum = request.getParameter("o_tradeNum");
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();

		Vector totalDetail = agdao.detailOrder(o_tradeNum);
		request.setAttribute("detailGoods", totalDetail.get(0));
		request.setAttribute("detailOrder", totalDetail.get(1));
		
		forward = new ActionForward();
		forward.setPath("./admingoods/admin_order_detail.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
