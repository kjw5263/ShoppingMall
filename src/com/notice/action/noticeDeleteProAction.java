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
		
		
		
		noticeDTO notit = new noticeDTO();
		
		String realPath = "C:\\Users\\ITWILL\\git\\ShoppingMall\\WebContent\\upload";
		
		   System.out.println("실제 저장위치 : "+realPath);
		   
		   // 파일업로드 크기지정(10mb);
		   int maxSize = 10 * 1024 * 1024;
		  
		  
		 DefaultFileRenamePolicy pp = new  DefaultFileRenamePolicy();
		   
		   // 1) 파일업로드
		  MultipartRequest multi =
		            new MultipartRequest(
		            		request,
		            		realPath,
		            		maxSize,
		            		"UTF-8",
		            		 pp 
		            		);
		  
		
		   
		
		notit.setNoticeTitle(multi.getParameter("title"));
		notit.setNoticeContent(multi.getParameter("content"));
		notit.setNoticeType(Integer.parseInt(multi.getParameter("imp2")));
		notit.setNoticeFile(multi.getParameter("filename"));
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		System.out.println(notit.toString());
		noti.insertNotice(notit);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticedelpro.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
