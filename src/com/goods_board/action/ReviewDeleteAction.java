package com.goods_board.action;

import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewDeleteAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
        ActionForward forward = new ActionForward();
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        grdao.deleteReview(reviewNum);
        forward.setPath("./ReviewList.rev");
        forward.setRedirect(true);
        return forward;
    }
}
