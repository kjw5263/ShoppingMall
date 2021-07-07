package com.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;
import com.question.db.QuestionScoreDTO;

public class QueConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");

		int sum = Integer.parseInt(request.getParameter("sum"));
	
		QuestionScoreDTO qsdto;
		
		
		
		QuestionDAO qdao = new QuestionDAO();
		qsdto = qdao.QueListAction();
		
		
		request.setAttribute("sum", sum);
		request.setAttribute("qsdto", qsdto);
		
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./question/questionConfirm.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
