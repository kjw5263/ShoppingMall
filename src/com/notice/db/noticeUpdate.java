package com.notice.db;

import java.sql.ResultSet;


import com.var.list.varlist;


public class noticeUpdate extends DBconnection{
	varlist var = new varlist();
	private String tablename = var.getnoticelistTablename();
	
	public void doit(noticeDTO noti){
		DBconnection con = new DBconnection();
		setnoticetool notit = new setnoticetool();
		ResultSet rs = null;
		String sql = "";
		
			try {
				sql = "select max(noticeNum) as num from "+ tablename;
				rs = con.selsql(sql);
				rs.next() ;
				int num = rs.getInt(1)+1;
				sql = "update "+ tablename + " set "
						+ "(" + noti.getNoticeNum() +","+ noti.getNoticeTitle() +","
						+ noti.getNoticeContent()
						+","+noti.getNoticeFile() +","+
						noti.getNoticeType() +" )";
				con.insql(sql);


				System.out.println("DAO : 공지 등록 완료");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.closeDB();
				
			}

		
		
	}
}
