package com.goods.action;
import com.goods.db.GoodsDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoodsDetailAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : GoodsDetailAction_execute() 호출");

        int cosNum = Integer.parseInt(request.getParameter("cosNum"));

        // DAO 객체 생성 - getGoods(cosNum);
        GoodsDAO gdao = new GoodsDAO();

        request.setAttribute("goods", gdao.getGoods(cosNum));

        ActionForward forward =  new ActionForward();
        forward.setPath("./goods/goods_detail.jsp");
        forward.setRedirect(false);

        return forward;

    }
}
