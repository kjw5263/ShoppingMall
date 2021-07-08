package com.coupon.action;

import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coupon.db.CouponDAO;
import com.coupon.action.ActionForward;

public class CouponEventAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		
			HttpSession session = request.getSession();
		
			String userId = request.getParameter("userId");
			session.setAttribute("userId", userId);
		
			CouponDAO cdao = new CouponDAO();
		
			List couponNumList = cdao.couponNumList();
			request.setAttribute("couponList", couponNumList);
			
			ActionForward forward = new ActionForward();
		
			forward.setPath("./couponInfo.cp");
			forward.setRedirect(true);
			return forward; 
	
	
	}
	
	
}
