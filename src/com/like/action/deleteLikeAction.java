package com.like.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.like.db.LikeDAO;

public class deleteLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		int cosnum = Integer.parseInt(request.getParameter("cosnum"));
		LikeDAO ldao = new LikeDAO();
		int check = ldao.deleteLike(userId,cosnum);
		
		if(check == 1){
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('찜 목록에서 해제되었습니다.'); ");
			out.print("location.href ='./getLike.li';");
			out.print("</script>");

			out.close();
		}
		
		forward = new ActionForward();
		forward.setPath("./member/likelist.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
