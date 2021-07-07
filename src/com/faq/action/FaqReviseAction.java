package com.faq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.action.ActionForward;
import com.faq.db.FaqDAO;
import com.faq.db.FaqDTO;

public class FaqReviseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	System.out.println("M : FqaReviseAction_execute() 호출");
	
	//한글처리 
	request.setCharacterEncoding("UTF-8");
	
	// 전달정보 저장(id,pass)
	int faqNum = Integer.parseInt(request.getParameter("faqNum"));

	System.out.println("넘어온 faqNum값은 @@@@@@@@@@@@@@@@@@@@ : " + faqNum);

    
    FaqDAO faqdao = new FaqDAO();
    FaqDTO faqdto = (FaqDTO)faqdao.reviseFaq(faqNum);

    request.setAttribute("faqdto", faqdto);
        
     // 페이지 이동 (./FaqList.faq)
    ActionForward forward = new ActionForward();
	forward.setPath("./faq_board/faqRevise.jsp");
	forward.setRedirect(false);
	return forward;
	}

}
