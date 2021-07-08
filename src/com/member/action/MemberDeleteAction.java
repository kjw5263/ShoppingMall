package com.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.like.db.LikeDAO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M : MemberDeleteAction_execute() 호출");
		
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        ActionForward forward = new ActionForward();
        if(userId == null){
        	forward.setPath("./MemberLogin.me");
        	forward.setRedirect(true);
        	return forward;
        }
        
        String userPass = request.getParameter("userPass");
        
        MemberDAO dao = new MemberDAO();
        int check = dao.deleteMember(userId,userPass);
	
		
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        
        if(check==0){
        	out.print("<script>");
        	out.print(" alert('비밀번호가 일치하지 않습니다.'); ");
        	out.print(" history.back(); ");
        	out.print("</script>");
        	out.close();
        	return null;        	
        }
        if(check == -1){
        	out.print("<script>");
        	out.print(" alert('아이디가 존재하지 않습니다.'); ");
        	out.print(" history.back(); ");
        	out.print("</script>");
        	out.close();
        	return null; 
        }
        
        
        session.invalidate();
        
        out.print("<script>");
    	out.print(" alert('탈퇴가 완료되었습니다.'); ");
    	out.print(" location.href='./Main.me'; ");
    	out.print("</script>");
    	out.close();
		return null;
	
	}

}
