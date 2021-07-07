package com.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;

public class QueReviseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("M : FqaReviseAction_execute() 호출");
	
	//한글처리 
	request.setCharacterEncoding("UTF-8");
	
	// 전달정보 저장(id,pass)
	int Qnum = Integer.parseInt(request.getParameter("Qnum"));

	System.out.println("넘어온 Qnum값은 @@@@@@@@@@@@@@@@@@@@ : " + Qnum);
    
	QuestionDAO qdao = new QuestionDAO();
	
    String Qsub = qdao.reviseQue(Qnum);

    request.setAttribute("Qsub", Qsub);
    request.setAttribute("Qnum", Qnum);
        
     // 페이지 이동 (./FaqList.faq)
    ActionForward forward = new ActionForward();
	forward.setPath("./question/queRevise.jsp");
	forward.setRedirect(false);
	return forward;
	}

}
