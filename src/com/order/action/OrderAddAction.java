package com.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basket.db.BasketDTO;
import com.goods.db.GoodsDTO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class OrderAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userId = "jiwon";
		/*if(id == null) {
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		return forward;
	}*/
		ActionForward forward = new ActionForward();

		request.setCharacterEncoding("UTF-8");
		OrderDTO oDTO = new OrderDTO();
		
		
		// 주문자 정보 (Order Table)
		oDTO.setO_userId(request.getParameter("userId"));
	
		// 수령인 정보 (Order Table)
		oDTO.setReceiverName(request.getParameter("receiverName"));
		oDTO.setReceiverEmail(request.getParameter("receiverEmail"));
		oDTO.setReceiverTel(request.getParameter("receiverTel"));
		oDTO.setReceiverTel2(request.getParameter("receiverTel2"));
		oDTO.setReceiverAddr(request.getParameter("zonecode")+","
							+request.getParameter("addr")+","
							+request.getParameter("addr_detail"));
		
		// 배송메세지 (Order Table)
		oDTO.setO_msg(request.getParameter("o_msg"));
		
		// 결제 정보 (Order Table)
		oDTO.setPayerName(request.getParameter("userName"));						// 결제자 이름 -그냥주문자명
		oDTO.setSumMoney(Integer.parseInt(request.getParameter("sumMoneyData")));	//합계금
		oDTO.setPayMoney(Integer.parseInt(request.getParameter("ttmoneyData")));	// 결제 최종금액
		oDTO.setAddPoint(Integer.parseInt(request.getParameter("addPoint")));		// 적립 예정금액
		oDTO.setCpUseAmount(Integer.parseInt(request.getParameter("cpUseAmount")));	// 쿠폰 사용금액(마이너스)
		oDTO.setPtUseAmount(Integer.parseInt(request.getParameter("ptUseAmount")));	// 포인트 사용금액(마이너스)
		
		oDTO.setPayType(request.getParameter("payType"));	// 결제 수단
		
		OrderDAO orDAO = new OrderDAO();
		Vector totalList = orDAO.getBasketList(userId);
		
		// 1-1. 장바구니 정보와 해당 상품정보들 꺼내기
		List<BasketDTO> basketList = (List<BasketDTO>)totalList.get(0);
		List<GoodsDTO> goodsList = (List<GoodsDTO>)totalList.get(1);
		orDAO.addOrder(oDTO, basketList, goodsList);
		
		
		request.getParameter("delCp");		// 사용한 쿠폰 종류
		
		forward.setPath("./OrderConfirm.or");
		forward.setRedirect(false);
		return null;
	}
}
