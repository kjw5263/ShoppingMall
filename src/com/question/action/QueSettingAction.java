package com.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;
import com.question.db.QuestionScoreDTO;

public class QueSettingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장
		int score1 = Integer.parseInt(request.getParameter("score1"));
		int score2 = Integer.parseInt(request.getParameter("score2"));
		int score3 = Integer.parseInt(request.getParameter("score3"));
		int score4 = Integer.parseInt(request.getParameter("score4"));
		int score5 = Integer.parseInt(request.getParameter("score5"));
	
		QuestionScoreDTO qsdto = new QuestionScoreDTO();
		
		qsdto.setScore1(score1);
		qsdto.setScore2(score2);
		qsdto.setScore3(score3);
		qsdto.setScore4(score4);
		qsdto.setScore5(score5);
		
		// DAO객체 생성 -> idCheck(id,pass)
		QuestionDAO qdao = new QuestionDAO();
		qdao.queSetting(qsdto);
		
		System.out.println("질문 세팅 완료");
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./Question.que");
		forward.setRedirect(true);
		return forward;
		
	}

}
