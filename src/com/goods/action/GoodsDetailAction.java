package com.goods.action;

import com.goods.db.GoodsDAO;
import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;
import com.goods_board.db.PageInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class GoodsDetailAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : GoodsDetailAction_execute() 호출");


        ArrayList<GoodsReviewDTO> reviewList = new ArrayList<GoodsReviewDTO>();
       int page = 1;
       int limit = 10;
        int cosNum = 0;

        if (request.getParameter("page") !=null){
            page = Integer.parseInt(request.getParameter("page"));
        }
        if (request.getParameter("cosNum")!=null){
            cosNum = Integer.parseInt(request.getParameter("cosNum"));
        }

        // DAO 객체 생성 - getGoods(cosNum);
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        int listCount =grdao.getReviewCount(cosNum);
        reviewList = grdao.selectReviewList(page,limit,cosNum);
        int maxPage = (int)((double) listCount/limit + 0.95);
        int startPage = (((int) ((double)page/10+0.9)) -1) *10+1;
        int endPage = startPage+10-1;
        if (endPage>maxPage) endPage = maxPage;
        PageInfo pageInfo = new PageInfo();
        pageInfo.setEndPage(endPage);
        pageInfo.setListCount(listCount);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setStartPage(startPage);
        request.setAttribute("pageInfo" , pageInfo);
        request.setAttribute("reviewList", reviewList);
        GoodsDAO gdao = new GoodsDAO();
        request.setAttribute("goods",gdao.getGoods(cosNum));
        ActionForward forward =  new ActionForward();
        forward.setPath("./goods/goods_detail.jsp");
        forward.setRedirect(false);

        return forward;

    }
}
