package com.goods_board.controller;


import goods_board.action.Action;
import goods_board.action.ActionForward;
import goods_board.action.ReviewListAction;
import goods_board.action.ReviewWriteFormAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.rev")
public class ReviewFrontController extends HttpServlet {

    protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("C : GoodsFrontController_doProcess() 호출");
        /******************* 1.페이지 주소 파싱 ********************************/
        // 가상주소 전체 가져오기
        String requestURI = req.getRequestURI();
        // 프로젝트명 가져오기
        String contextPath = req.getContextPath();
        // 필요한 가상주소 생성
        String command = requestURI.substring(contextPath.length());

        System.out.println("command : "+command);
        System.out.println("C : 1.페이지 주소 파싱 완료 ");
        /******************* 1.페이지 주소 파싱 ********************************/

        /******************* 2.페이지 주소 매핑(연결) ****************************/
        Action action = null;
        ActionForward forward = null;

        if (command.equals("/reviewForm.rev")){
            forward = new ActionForward();
            forward.setPath("./goods_board/review.jsp");

        }

        else if (command.equals("/reviewFormPro.rev")){
            System.out.println("C : ");
            action = new ReviewWriteFormAction();
            try {
                forward = action.execute(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else if (command.equals("/reviewList.rev")){
            action = new ReviewListAction();
            try {
                forward = action.execute(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




        /******************* 2.페이지 주소 매핑(연결) ****************************/

        /******************* 3.페이지 주소 이동 ********************************/
        if(forward != null){ // 페이지 이동정보가 있다.
            if(forward.isRedirect()){ //true
                resp.sendRedirect(forward.getPath());
                System.out.println("C : sendRedirect() 방식, "+forward.getPath()+" 페이지 이동");
            }else{ //false
                RequestDispatcher dis =
                        req.getRequestDispatcher(forward.getPath());
                dis.forward(req, resp);
                System.out.println("C : forward() 방식, "+forward.getPath()+" 페이지 이동");
            }
            System.out.println("C : 3.페이지 주소 이동 완료");
        }
        System.out.println("C : 3.페이지 주소 이동 X(컨트롤러 이동X)");
        /******************* 3.페이지 주소 이동 ********************************/



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("C : GoodsFrontController_doGet()호출 ");
        doProcess(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("C : GoodsFrontController_doPost()호출 ");
        doProcess(req, resp);
    }

}
