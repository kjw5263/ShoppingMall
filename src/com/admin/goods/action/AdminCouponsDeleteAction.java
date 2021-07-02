package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;

public class AdminCouponsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminCouponsDeleteAction_execute() 호출");
		
		// 삭제할 쿠폰번호 저장(파라미터값)
		int couponNum = Integer.parseInt(request.getParameter("couponNum"));
		
		// DAO 객체 생성 - deleteCoupons(couponNum);
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.deleteCoupons(couponNum);		
		
		// 페이지 이동(./AdminGoodsList.ag)
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminCouponList.ag");
		forward.setRedirect(true);
		return forward;
	}

}
