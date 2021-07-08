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
	
		
		
		
		
		
		PrintWriter out = response.getWriter();
		
		out.print("성공");
		
		
		out.close();
		
		
		
		return null;

		
		
		

		
		
		
		
		
	
	}

	
	
	
}
