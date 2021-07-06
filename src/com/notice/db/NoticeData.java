package com.notice.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.var.list.varlist;

public class NoticeData {
	varlist var = new varlist();
	private String tablename = var.getnoticelistTablename();
	
	public noticeDTO doit(int num){
		DBconnection con = new DBconnection();
		setnoticetool notit = new setnoticetool();
		ResultSet rs = null;
		String sql = "";
		noticeDTO noti = new noticeDTO();
		setnoticetool notis = new setnoticetool();
		try {
			
	
			
			sql = "select * from "+tablename + " where noticeNum = " + num;
			rs = con.selsql(sql);
			

			while (rs.next()) {
				
				
				
				noti = notis.setdata(noti, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				

			} // while

			System.out.println("DAO : 데이터 읽어오기 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.closeDB();
			
		}

		
		
		return noti;
	}
}
