package com.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.basket.db.BasketDTO;
import com.goods.db.GoodsDAO;
import com.goods.db.goodsbasket;
import com.goods.db.listDAO;
import com.var.list.varlist;

public class GoodsBasketAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : GoodsBasketAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// 파라미터를 처리
		// item=best
		String id = request.getParameter("userId");
		
		String userID = (String)session.getAttribute("userId");
		String goodnum = request.getParameter("userId");
		ActionForward forward = new ActionForward();
		if(userID == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		BasketDTO bkDTO = new BasketDTO();
		bkDTO.setBasketCosAmount(Integer.parseInt(request.getParameter("cosAmount")));
		bkDTO.setBasketCosNum(Integer.parseInt(request.getParameter("cosNum")));
		bkDTO.setBasketUserId(userID);
		
		goodsbasket gbgb = new goodsbasket();
		gbgb.doit(bkDTO);
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		
		// 정보 저장 -> 영역 저장
//		 request.setAttribute("goodsList", gdao.getGoodsList());
		
		
		
		// 페이지 이동
		
		forward.setPath("./goods/goodsBasketPro.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
