package com.question.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.action.FaqReviseAction;
import com.faq.action.FaqReviseProAction;
import com.faq.action.FaqWriteAction;
import com.question.action.ActionForward;

@WebServlet("*.que")
// http://localhost:8088/ShoppingMall/OrderStart.or
public class QuestionFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/********************************* 1. 페이지 주소 파싱 *************************/
		// (1) 가상주소 전체 가져오기
		String requestURI = request.getRequestURI();
		
		// (2) 프로젝트명 가져오기
		String ContextPath = request.getContextPath();
		
		// (3) 필요한 가상주소 생성
		String command = requestURI.substring(ContextPath.length());
		System.out.println("C : 1.페이지 주소 파싱 >>> " + command);
		
		/********************************* 1. 페이지 주소 파싱 *************************/
		
		
		
		/********************************* 2. 페이지 주소 매핑(연결) *******************/
		// -> 특정 주소일때 실행할 기능들 정의해주기
		// 같은 패키지 안에 있는 Action을 호출 해주어야함!
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/Question.que")){
			System.out.println("C : /Question.me 호출");
			action = new QuestionListAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
		}
		
		else if(command.equals("/QuestionConfirm.que")){
			
			System.out.println("C : /Question.me 호출");
			action = new QueConfirmAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
		}
		
		else if(command.equals("/QueDelete.que")){
			
			System.out.println("C : /QueDelete.que 호출");
			
			 action = new QueDeleteAction();

	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
			
		}
		else if(command.equals("/QueWrite.que")){
			
			System.out.println("2 : /QueWrite.que 주소 호출");

			forward = new ActionForward();
			forward.setPath("./question/queWrite.jsp");
			forward.setRedirect(false);
			
		}
		else if(command.equals("/QueWriteAction.que")) {

			System.out.println("2 : /QueWriteAction.que 주소 호출");

			action = new QueWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/QueRevise.que")) {

			System.out.println("2 : /QueRevise.que 주소 호출");

			action = new QueReviseAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/QueReviseProAction.que")) {

			System.out.println("2 : /QueReviseProAction.que 주소 호출");

			action = new QueReviseProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/Customized.que")) {

			System.out.println("2 : /Customized.que 주소 호출");

			action = new CustomizedAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		else if(command.equals("/QueSetting.que")){
//			
//			System.out.println("2 : /QueSetting.que 주소 호출");
//
//			forward = new ActionForward();
//			forward.setPath("./question/queSetting.jsp");
//			forward.setRedirect(false);
//			
//		}
		
		else if(command.equals("/QueSetting.que")){
			System.out.println("2 : /Customized.que 주소 호출");

			action = new QueSettingListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		else if(command.equals("/QueSettingAction.que")) {

			System.out.println("2 : /QueSettingAction.que 주소 호출");

			action = new QueSettingAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		
		
		/********************************* 2. 페이지 주소 매핑(연결) *******************/
	
		
		/******************* 3. 페이지 주소 이동 종류를 정하기 (제어) *******************/
		// forward 가 null 이 아닐 때 : 페이지 이동 정보가 있을 때 
		if(forward != null){
			if(forward.isRedirect()){ // TRUE일 때, 
				response.sendRedirect(forward.getPath());
			} else { // FALSE일 때
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
		
		/******************* 3. 페이지 주소 이동 종류를 정하기 (제어) *******************/
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}

