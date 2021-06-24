package com.goods_board.action;

import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class ReviewWriteFormAction implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        ActionForward forward = new ActionForward();
        int cosNum = Integer.parseInt(request.getParameter("cosNum"));
        if (userId == null){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인 해주세요')");
            out.println("location.href='./MemberLogin.me'");
            out.println("</script>");
            out.close();

            return null;
        }
        GoodsReviewDTO grdto = new GoodsReviewDTO();
        GoodsReviewDAO grdao = new GoodsReviewDAO();

        int chekId = grdao.checkUser(userId,cosNum);

        System.out.println("아이디값 체크" + chekId);
        grdto.setCosNum(Integer.parseInt(request.getParameter("cosNum")));
        grdto.setUserid(userId);
        grdto.setReviewImage(request.getParameter("reviewImage"));
        grdto.setRating(Integer.parseInt(request.getParameter("rating")));
        grdto.setReviewContent(request.getParameter("reviewContent"));
        if (chekId==1){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('있어요')");
            out.println("location.href='/'");
            out.println("</script>");
            out.close();

            return null;
        }
        else {
            grdao.createReview(grdto);
        }
        forward.setPath("/GoodsDetail.cos?");
        forward.setRedirect(false);
        return forward;
    }
}
