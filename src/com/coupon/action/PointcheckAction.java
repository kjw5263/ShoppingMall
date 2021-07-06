package com.coupon.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coupon.db.CouponDAO;

public class PointcheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
	
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		int searchmonth = Integer.parseInt(request.getParameter("searchmonth"));

		List orderList = new ArrayList();
		List orderList2 = new ArrayList();
		
		
		if(startdate != null && enddate != null){
		CouponDAO cdao = new CouponDAO();
		orderList = cdao.pointcheck(startdate,enddate,userId);
		}
		
		else if(searchmonth != 0){
		Calendar today = Calendar.getInstance();
		today.setTime(new Date());
		today.add(Calendar.MONTH, -searchmonth);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String searchmonth2 = dateFormat.format(today.getTime());
		System.out.println(searchmonth2  + "애드 후 투데이...후에...데이터 포맷");
		
		
		CouponDAO cdao2 = new CouponDAO();
		orderList2 = cdao2.pointcheck2(searchmonth2, userId);
		}
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("orderList2", orderList2);
		 
		CouponDAO cdao = new CouponDAO();
	    List couponList = cdao.getCoupon(userId);
	    request.setAttribute("couponList", couponList);
	    
	     
	    forward.setPath("./coupon_point/coupon_point.jsp");
		forward.setRedirect(false);
		return forward; 
	}
	
}
