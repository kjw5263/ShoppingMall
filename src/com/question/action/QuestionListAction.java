package com.question.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.action.ActionForward;
import com.question.db.QuestionDAO;

public class QuestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		
		// 디비 처리 객체 GoodsDAO 생성
		QuestionDAO qdao = new QuestionDAO();
	
		
		
		
		
		
		
		int cnt = qdao.getListCount();
		
		//////////////////////////////////////////////////////////////////////////////////
		// 게시판 페이징 처리 : DB에서 원하는 만큼만 글 가져오기
		
		// 한페이지당 보여줄 글의 개수
		int pageSize = 5;
		
		// 지금 페이지가 몇 페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
		pageNum = "1";
		}
		
		// 페이지별 시작 행 계산하기
		// 1p -> 1번 글부터, 2p -> 11번 글부터 3p -> 21번 글 부터 ... -> 일반화
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝 행 계산하기
		// 1p -> 10번, 2p -> 20번 ...
		int endRow = currentPage*pageSize;
		
		//////////////////////////////////////////////////////////////////////////////////
		
		// 디비에 저장된 모든 글 정보를 가져오기
		//ArrayList boardList = bdao.getBoardList();
		
		// 디비에 저장된 모든 글 중에서 원하는 만큼만 가져오기.(페이지 사이즈만큼)
		ArrayList boardList = qdao.getBoardList(startRow, pageSize);
		
		
		
		
		
		
		
		
		
		// 정보 저장 -> 영역 저장
		request.setAttribute("queList", qdao.getQueList());
		request.setAttribute("queQueList", qdao.getBoardList(startRow, pageSize));
		request.setAttribute("cnt", qdao.getListCount());
		
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./question/question.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
