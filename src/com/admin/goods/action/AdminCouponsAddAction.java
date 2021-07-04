package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;
import com.coupon.db.CouponDTO;

public class AdminCouponsAddAction implements Action {

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
		
		request.setCharacterEncoding("utf-8");
		
		CouponDTO cdto = new CouponDTO();
		cdto.setCouponDc(Integer.parseInt(request.getParameter("couponDc")));
		cdto.setCouponName(request.getParameter("couponName"));
		cdto.setCouponNote(request.getParameter("couponNote"));
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.insertCoupons(cdto);
		
		// 페이지 이동(./AdminGoodsList.ag)	
		forward.setPath("./AdminCouponList.ag");
		forward.setRedirect(true);
		return forward;
		
	}

}
