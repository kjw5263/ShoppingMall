package com.order.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;
import com.order.db.OrderDAO;

public class OrderStartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : OrderStartAction_execute() 호출!");
		
		/* 세션 처리 */
		// HttpSession session = request.getSession();
		// String id = (String)session.getAttribute("id");
		String userId = "jiwon";
		
		ActionForward forward = new ActionForward();
		/*if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}*/
		
		
		// 1. 장바구니 DB의 장바구니 정보 가져오기
		OrderDAO orDAO = new OrderDAO();
		Vector totalVector = orDAO.getBasketList(userId);
		
		// 1-1. 장바구니 정보와 해당 상품정보들 꺼내기
		ArrayList basketList = (ArrayList)totalVector.get(0);
		ArrayList goodsList = (ArrayList)totalVector.get(1);
		
		// 2. 주문자정보 가져오기
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = mDAO.getMemberInfo(userId);
		
		// 주문에 필요한 정보를 attribute 영역에 저장하여 jsp로 넘기기
		request.setAttribute("basketList", basketList);
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("memberDTO", mDTO);
		
		// 주문 페이지로 이동
		forward.setPath("./goods_order/goods_buy.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
