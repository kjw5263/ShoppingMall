package com.coupon.action;

import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coupon.db.CouponDAO;
import com.coupon.action.ActionForward;

public class CouponDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		int couponNum = 0;
		couponNum = Integer.parseInt(request.getParameter("couponNum"));
		String userId = (String) request.getParameter("userId");
		
		
		//쿠폰번호가 1일때 -> insert 해주기
		//
		
		

		
		PrintWriter out = response.getWriter();
		
		out.print("1");
		
		
		out.close();
		
		
		
		return null;

		
		
		

		
		
		
		
		
	
	}

	
	
	
}
