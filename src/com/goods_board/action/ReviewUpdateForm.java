package com.goods_board.action;

import com.goods.db.GoodsDAO;
import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ReviewUpdateForm implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        request.setAttribute("list",grdao.getReview(id));
        GoodsDAO gdao = new GoodsDAO();
        ActionForward forward = new ActionForward();
        forward.setPath("./goods_board/review_update.jsp");

        return forward;
    }
}
