package com.goods_board.action;

import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewUserListAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : ReviewUserListAction_execute() 호출 ");

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        GoodsReviewDTO grdto = grdao.getReview(id);
        request.setAttribute("grdto",grdto);

        ActionForward forward = new ActionForward();
        forward.setPath("./goods_board/review_user_list.jsp");
        forward.setRedirect(false);
        return forward;
    }
}
