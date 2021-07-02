package com.admin.goods.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.ag")
public class AdminGoodsFrontController extends HttpServlet{

	// Get, Post 방식 상관없이 한번에 주소를 처리할 수 있는 메소드
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : AdminGoods_doProcess() 호출");
		
		
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
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/GoodsAdd.ag")){
			System.out.println("C : /GoodsAdd.ag 호출");
			// 정보를 입력받는 페이지 -> view페이지 이동
			
			forward = new ActionForward();
			forward.setPath("./admingoods/admin_goods_write.jsp");
			forward.setRedirect(false);
			
		} else if(command.equals("/GoodsAddAction.ag")){
			System.out.println("C : /GoodsAddAction.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new GoodsAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminGoodsList.ag")){
			System.out.println("C : /AdminGoodsList.ag 호출");
			// DB정보를 사용해서 화면에 출력
			// AdminGoodsListAction() 객체 			
			action = new AdminGoodsListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminGoodsModify.ag")) {
			System.out.println("C : /AdminGoodsModify.ag 호출");
			// DB 정보를 꺼내서 화면에 출력
			// AdminGoodsModifyFormAction();
			
			action = new AdminGoodsModifyFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/AdminGoodsModifyAction.ag")){
			System.out.println("C : /AdminGoodsModifyAction.ag 호출");
			// DB정보를 처리 페이지(list 이동)이동
			// AdminGoodsModifyAction() 객체 생성
			
			action = new AdminGoodsModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminGoodsDelete.ag")){
			System.out.println("C : /AdminGoodsDelete.ag 호출");
			// 상품정보를 바로 DB에서 삭제 -> 상품리스트 이동
			// AdminGoodsDeleteAction() 객체 생성
			action = new AdminGoodsDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		///////////////////////////////////////////////////////////////////////////////////////
		//adminList////////////////////////////////////////////////////////////////////////////
		} else if(command.equals("/AdminMemberList.ag")){
			System.out.println("C : /AdminMemberList.ag 호출");
			// 주문정보 리스트
			action = new AdminMemberListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminCouponList.ag")){
			System.out.println("C : /AdminCouponList.ag 호출");
			// 주문정보 리스트
			action = new AdminCouponListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminCouponsAddAction.ag")){
			System.out.println("C : /AdminCouponsAddAction.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminCouponsAddAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminCouponsModify.ag")){
			System.out.println("C : /AdminCouponsModify.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminCouponsModifyFormAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminCouponsModifyAction.ag")){
			System.out.println("C : /AdminCouponsModifyAction.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminCouponsModifyAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminCouponsDelete.ag")){
			System.out.println("C : /AdminCouponsDelete.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminCouponsDeleteAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminOrderList.ag")){
			System.out.println("C : /AdminOrderList.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminOrderListAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/OrderStatusModify.ag")){
			System.out.println("C : /OrderStatusModify.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminOrderStatusModifyAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminOrderDetail.ag")){
			System.out.println("C : /AdminOrderDetail.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminOrderDetailAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/AdminOrderDelete.ag")){
			System.out.println("C : /AdminOrderDelete.ag 호출");
			// GoodsAddAction() 객체 생성
			action = new AdminOrderDeleteAction();
		
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
		System.out.println("C : AdminGoods_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : AdminGoods_doPost() 호출");
		doProcess(request, response);
	}
	
}
