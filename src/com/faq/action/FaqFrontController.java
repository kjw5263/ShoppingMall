package com.faq.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.action.FaqListAction;
import com.member.action.MemberLoginAction;
import com.faq.action.ActionForward;


@WebServlet("*.faq")
public class FaqFrontController extends HttpServlet{

	
	// Get, Post 방식 상관없이 한번에 주소를 처리할 수 있는 메소드
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : FAQ_doProcess() 호출");
		
		
		/********************************* 1. 페이지 주소 파싱 *************************/
		// (1) 가상주소 전체 가져오기
		String requestURI = request.getRequestURI();
		
		// (2) 프로젝트명 가져오기
		String ContextPath = request.getContextPath();
		
		// (3) 필요한 가상주소 생성
		String command = requestURI.substring(ContextPath.length());
		
		System.out.println("command : " + command);
		System.out.println("C : 1.페이지 주소 파싱");
		
		/********************************* 1. 페이지 주소 파싱 *************************/
		
		
		
		/********************************* 2. 페이지 주소 매핑(연결) *******************/
		// -> 특정 주소일때 실행할 기능들 정의해주기
		// 같은 패키지 안에 있는 Action을 호출 해주어야함!
		Action action = null;
		ActionForward forward = null;
		
		if (command.equals("/FaqList.faq")) {

			System.out.println("2 : /FaqList.faq 주소 호출");

			action = new FaqListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/FaqWrite.faq")) {

			System.out.println("2 : /FaqWrite.faq 주소 호출");

			forward = new ActionForward();
			forward.setPath("./faq_board/faqWrite.jsp");
			forward.setRedirect(false);
			
		}
		else if(command.equals("/FaqWriteAction.faq")) {

			System.out.println("2 : /FaqWriteAction.faq 주소 호출");

			action = new FaqWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/FaqDelete.faq")) {

			System.out.println("2 : /FaqDelete.faq 주소 호출");

			action = new FaqDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		else if(command.equals("/FaqRevise.faq")) {

			System.out.println("2 : /FaqRevise.faq 주소 호출");

			action = new FaqReviseAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/FaqReviseProAction.faq")) {

			System.out.println("2 : /FaqReviseProAction.faq 주소 호출");

			action = new FaqReviseProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		System.out.println("C : 2. 페이지 주소 매핑 완료 ");
		/********************************* 2. 페이지 주소 매핑(연결) *******************/
	
		
		/******************* 3. 페이지 주소 이동 종류를 정하기 (제어) *******************/
		// forward 가 null 이 아닐 때 : 페이지 이동 정보가 있을 때 
		if(forward != null){
			if(forward.isRedirect()){ // TRUE일 때, 
				response.sendRedirect(forward.getPath());	// 해당 경로로 이동하기
				System.out.println("C : 페이지 주소 이동 >> sendRedirect() << 방식, " + forward.getPath());
			} else { // FALSE일 때
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("C : 페이지 주소 이동 >> forward << 방식, " + forward.getPath());
			}
			System.out.println("C : 3. 페이지 주소 이동 완료 ");
		}
		
		System.out.println("C : 3. 페이지 주소 이동 X (주소 이동X ) >> forward NULL ");
		
		
		/******************* 3. 페이지 주소 이동 종류를 정하기 (제어) *******************/
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : FAQ_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : FAQ_doPost() 호출");
		doProcess(request, response);
	}
	
}