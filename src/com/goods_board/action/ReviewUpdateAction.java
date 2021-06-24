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
        int cosNum = Integer.parseInt(request.getParameter("cosNum"));
        ActionForward forward = new ActionForward();
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        GoodsReviewDTO grdto = new GoodsReviewDTO();
        GoodsDAO gdao = new GoodsDAO();
        System.out.println("grdao 출력 정보" +grdao);
        request.setAttribute("goods" , gdao.getGoods(cosNum));
        request.setAttribute("grdao" , grdao.getReview(id));
        grdto.setRating(Integer.parseInt(request.getParameter("rating")));
        grdto.setReviewContent(request.getParameter("reviewContent"));
        grdao.updateReview(id,grdto);
        forward.setPath("/");
        forward.setRedirect(false);

        return forward;
    }
}
