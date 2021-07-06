package com.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.noticeDTO;

import java.util.List;



import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;

public class noticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("M : noticeUpdateAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		
		String pageNum = request.getParameter("pageNum");
		String num = request.getParameter("noticeNum");
		System.out.println(pageNum);
		System.out.println("여기임 = "+num);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeup.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
