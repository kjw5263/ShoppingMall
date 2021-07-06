package com.notice.db;

import java.sql.ResultSet;


import com.var.list.varlist;


public class noticeDelete extends DBconnection{
	varlist var = new varlist();
	private String tablename = var.getnoticelistTablename();
	
	public void doit(String noticeNum){
		DBconnection con = new DBconnection();
		setnoticetool notit = new setnoticetool();
		ResultSet rs = null;
		String sql = "";
		
			try {
				sql = "delete from "+ tablename + " where noticeNum = "+ noticeNum;
				con.delsql(sql);
				


				System.out.println("DAO : 공지 삭제 완료");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.closeDB();
				
			}

		
		
	}
}
