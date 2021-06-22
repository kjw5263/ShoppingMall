package com.goods_board.action;

import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewWriteFormAction implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");

        GoodsReviewDTO grdto = new GoodsReviewDTO();
        grdto.setCosNum(Integer.parseInt(request.getParameter("cosNum")));
        grdto.setUserid(request.getParameter("userId"));
        grdto.setReviewImage(request.getParameter("reviewImage"));
 /*       grdto.setRating(Integer.parseInt(request.getParameter("rating")));*/
        grdto.setReviewContent(request.getParameter("reviewContent"));
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        grdao.createReview(grdto);
        ActionForward forward = new ActionForward();
        forward.setPath("/");
        forward.setRedirect(false);



        return forward;
    }
}
