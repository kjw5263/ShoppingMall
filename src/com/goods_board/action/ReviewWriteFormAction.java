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
        if (userId == null){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인 해주세요')");
            out.println("location.href='./MemberLogin.me'");
            out.println("</script>");
            out.close();

            return null;
        }
        GoodsReviewDTO grdto = new GoodsReviewDTO();
        GoodsReviewDAO grdao = new GoodsReviewDAO();
        int chekId = grdao.checkUser(userId,cosNum);
        grdto.setCosNum(Integer.parseInt(multi.getParameter("cosNum")));
        grdto.setUserid(userId);
        grdto.setRating(Integer.parseInt(multi.getParameter("rating")));
        grdto.setReviewContent(multi.getParameter("reviewContent"));
        String image = multi.getFilesystemName("file1");
        grdto.setReviewImage(image);
        if (chekId==1){
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
            grdao.createReview(grdto);
        }
        forward.setPath("GoodsDetail.cos?cosNum="+grdto.getCosNum());
        forward.setRedirect(false);
        return forward;
    }
}
