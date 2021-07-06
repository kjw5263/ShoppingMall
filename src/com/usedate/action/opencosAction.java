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

		System.out.println("---------------------------------------------------");
		System.out.println("cosNum : " + cosNum);
		System.out.println("openstatus : " + openstatus);
		System.out.println("cosAmout : " + cosAmount);
		System.out.println("firstopen : " + firstopen);
		System.out.println("statusnum : " + statusnum);
		System.out.println("oNum : " + oNum);
		System.out.println("---------------------------------------------------");
		
		UsedateDAO udao = new UsedateDAO();
		
		if(firstopen == 0){
			System.out.println("첫 오픈 메소드 실행");
			udao.regusedate1(userId,cosNum,openstatus,cosAmount,statusnum,oNum);
		}else if(firstopen == 1){
			System.out.println("두번째 오픈 메소드 실행");
			udao.regusedate2(userId,cosNum,openstatus,cosAmount,statusnum,oNum);
		}
		
		
		forward.setPath("/Usedate.ud");
		forward.setRedirect(false);
		return forward;
	}
	
	

}
