package com.faq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDTO;
import com.faq.action.ActionForward;
import com.faq.db.FaqDAO;
import com.faq.db.FaqDTO;

public class FaqWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pass)
		String faqCategory = request.getParameter("faqCategory");
		String faqQuestion = request.getParameter("faqQuestion");
		String faqAnswer = request.getParameter("faqAnswer");

		// 전달된 정보 저장(num,amount,size,color)
		// DTO객체안에 저장
		FaqDTO faqdto = new FaqDTO();
		faqdto.setFaqCategory(faqCategory);
		faqdto.setFaqQuestion(faqQuestion);
		faqdto.setFaqAnswer(faqAnswer);
		
		System.out.println("M: "+faqdto);
		
		// DAO객체 생성 -> idCheck(id,pass)
		FaqDAO faqdao = new FaqDAO();
		faqdao.faqWrite(faqdto);
		
		System.out.println("질문게시판 글쓰기 완료");
		
	    // 페이지 이동 (./Main.me)
		ActionForward forward = new ActionForward();
		forward.setPath("./FaqList.faq");
		forward.setRedirect(true);
		return forward;
	}
}
