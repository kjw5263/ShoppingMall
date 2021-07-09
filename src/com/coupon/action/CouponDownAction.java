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
	
		request.setCharacterEncoding("UTF-8");
		
		int couponNum = Integer.parseInt(request.getParameter("couponNum"));
		String userId = request.getParameter("userId");
		
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(">>>>>>>>>>CDA>>>>>>>>>>>>>>>>>>>>>>>>"+couponNum+" ,"+userId);
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++");		
		
		CouponDAO cdao = new CouponDAO();
		
		//  1 = 쿠폰이 발급되었습니다!
		//  2 = 이미 발급 받은 쿠폰입니다!
		//  3 = 발급 조건에 맞지않습니다!
		
		int result = 0;
		
		result = cdao.couponCheck(userId, couponNum);
	
		PrintWriter out = response.getWriter();
		
			out.print(result);
			out.close();
		
		return null;
	
	
	}
	
}
