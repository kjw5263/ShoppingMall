package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import com.admin.goods.db.AdminGoodsDAO;

public class AdminGoodsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminGoodsDeleteAction_execute() 호출");
		
		// 삭제할 상품번호 저장(파라미터값)
		int cosNum = Integer.parseInt(request.getParameter("cosNum"));
		
		// DAO 객체 생성 - deleteGoods(cosNum);
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.deleteGoods(cosNum);
		
		// 페이지 이동(./AdminGoodsList.ag)
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminGoodsList.ag");
		forward.setRedirect(true);
		return forward;
		
	}


}
