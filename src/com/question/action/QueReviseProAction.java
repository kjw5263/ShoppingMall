package com.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.db.FaqDAO;
import com.faq.db.FaqDTO;
import com.question.action.ActionForward;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class QueReviseProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : QueReviseAction_execute() 호출");
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pass)
		int Qnum = Integer.parseInt(request.getParameter("Qnum"));
		String Qsub = request.getParameter("Qsub");

		// DAO객체 생성 -> idCheck(id,pass)
		QuestionDAO qdao = new QuestionDAO();
		qdao.queRevisePro(Qnum, Qsub);
		
		System.out.println("고객센터 글 수정 완료");
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./Question.que");
		forward.setRedirect(true);
		return forward;
	}

}
