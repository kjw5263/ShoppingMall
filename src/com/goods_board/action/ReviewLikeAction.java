package com.goods_board.action;

import com.goods_board.action.Action;
import com.goods_board.action.ActionForward;
import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;
import com.goods_board.db.Review_likeDAO;
import com.goods_board.db.Review_likeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class ReviewLikeAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("userId");
        int cosNum = Integer.parseInt(request.getParameter("cosNum"));
        int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        GoodsReviewDTO grdto = new GoodsReviewDTO();
        Review_likeDAO likeDAO = new Review_likeDAO();
        Review_likeDTO likeDTO = new Review_likeDTO();
        likeDTO.setUserId(id);
        likeDTO.setCosNum(cosNum);
        likeDTO.setReviewNum(reviewNum);
        int check = likeDAO.checkLike(id,reviewNum);
        ActionForward forward = new ActionForward();

        if (check==1){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('이미 글을 등록 하셨습니다.')");
            out.println("location.href='/'");
            out.println("</script>");
            out.close();

            return null;
        }
        else {
            grdao.reviewUp(reviewNum);
            likeDAO.insertLike(likeDTO);
        }
        forward.setPath("./GoodsDetail.cos?cosNum="+cosNum);
        forward.setRedirect(false);
        return forward;





    }
}
