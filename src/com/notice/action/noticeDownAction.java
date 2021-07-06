package com.notice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;
import com.notice.db.NoticeDAO;

public class noticeDownAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : noticedownAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		
		
		
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/filedown.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
