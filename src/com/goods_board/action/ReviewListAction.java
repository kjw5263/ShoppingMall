package com.goods_board.action;

import com.goods.db.GoodsDAO;
import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;
import com.goods_board.db.PageInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ReviewListAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : GoodsDetailAction_execute() 호출");
        request.setCharacterEncoding("UTF-8");
        ArrayList<GoodsReviewDTO>reviewUserList;
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        ArrayList<GoodsReviewDTO> reviewList;
        int page = 1;
        int limit = 3;
        if (request.getParameter("page") !=null){
            page = Integer.parseInt(request.getParameter("page"));
        }
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        int listCount =grdao.getUserReviewCnt(userId);
        reviewList = grdao.userReviewList(page,limit,userId);
        int maxPage = (int)((double) listCount/limit + 0.95);
        int startPage = (((int) ((double)page/3+0.9)) -1) *3+1;
        int endPage = startPage+3-1;
        if (endPage>maxPage) endPage = maxPage;
        PageInfo pageInfo = new PageInfo();
        pageInfo.setEndPage(endPage);
        pageInfo.setListCount(listCount);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setStartPage(startPage);
        request.setAttribute("pageInfo" , pageInfo);
        request.setAttribute("reviewList", reviewList);
        request.setAttribute("list",grdao.getReview(userId));
        ActionForward forward = new ActionForward();
        forward.setPath("./goods_board/review_user_list.jsp");
        forward.setRedirect(false);

        return forward;


    }
}
