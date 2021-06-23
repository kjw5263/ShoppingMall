package com.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;
import com.var.list.varlist;

public class GoodsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : GoodsListAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		String item = request.getParameter("item");
		String cat = request.getParameter("cat");
		varlist var = new varlist();
		if(item == null){
			item = "all";
		}else if(item.equals("best")){
			item = "베스트";
		}else if(item.equals("skin")){
			item = "스킨";
		}else if(item.equals("essence")){
			item = "에센스";
		}else if(item.equals("cream")){
			item = "크림";
		}else if(item.equals("maskpack")){
			item = "마스크팩";
		}else{
			item = "all";
		}
		 
		if(cat == null){
			cat = "all";
		}
		for (int i = 1; i<var.getCat().length;i++){
			
			if(cat.equals(var.getCat()[i][0].split("=",2)[1])){
				cat = var.getCat()[i][1];
			}
		
			
		}
		
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		listDAO gdao = new listDAO();
	
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		
		// 정보 저장 -> 영역 저장
//		 request.setAttribute("goodsList", gdao.getGoodsList());
		
		request.setAttribute("goodsList", gdao.getGoodsList(item, cat));
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./goods/goods_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
