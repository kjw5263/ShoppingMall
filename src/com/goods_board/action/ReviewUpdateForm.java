package com.goods_board.action;

import com.goods.db.GoodsDAO;
import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewUpdateForm implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
        ActionForward forward = new ActionForward();
        forward.setPath("./goods_board/review_update.jsp");

        return forward;
    }
}
