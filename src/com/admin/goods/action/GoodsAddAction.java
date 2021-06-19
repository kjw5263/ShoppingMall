package com.admin.goods.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.goods.db.AdminGoodsDAO;
import com.goods.db.GoodsDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GoodsAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : GoodsAddAction_execute() 호출");
		
		// 파일업로드
		// upload 폴더 생성
		// request.getRealPath("/upload")
		ServletContext ctx = request.getServletContext();
		String realpath = ctx.getRealPath("/upload");
		
		int maxSize = 10 * 1024 * 1024;
		
		MultipartRequest multi
			= new MultipartRequest(
					request,
					realpath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
		
		System.out.println("M : 파일 업로드 완료!");
		
		// 나머지 전달정보를 DB에 저장
		GoodsDTO gdto = new GoodsDTO();
		gdto.setCosAmount(Integer.parseInt(multi.getParameter("cosAmount")));
		gdto.setCosBrand(multi.getParameter("cosBrand"));
		gdto.setCosCategory(multi.getParameter("cosCategory"));
		gdto.setCosMethod(multi.getParameter("cosMethod"));
		gdto.setCosName(multi.getParameter("cosName"));
		gdto.setCosPrice(Integer.parseInt(multi.getParameter("cosPrice")));
		gdto.setCosSkinType(multi.getParameter("cosSkinType"));
		gdto.setCosTrouble(multi.getParameter("cosTrouble"));
		gdto.setCosVolumn(Integer.parseInt(multi.getParameter("cosVolumn")));
		gdto.setCosWarning(multi.getParameter("cosWarning"));
		gdto.setIngredient(multi.getParameter("ingredient"));
		gdto.setMadeCompany(multi.getParameter("madeCompany"));
		
		String cosImage
		 = multi.getFilesystemName("file1")+","
		  + multi.getFilesystemName("file2")+","
		  + multi.getFilesystemName("file3")+","
		  + multi.getFilesystemName("file4");
		gdto.setCosImage(cosImage);
		
		System.out.println("M - 이미지 정보 :" + cosImage);
		
		// AdminGoodsDAO 객체 생성
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		agdao.insertGoods(gdto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminGoodsList.ag");
		forward.setRedirect(true);
		
		return forward;
	}

}
