package com.admin.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;

public class AdminOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminCouponsAddAction_execute() 호출");

		// 세션제어 (세션+관리자)
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null || !userId.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// DAO 객체 생성 -> 주문 내역 전부 가져오기
		AdminGoodsDAO dao = new AdminGoodsDAO();
		List orderList = dao.getAdminOrderList();
		
		// list 정보를 저장(request 영역)
		request.setAttribute("orderList", orderList);
		
		// 페이지 이동(forward- ./member/list.jsp)
		forward.setPath("./admingoods/admin_order_list.jsp");
		forward.setRedirect(false);

		return forward;		

	}

}
