package com.order.action;


import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class OrderStart implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 세션 처리 */
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		ActionForward forward = new ActionForward();
		if(userId == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		// 1. 장바구니 DB의 장바구니 정보 가져오기
		BasketDAO bkDAO = new BasketDAO();
		Vector totalVector = bkDAO.getBasketList(userId);
	
		
		// 1-1. 장바구니 정보와 해당 상품정보들 꺼내기
		List basketList = (List)totalVector.get(0);
		List goodsList = (List)totalVector.get(1);
		
		
		// 2. 주문자정보 가져오기
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = mDAO.getMemberInfo(userId);
		List couponList = mDAO.getCoupon(userId);
		
		// 주문에 필요한 정보를 attribute 영역에 저장하여 jsp로 넘기기
		request.setAttribute("basketList", basketList);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("memberDTO", mDTO);
		request.setAttribute("couponList", couponList);
			

		// 주문 페이지로 이동
		forward.setPath("./goods_order/goods_buy.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
