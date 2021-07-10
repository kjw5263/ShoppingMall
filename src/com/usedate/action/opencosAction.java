package com.usedate.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usedate.db.UsedateDAO;

public class opencosAction implements Action{

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
		int cosNum = Integer.parseInt(request.getParameter("cosNum"));
		int openstatus = Integer.parseInt(request.getParameter("openstatus"));
		int cosAmount = Integer.parseInt(request.getParameter("cosAmount"));
		int firstopen = Integer.parseInt(request.getParameter("firstopen"));
		int statusnum = Integer.parseInt(request.getParameter("statusnum"));
		int oNum = Integer.parseInt(request.getParameter("oNum"));
		
		UsedateDAO udao = new UsedateDAO();
		
		if(firstopen == 0){
			udao.regusedate1(userId,cosNum,openstatus,cosAmount,statusnum,oNum);
		}else if(firstopen == 1){
			udao.regusedate2(userId,cosNum,openstatus,cosAmount,statusnum,oNum);
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print("<script>");
		out.print(" alert('오픈 완료!'); ");
		out.print("location.href='./Usedate.ud';");
		out.print("</script>");

		out.close();
		
		
		
		forward.setPath("/Usedate.ud");
		forward.setRedirect(false);
		return forward;
	}
	
	

}
