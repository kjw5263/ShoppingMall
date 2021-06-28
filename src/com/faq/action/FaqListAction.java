package com.faq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.action.ActionForward;
import com.faq.db.FaqDAO;

public class FaqListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		String category = request.getParameter("category");
		
		if(category == null){
			category = "all";
		}
		
		// 디비 처리 객체 GoodsDAO 생성
		FaqDAO fdao = new FaqDAO();
	
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		
		// 정보 저장 -> 영역 저장
//				 request.setAttribute("goodsList", gdao.getGoodsList());
		request.setAttribute("faqList", fdao.getFaqList(category));
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./faq_board/faq_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
