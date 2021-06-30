package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberJoinAction implements Action {
   
   @Override
   public ActionForward execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      System.out.println("M : MemberJoinAction_execute() 호출!!");
       
      request.setCharacterEncoding("UTF-8");
      
      // 전달된 정보 파라미터 저장 
      MemberDTO mdto = new MemberDTO();
      mdto.setUserId(request.getParameter("userId"));
      mdto.setUserPass(request.getParameter("userPass"));
      mdto.setUserName(request.getParameter("userName"));
      mdto.setUserEmail(request.getParameter("userEmail"));
      String address1 = request.getParameter("address1");
      String address2 = request.getParameter("address2");
      String address3 = request.getParameter("address3");
      mdto.setUserAddr(address1 + "," + address2 + "," +address3);
      mdto.setUserTel(request.getParameter("userTel"));
      mdto.setUserBirth(request.getParameter("userBirth"));
      mdto.setUserGender(request.getParameter("userGender"));
      mdto.setUserSkinType(request.getParameter("userSkinType"));
      mdto.setUserTrouble(request.getParameter("userTrouble"));
      
      String referral_id = request.getParameter("referral_id");
      
      // DB에 저장 
      MemberDAO mdao = new MemberDAO();
   
      
      //회원가입 메서드  - insertMember();
      mdao.insertMember(mdto,referral_id);
      
      // 페이지 이동(ActionForward객체)
      ActionForward forward = new ActionForward();
      forward.setPath("./MemberLogin.me");
      forward.setRedirect(true);
      
      return forward;
   }

}