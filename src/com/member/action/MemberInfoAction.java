package com.member.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.goods.db.GoodsDTO;
import com.like.db.LikeDAO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;
import com.order.db.OrderDAO;

public class MemberInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberInfoAction_execute");
		
		HttpSession session = request.getSession();
		
		String userId = (String)session.getAttribute("userId");
		ActionForward forward = new ActionForward();
		if(userId==null){
			
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMemberInfo(userId);
		
		LikeDAO ldao = new LikeDAO();
		List LikeList = ldao.getLikeList(userId);
		List couponList = mdao.getCoupon(userId);
	    
		request.setAttribute("couponList", couponList);
		request.setAttribute("LikeList", LikeList);
		request.setAttribute("mdto", mdto);
		
		OrderDAO odao = new OrderDAO();
		Vector totalList = odao.getOrderList(userId);
		request.setAttribute("orderList", totalList.get(0));
		
		
		forward.setPath("./member/info.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
	
	
}
