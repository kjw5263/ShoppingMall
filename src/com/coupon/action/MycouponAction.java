package com.coupon.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coupon.db.CouponDAO;
import com.coupon.db.CouponDTO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MycouponAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MycouponAction_execute");
		
		  HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("userId");
	        
	        ActionForward forward = new ActionForward();
	        if(userId == null){
	        	forward.setPath("./MemberLogin.me");
	        	forward.setRedirect(true);
	        	return forward;
	        }
	        
	     CouponDAO cdao = new CouponDAO();
	     List couponList = cdao.getCoupon(userId);
	     request.setAttribute("couponList", couponList);
	     
	    forward.setPath("./coupon_point/coupon_point.jsp");
		forward.setRedirect(false);
		return forward; 
	}

	
	
}
