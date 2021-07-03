package com.question.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDTO;
import com.question.action.ActionForward;
import com.question.db.QuestionDAO;

public class CustomizedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : CustomizedAction_execute() 호출");
		
		//한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(id,pass)
		String userSkinType = request.getParameter("userSkinType");
	
		System.out.println("넘어온 userSkinType값은 @@@@@@@@@@@@@@@@@@@@ : " + userSkinType);
	
	    
		QuestionDAO qdao = new QuestionDAO();
	    List CumtomizedList = qdao.CustomizedList(userSkinType);
	
		request.setAttribute("CumtomizedList", CumtomizedList);
	    request.setAttribute("userSkinType", userSkinType);    
	        
	     // 페이지 이동 (./FaqList.faq)
	    ActionForward forward = new ActionForward();
		forward.setPath("./question/queCustomizedList.jsp");
		forward.setRedirect(false);
		return forward;
		}

}
