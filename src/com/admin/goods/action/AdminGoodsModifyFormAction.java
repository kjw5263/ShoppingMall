package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;
import com.goods.db.GoodsDTO;

public class AdminGoodsModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminGoodsModifyFormAction_execute() 호출");
		
		// 전달된 파라미터값 num 저장
		int cosNum = Integer.parseInt(request.getParameter("cosNum"));
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		GoodsDTO dto = agdao.getGoods(cosNum);
		
		// 저장
		request.setAttribute("dto", dto);
		
		// 페이지 이동(admin_goods_modify.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./admingoods/admin_goods_modify.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
