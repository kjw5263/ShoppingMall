package com.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.noticeDTO;

import java.util.List;



import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;

public class noticeWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("M : noticeWriteAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		
		
		
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		NoticeDAO noti = new NoticeDAO();
		noticeDTO notit = (noticeDTO)request.getAttribute("noti");
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		
		noti.insertNotice(notit);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticewrite.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
