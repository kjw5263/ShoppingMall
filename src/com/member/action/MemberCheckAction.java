package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;

public class MemberCheckAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
       // 한글처리
       request.setCharacterEncoding("UTF-8");
       
       String id = request.getParameter("userId").trim();
       
       System.out.println("ajax id 전송:"+id);
       
       MemberDAO mdao = new MemberDAO();

       
       int check1 = 0;
          
          if(id!=null){
             check1 = mdao.signUpIdCheck(id);
             
          }

   
       PrintWriter out = response.getWriter();

       
         out.print(check1);

         out.flush();
         out.close();
         
         
         
      return null;
      
   

   }

}