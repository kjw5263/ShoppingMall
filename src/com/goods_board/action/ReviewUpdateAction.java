package com.goods_board.action;

import com.goods.db.GoodsDAO;
import com.goods_board.action.Action;
import com.goods_board.action.ActionForward;
import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ReviewUpdateAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        request.setCharacterEncoding("UTF-8");
        int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
        ActionForward forward = new ActionForward();
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        GoodsReviewDTO grdto = new GoodsReviewDTO();
        grdto.setRating(Integer.parseInt(request.getParameter("rating")));
        grdto.setReviewContent(request.getParameter("reviewContent"));
        grdao.updateReview(reviewNum,grdto);
        forward.setPath("/reviewList.rev");
        forward.setRedirect(false);

        return forward;
    }
}
