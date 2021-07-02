package com.admin.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;

public class AdminCouponListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminCouponListAction_execute() 호출");

		// 세션제어 (세션+관리자)
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null || !userId.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		// DAO 객체 -> 쿠폰 정보 전부 가져오기(list형태)
		AdminGoodsDAO dao = new AdminGoodsDAO();
		List couponList = dao.getAdminCouponList();
		
		// list 정보를 저장
		request.setAttribute("couponList", couponList);
		
		//페이지 이동
		forward.setPath("./admingoods/admin_coupon_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
