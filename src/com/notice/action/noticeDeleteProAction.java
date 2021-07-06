package com.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.noticeDTO;
import com.notice.db.setnoticetool;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.util.List;



import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;

public class noticeDeleteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("M : noticeDeleteProAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		NoticeDAO noti = new NoticeDAO();
		
		
		
		String noticeNum = (String)request.getParameter("noticeNum");
		System.out.println("여기임!!! +"+noticeNum);
		noti.deleteNotice(noticeNum);
		
		
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticedelpro.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
