package com.notice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;
import com.notice.db.NoticeDAO;
import com.notice.db.noticeDTO;

public class noticeContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : noticeContentAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		
		
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		NoticeDAO noti = new NoticeDAO();
		String num = request.getParameter("noticeNum");
		System.out.println(num);
		int realnum = Integer.parseInt(num);
	    noticeDTO notit = noti.getNoticeData(realnum);
		
		// 정보 저장 -> 영역 저장
		request.setAttribute("noti", notit);
		
		System.out.println("작업함");
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeContent.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
