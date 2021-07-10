package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberUpdateInfoproAction2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberUpdateInfoproAction2_execute");
		
		  // 세션 제어
	      HttpSession session = request.getSession();
	      String userId = (String) session.getAttribute("userId");
	      request.setCharacterEncoding("utf-8");	
	      
	      ActionForward forward = new ActionForward();
	      if (userId == null) {
	         forward.setPath("./MemberLogin.me");
	         forward.setRedirect(true);
	         return forward;
	      }
	      
	      //number 1 - 전화번호 /2 - 이메일 / 3- 비밀번호 
	      int number = Integer.parseInt(request.getParameter("number"));
	      MemberDAO mdao = new MemberDAO();
	      MemberDTO mdto  = new MemberDTO();
	      mdto.setUserId(userId);
	      
	      if(number == 1){
	    	  mdto.setUserTel(request.getParameter("userTel"));
	    	  mdao.updatemembertel(mdto);
	    	  
	    	  
	    	  response.setContentType("text/html; charset=utf-8");
	          PrintWriter out = response.getWriter();
	          	out.print("<script>");
		    	out.print(" alert('변경완료되었습니다.'); ");
	          	out.print(" location.href = './MemberUpdateInfopro3.me'; ");
	          	out.print("</script>");
	          	out.close();
	          	return null;
	    	  
	      }
	      else if(number == 3){
	    	  
	    	  System.out.println("비밀번호 변경");
		      String userPass = request.getParameter("userPass");
		      String newpw1 = request.getParameter("newpw1");
		      System.out.println("전달받은 비밀번호" + userPass);
		      System.out.println("새 비밀번호" + newpw1);
		      int result = mdao.updatememberpw(userId,userPass,newpw1);
		      
		      System.out.println("result 값 "+ result);
		      if(result == 1){
		      response.setContentType("text/html; charset=utf-8");
	    	  PrintWriter out = response.getWriter();
	    	  out.print("<script>");
	    	  out.print(" alert('변경완료되었습니다.'); ");
	    	  out.print(" location.href = './MemberUpdateInfopro3.me'; ");
	    	  out.print("</script>");
	    	  out.close();
		      }else if(result == 0){
	    		  response.setContentType("text/html; charset=utf-8");
		          PrintWriter out = response.getWriter();
		          	out.print("<script>");
			    	out.print(" alert('비밀번호가 일치하지 않습니다.'); ");
		          	out.print(" location.href = './MemberUpdateInfopro3.me'; ");
		          	out.print("</script>");
		          	out.close();
		          	return null;
	    	  }else if(result == -1){
	    		  response.setContentType("text/html; charset=utf-8");
		          PrintWriter out = response.getWriter();
		          	out.print("<script>");
			    	out.print(" alert('-1이라네용'); ");
		          	out.print(" location.href = './MemberUpdateInfopro3.me'; ");
		          	out.print("</script>");
		          	out.close();
		          	return null; 
	    		  
	    	  }
	    	 
	      }else if(number == 4){
	    	  System.out.println("선택정보 변경");
	    	  String skinType = request.getParameter("skinType");
	    	  String skinTrouble = request.getParameter("skinTrouble");
	    	  mdto.setUserSkinType(skinType);
	    	  mdto.setUserTrouble(skinTrouble);
	    	  
	    	  mdao.updatememberskin(mdto);
	    	  
	    	  response.setContentType("text/html; charset=utf-8");
	    	  PrintWriter out = response.getWriter();
	    	  out.print("<script>");
	    	  out.print(" alert('변경완료되었습니다.'); ");
	    	  out.print(" location.href = './MemberUpdateInfopro3.me'; ");
	    	  out.print("</script>");
	    	  out.close();
	    	  return null;
	    	  
	      }
		return null;
	    
	}

	
}
