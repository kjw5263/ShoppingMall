package com.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.me")
public class MemberFrontController extends HttpServlet{

	
	// Get, Post 방식 상관없이 한번에 주소를 처리할 수 있는 메소드
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : Member_doProcess() 호출");
		
		
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
		
		
		
		/********************************* 2. 페이지 주소 매핑(연결) 시작 *******************/
		// -> 특정 주소일때 실행할 기능들 정의해주기
		// 같은 패키지 안에 있는 Action을 호출 해주어야함!
		Action action = null;
		ActionForward forward = null;
		
		// http://localhost:8088/Model2JSP2/MemberJoin.me
				if (command.equals("/MemberJoin.me")) {
					// 회원가입 페이지 -> view 페이지
					// 1. response 이동 (주소o,페이지o 변경)
					// response.sendRedirect("주소");

					// 2. forward 이동 (주소x, 페이지o 변경)
					// RequestDispatcher dis
					// = request.getRequestDispatcher("주소");
					// dis.forward(request, response);

					System.out.println("2 : /MemberJoin.me 주소 호출");

					forward = new ActionForward();
					forward.setPath("./member/insertForm.jsp");
					forward.setRedirect(false);
					
				}else if(command.equals("/Main.me")){
					System.out.println("C : /Main.me 호출");
					
					forward = new ActionForward();
					forward.setPath("./main/main.jsp");
					forward.setRedirect(false);
					
				}else if(command.equals("/MemberLogin.me")){
					System.out.println("C : /MemberLogin.me 호출");
					// 화면을 보여주기=> view페이지로 이동
					
					forward = new ActionForward();
					forward.setPath("./member/login.jsp");
					forward.setRedirect(false);
					
				}else if(command.equals("/MemberLoginAction.me")){
					System.out.println("C : /MemberLoginAction.me 호출");
					// DB 사용 => MemberLoginAction() 객체를 생성해야함.
					action = new MemberLoginAction();
					System.out.println("C : 로그인처리 메소드 호출");
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
//				else if(command.equals("/MemberInfo.me")){
//					System.out.println("C : /MemberInfo.me 호출");
//					// DB정보를 가져와서 view페이지에 출력
//					// MemberInfoAction() 객체 생성
//					action = new MemberInfoAction();
//					try {
//						forward = action.execute(request, response);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//					
//				}else if(command.equals("/MemberLogout.me")){
//					System.out.println("C : /MemberLogout.me 호출");
//					// MemberLogoutAction() 객체 생성
//					action = new MemberLogoutAction();
//					
//					try {
//						forward = action.execute(request, response);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}	
		
		
		
		System.out.println("C : 2. 페이지 주소 매핑 완료 ");
		/********************************* 2. 페이지 주소 매핑(연결) 끝 *******************/
	
		
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
		System.out.println("C : Member_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : Member_doPost() 호출");
		doProcess(request, response);
	}
	
}