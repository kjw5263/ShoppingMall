package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;
import com.coupon.db.CouponDTO;

public class AdminCouponsModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminCouponsModifyFormAction_execute() 호출");
		
		// 전달된 파라미터값 num 저장
		int couponNum = Integer.parseInt(request.getParameter("couponNum"));
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		CouponDTO dto = agdao.getCoupons(couponNum);
		
		// 저장
		request.setAttribute("dto", dto);
		
		// 페이지 이동(admin_coupons_modify.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./admingoods/admin_coupons_modify.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
