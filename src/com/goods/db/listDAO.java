package com.goods.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.var.list.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class listDAO extends DBconnection{
	
	
	private ResultSet rs = null;
	private String sql = "";
	
	varlist var = new varlist();
	String tablename = var.getGoodslistTablename(); 
	
	DBconnection con = new DBconnection();
	setGoodsTool setTool = new setGoodsTool();
	public List getGoodsList() {
		List goodsList = new ArrayList();
		try {
			
			
			sql = "select * from "+tablename;
			rs = con.selsql(sql);

			while (rs.next()) {
				
				
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.closeDB();
			closeDB();
		}

		return goodsList;
	}
	
	// getGoodsList() 검색창에 사용할 테이터 
	//*** 검색창에 넣은 string 값을 item 으로 받아오면 
	// item 의 값이 들어간 이름의 것을 출력해냄!
	public List getGoodsList(String item ) {

		// item에 따라서 다른 결과를 처리
		// item - all/best/그외 카테고리
		List goodsList = new ArrayList();

		StringBuffer SQL = new StringBuffer();

		try {
			
			sql = "select * from "+ tablename +
					" where cosName like '%"+item+"%' or "
							+ " cosBrand like '%"+item+"%' or "
									+ " cosCategory like '%"+item+"%' ";
			System.out.println("sql = "+  sql);
			
			rs = con.selsql(sql);
			
			while (rs.next()) {
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				// 리스트 한칸에 상품 1개를 저장
				
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			System.out.println("인젝션 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return goodsList;
	}

	// getGoodsList(item)
	public List getGoodsList(String item , String cat ,String skin) {

		// item에 따라서 다른 결과를 처리
		// item - all/best/그외 카테고리
		List goodsList = new ArrayList();

		StringBuffer SQL = new StringBuffer();
		
		try {
			if(item.equals("베스트")){
				sql ="select * from "+ tablename + " order by "
						+ "orderCount desc limit 0 , 10";
			}else{
				if(!cat.equals("all")){
					sql = "select * from "+tablename + 
							" where cosBrand = '" + cat+"'";
					}else if(!item.equals("all")){
						sql = "select * from "+tablename + 
								" where cosCategory = '" + item+"'";
						
					}else if(!skin.equals("all")){
						sql = "select * from "+tablename + 
								" where cosSkinType = '" + skin+"'";
					}
					else{
						sql = "select * from "+tablename;
					}
			}
			System.out.println(sql);
			rs = con.selsql(sql);
			
			while (rs.next()) {
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				// 리스트 한칸에 상품 1개를 저장
				
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			System.out.println("인젝션 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return goodsList;
	}
	// getGoodsList(item)
		public List getbestGoodsList() {

			// item에 따라서 다른 결과를 처리
			// item - all/best/그외 카테고리
			List goodsList = new ArrayList();

			StringBuffer SQL = new StringBuffer();
			
			try {
				
				sql ="select * from "+ tablename + " order by "
						+ "orderCount desc limit 0 , 10";
			
			
				
				rs = con.selsql(sql);
				
				while (rs.next()) {
					GoodsDTO goods = new GoodsDTO();
					
					goods = setTool.setdata(goods, rs);
					
					// 리스트 한칸에 상품 1개를 저장
					
					goodsList.add(goods);

				} 

				System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

			} catch (SQLException e) {
				System.out.println("인젝션 에러");
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return goodsList;
		}

	

}
