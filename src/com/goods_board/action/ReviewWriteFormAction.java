package com.goods_board.action;

import com.goods_board.db.GoodsReviewDAO;
import com.goods_board.db.GoodsReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class ReviewWriteFormAction implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        ActionForward forward = new ActionForward();
        ServletContext ctx = request.getServletContext();
        String realpath = ctx.getRealPath("goods_board/upload");
        int maxSize = 5 * 1024 * 1024;
        MultipartRequest multi = new MultipartRequest(request, realpath,maxSize,
                "UTF-8",new DefaultFileRenamePolicy());
        int cosNum = Integer.parseInt(multi.getParameter("cosNum"));
        GoodsReviewDTO grdto = new GoodsReviewDTO();
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        grdto.setCosNum(Integer.parseInt(multi.getParameter("cosNum")));
        grdto.setUserid(userId);
        grdto.setRating(Integer.parseInt(multi.getParameter("rating")));
        grdto.setReviewContent(multi.getParameter("reviewContent"));
        String image = multi.getFilesystemName("file1");
        grdto.setReviewImage(image);
        grdao.createReview(grdto);
        forward.setPath("./GoodsDetail.cos?cosNum="+cosNum);
        forward.setRedirect(true);
        return forward;
    }
}
