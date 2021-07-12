package com.order.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import java.util.logging.SimpleFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coupon.db.CouponDAO;
import com.order.db.OrderDAO;

public class OrdercheckAction implements Action{

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
		
		OrderDAO odao = new OrderDAO();
		Vector totalList = odao.getOrderList(userId);
		request.setAttribute("orderList", totalList.get(0));
		request.setAttribute("goodsList", totalList.get(1));
		
	
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		int searchmonth;
		if(request.getParameter("searchmonth").equals(null)){
			searchmonth = 0;
		}
		searchmonth = Integer.parseInt(request.getParameter("searchmonth"));
		
		Vector totalList2 = new Vector();
		Vector totalList3 = new Vector();
		
		
		if(startdate != null && enddate != null){
		System.out.println("특정기간 주문조회 메서드 실행");
		totalList2 = odao.orderck(startdate, enddate, userId);
		request.setAttribute("orderckList1", totalList2.get(0));
		request.setAttribute("goodsckList1", totalList2.get(1));
		
		}else if(searchmonth != 0){
		Calendar today = Calendar.getInstance();
		today.setTime(new Date());
		today.add(Calendar.MONTH, -searchmonth);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String searchmonth2 = dateFormat.format(today.getTime());
		System.out.println("써치 먼쓰.." +searchmonth2);
		
		System.out.println("지정기간 주문 조회 메서드 실행");
		OrderDAO odao2 =new OrderDAO();
		totalList3  = odao2.orderck2(searchmonth2, userId);
		request.setAttribute("orderckList2", totalList3.get(0));
		request.setAttribute("goodsckList2", totalList3.get(1));
		
		}
		
		forward.setPath("./goods_order/showorder.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
