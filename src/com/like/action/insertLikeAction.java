package com.like.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.like.db.LikeDAO;


public class insertLikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		int cosNum = Integer.parseInt(request.getParameter("cosNum"));
		
		System.out.println(cosNum);
		
		ActionForward forward = new ActionForward();
		
		if (userId == null) {
			
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print(" alert('로그인 해주세요.'); ");
			out.print(" location.href='./MemberLogin.me' ");
			out.print("</script>");

			out.close();
		}
		
		
		LikeDAO ldao = new LikeDAO();
		int check = ldao.insertLike(userId, cosNum);
		// List LikeList = ldao.getLikeList(userId,startRow,pageSize);
		
		if(check == 0){
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('찜하기 완료.'); ");
			out.print(" history.back() ");
			out.print("</script>");

			out.close();
			
		}
		
		if(check == -1){
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" location.href='./deleteLike.li?cosnum="+cosNum+"';");
			out.print("</script>");

			out.close();
			
		}
		
		request.setAttribute("cosNum", cosNum);
		
	    forward.setPath("./deleteLike.li");
		forward.setRedirect(true);
		return forward; 
	}

}
