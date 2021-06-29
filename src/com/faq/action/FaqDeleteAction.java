package com.faq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.faq.action.ActionForward;
import com.faq.db.FaqDAO;

public class FaqDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
System.out.println("M : MemberDeleteAction_execute() 호출");
		
		//한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pass)
		int faqNum = Integer.parseInt(request.getParameter("faqNum"));

		System.out.println("넘어온 faqNum값은 @@@@@@@@@@@@@@@@@@@@ : " + faqNum);

        
        FaqDAO dao = new FaqDAO();
        int check = dao.deleteFaq(faqNum);

        
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        
        if(check == -1){
        	out.print("<script>");
        	out.print(" alert('존재하지 않는 게시글입니다.'); ");
        	out.print(" history.back(); ");
        	out.print("</script>");
        	out.close();
        	return null;        	
        }
        
     // 페이지 이동 (./FaqList.faq)
    ActionForward forward = new ActionForward();
	forward.setPath("./FaqList.faq");
	forward.setRedirect(true);
	return forward;
}

}
