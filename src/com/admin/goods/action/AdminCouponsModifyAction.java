package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;
import com.coupon.db.CouponDTO;

public class AdminCouponsModifyAction implements Action {

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
	
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 수정할 정보를 저장(DTO)
		// 폼태그에서 전달되는 정보
		CouponDTO cdto = new CouponDTO();
		cdto.setCouponNum(Integer.parseInt(request.getParameter("couponNum")));
		cdto.setCouponName(request.getParameter("couponName"));
		cdto.setCouponNote(request.getParameter("couponNote"));
		cdto.setCouponDc(Integer.parseInt(request.getParameter("couponDc")));
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.modifyCoupons(cdto);
		
		// 페이지 이동
		forward.setPath("./AdminCouponList.ag");
		forward.setRedirect(true);
		return forward;
	}

}
