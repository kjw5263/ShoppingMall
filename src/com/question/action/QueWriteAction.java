package com.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class QueWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pass)
		String Qsub = request.getParameter("Qsub");
	
		// DAO객체 생성 -> idCheck(id,pass)
		QuestionDAO qdao = new QuestionDAO();
		qdao.queWrite(Qsub);
		
		System.out.println("질문 글쓰기 완료");
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./Question.que");
		forward.setRedirect(true);
		return forward;
		
	}

}
