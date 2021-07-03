package com.question.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;

public class QueDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberDeleteAction_execute() 호출");
		
		//한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pass)
		int Qnum = Integer.parseInt(request.getParameter("Qnum"));

		System.out.println("넘어온 Qnum값은 @@@@@@@@@@@@@@@@@@@@ : " + Qnum);

        
		QuestionDAO qdao = new QuestionDAO();
        int check = qdao.deleteQue(Qnum);

        
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        
        if(check == -1){
        	out.print("<script>");
        	out.print(" alert('존재하지 않는 질문글 입니다.'); ");
        	out.print(" history.back(); ");
        	out.print("</script>");
        	out.close();
        	return null;        	
        }
        
     // 페이지 이동 (./FaqList.faq)
    ActionForward forward = new ActionForward();
	forward.setPath("./Question.que");
	forward.setRedirect(true);
	return forward;
	}

}
