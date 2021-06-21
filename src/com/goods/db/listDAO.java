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
	
	
	private String tablename = "cos_list";
	DBconnection con = new DBconnection();
	setGoodsTool setTool = new setGoodsTool();
	public List getGoodsList() {
		List goodsList = new ArrayList();
		try {
			
			
			sql = "select * from "+tablename;
			rs = con.consql(sql);

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
	
	// getGoodsList()

	// getGoodsList(item)
	public List getGoodsList(String item) {
		// item에 따라서 다른 결과를 처리
		// item - all/best/그외 카테고리
		List goodsList = new ArrayList();

		StringBuffer SQL = new StringBuffer();

		try {
			
			sql = "select * from "+tablename;
			rs = con.consql(sql);
			
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
}
