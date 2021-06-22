package com.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;
import com.goods.db.GoodsDTO;

public class AdminGoodsModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : AdminGoodsModifyAction_execute() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 수정할 정보를 저장(DTO)
		// 폼태그에서 전달되는 정보
		GoodsDTO gdto = new GoodsDTO();
		gdto.setCosNum(Integer.parseInt(request.getParameter("cosNum")));
		gdto.setCosAmount(Integer.parseInt(request.getParameter("cosAmount")));
		gdto.setCosBrand(request.getParameter("cosBrand"));
		gdto.setCosCategory(request.getParameter("cosCategory"));
		gdto.setCosMethod(request.getParameter("cosMethod"));
		gdto.setCosName(request.getParameter("cosName"));
		gdto.setCosPrice(Integer.parseInt(request.getParameter("cosPrice")));
		gdto.setCosSkinType(request.getParameter("cosSkinType"));
		gdto.setCosTrouble(request.getParameter("cosTrouble"));
		gdto.setCosVolumn(Integer.parseInt(request.getParameter("cosVolumn")));
		gdto.setCosWarning(request.getParameter("cosWarning"));
		gdto.setIngredient(request.getParameter("ingredient"));
		gdto.setMadeCompany(request.getParameter("madeCompany"));
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.modifyGoods(gdto);
		
		// 페이지 이동(./AdminGoodsList.ag)	
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminGoodsList.ag");
		forward.setRedirect(true);
		return forward;

	}

}
