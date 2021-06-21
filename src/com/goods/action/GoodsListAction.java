package com.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;

public class GoodsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : GoodsListAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		String item = request.getParameter("item");
		
		if(item == null){
			item = "all";
		}
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		listDAO gdao = new listDAO();
	
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		
		// 정보 저장 -> 영역 저장
//		 request.setAttribute("goodsList", gdao.getGoodsList());
		request.setAttribute("goodsList", gdao.getGoodsList(item));
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./goods/goods_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
