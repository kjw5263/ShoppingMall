package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;

public class BasketDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : BasketDeleteAction_execute() 호출");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		ActionForward forward = new ActionForward();
		if(userId == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달된 파라미터값 저장 (del-id)
		String[] bNum = request.getParameterValues("del-id");
		// DAO 객체 생성 - basketDelete(basketNum)
		BasketDAO bkdao = new BasketDAO();
		int[] basketNum = new int[bNum.length];
		for(int i=0; i<bNum.length; i++){
			basketNum[i] = Integer.parseInt(bNum[i]);
		}
		
		int result = bkdao.basketDelete(basketNum);
		
		// 페이지 이동 (./BasketList.ba)
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);
		
		return forward;
	}

}
