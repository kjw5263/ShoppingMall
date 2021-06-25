package com.notice.db;

import java.sql.ResultSet;

import com.var.list.varlist;

public class noticeDeleteCheck {
	varlist var = new varlist();
	private String tablename = var.getMemberInfoTablename();
	
	public int doit(String id ){
		int x =0;
		DBconnection con = new DBconnection();
		setnoticetool notit = new setnoticetool();
		ResultSet rs = null;
		String sql = "";
		
			try {
				
				sql = "select userNum from " + tablename 
						+ " where userId = 'admin' ";
				rs = con.selsql(sql);
				rs.next();
				if(rs.getInt(1) == 1){
					x = 1;
				}else{
					x=0;
				}


				System.out.println("DAO : 삭제 유제 체크 완료");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.closeDB();
				
			}
		
		return x;
	}
}
