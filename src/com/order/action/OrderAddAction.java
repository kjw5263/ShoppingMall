package com.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.coupon.db.CouponDTO;
import com.goods.db.GoodsDTO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class OrderAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		ActionForward forward = new ActionForward();
		//System.out.println("OrderAddction >>>>> " + userId);
		/* 세션 처리 */
		if(userId == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("userId");
		
		OrderDTO oDTO = new OrderDTO();
		
		
		/* 주문 테이블에 데이터 추가 */
		// 주문자 정보 (Order Table)
		oDTO.setO_userId(user_id);
	
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
		
		/* 주문 목록에 상품정보 넣기 위해 데이터 가져오기 */
		OrderDAO orDAO = new OrderDAO();
		BasketDAO bkDAO = new BasketDAO();
		Vector totalList = bkDAO.getBasketList(userId);
		
		// 1-1. 장바구니 정보와 해당 상품정보들 꺼내기
		List<BasketDTO> basketList = (List<BasketDTO>)totalList.get(0);
		List<GoodsDTO> goodsList = (List<GoodsDTO>)totalList.get(1);
		String tradeNumber =orDAO.addOrder(oDTO, basketList, goodsList);
		
		
		/* 사용자 테이블에 누적사용금액, 사용한 포인트 차감, 레벨 변경 */
		orDAO.updateUserInfo(oDTO);
		
		/* 장바구니 삭제하기 */
		bkDAO.basketDelete(userId);
		
		/* 사용한 쿠폰 삭제하기 */
		String mccp = request.getParameter("mcCouponNum");
		if(!mccp.equals("")) {
			int cpUse = Integer.parseInt(request.getParameter("mcCouponNum"));
			if (cpUse != -1) {
				CouponDTO cDTO = new CouponDTO();
				cDTO.setMcCouponNum(cpUse);
				cDTO.setMcUserID(userId);
				orDAO.deleteCoupon(cDTO);
			}
		}
		System.out.println(">>>>>>>>>>>OrderAdd 에서의 넘버는 ? >>>>>>>> " +tradeNumber);
		
		//request.setAttribute("tradeNumber", tradeNumber);
		session.setAttribute("tradeNumber", tradeNumber);
		
		forward.setPath("./OrderConfirm.or");
		forward.setRedirect(true);
		return forward;
	}
}
