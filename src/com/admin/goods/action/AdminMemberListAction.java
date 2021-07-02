package com.admin.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;



public class AdminMemberListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : MemberListAction_execute() 호출");

		// 세션제어 (세션+관리자)
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null || !userId.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		// DAO 객체 -> 회원 정보 전부 가져오기(list형태)
		AdminGoodsDAO dao = new AdminGoodsDAO();
		List memberList = dao.getAdminMemberList();
		
		// list 정보를 저장(request영역)
		request.setAttribute("memberList", memberList);

		// 페이지 이동(forward- ./member/list.jsp)
		forward.setPath("./admingoods/admin_member_list.jsp");
		forward.setRedirect(false);

		return forward;
	}
}
