package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;

public class AdminOrderDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminOrderDeleteAction_execute() 호출");
		
		// 삭제할 주문번호 저장
		String o_tradeNum = request.getParameter("o_tradeNum");
		
		// DAO 객체 생성 - deleteOrder(o_tradeNum);
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.deleteOrder(o_tradeNum);
		
		// 페이지 이동(./AdminGoodsList.ag)
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminOrderList.ag");
		forward.setRedirect(true);
		return forward;		

	}

}
