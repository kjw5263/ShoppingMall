package com.goods_board.action;

import goods.db.GoodsDAO;
import goods_board.db.GoodsReviewDAO;
import goods_board.db.GoodsReviewDTO;
import goods_board.db.PageInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ReviewListAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : GoodsDetailAction_execute() 호출");

        ArrayList<GoodsReviewDTO> reviewList = new ArrayList<GoodsReviewDTO>();
        int startRow = 1;
        int pageSize = 10;
        int cosNum=0;

        if (request.getParameter("pageNum") !=null){
            startRow = Integer.parseInt(request.getParameter("pageNum"));
        }
        if (request.getParameter("cosNum") != null){
            cosNum = Integer.parseInt(request.getParameter("cosNum"));
        }

        // DAO 객체 생성 - getGoods(cosNum);
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        int listCount =grdao.getReviewCount();
        reviewList = grdao.selectReviewList(startRow,pageSize,cosNum);
        int maxPage = (int)((double) listCount/pageSize + 0.95);
        int startPage = (((int) ((double)startRow/10+0.9)) -1) *10+1;
        int endPage = startPage+10-1;

        if (endPage>maxPage) endPage = maxPage;
        PageInfo pageInfo = new PageInfo();
        pageInfo.setEndPage(endPage);
        pageInfo.setListCount(listCount);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(startPage);
        request.setAttribute("pageInfo" , pageInfo);
        request.setAttribute("reviewList", reviewList);

        GoodsDAO gdao = new GoodsDAO();
        request.setAttribute("goods",gdao.getGoods(cosNum));

        ActionForward forward = new ActionForward();
        forward.setPath("./goods_board/review_list.jsp");
        forward.setRedirect(false);

        return forward;


    }
}
