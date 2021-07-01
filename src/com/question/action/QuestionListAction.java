package com.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;

public class QuestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
				request.setCharacterEncoding("utf-8");
				// 파라미터를 처리
				
				// 디비 처리 객체 GoodsDAO 생성
				QuestionDAO qdao = new QuestionDAO();
			
				
				// 정보 저장 -> 영역 저장
				request.setAttribute("queList", qdao.getQueList());
				
				// 페이지 이동
				ActionForward forward = new ActionForward();
				forward.setPath("./question/question.jsp");
				forward.setRedirect(false);
				return forward;
		
	}

}
