package com.test.sim;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.notice.db.setnoticetool;
import com.var.list.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class dbinsert {
	
	
	
	public static void main(String[] args) {
		varlist var = new varlist();
		String tablename = var.getGoodslistTablename(); 
		int index = 1;
		String title[]  = new String[]
				{
					
						
						
						
				};
		
		String content[]  = new String[]
				{
						
						
						
						
						
						
						
						
						
				};
		String filename = "https://images-kr.etude.com/products/650000009921/650000009921_01_540_540.jpg?1609132590497&1609132590499";
		int type = 0;
		
		DBconnection con = new DBconnection();
		setnoticetool notit = new setnoticetool();
		ResultSet rs = null;
		String sql = "";
		
			try {
				
				
				sql = "select * from "+tablename;
				rs = con.consql(sql);


				System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.closeDB();
				
			}

		
	
	}

}
