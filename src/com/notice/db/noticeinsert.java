package com.notice.db;

import java.sql.ResultSet;


import com.var.list.varlist;


public class noticeinsert extends DBconnection{
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
				
				//String sss = noti.getNoticeContent(); 
				//sss = sss.replace(",", "s0i0m0p0u0").replace("\n", "<br>").replace("\r", "<br>");
				sql = "insert into "+ tablename + " values "
						+ "(" + num +","+ "'"+noti.getNoticeTitle()+ "'" +","
						+ "'"+noti.getNoticeContent().replace("\n", "<br>").replace("\r", "<br>")+ "'"
						+",'"+noti.getNoticeFile()
						+"',"+
						noti.getNoticeType()+",'"+noti.getNoticeRealFileName() +"')";
				System.out.println("급한sql = " +sql);
				con.insql(sql);


				System.out.println("DAO : 공지 등록 완료");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.closeDB();
				
			}

		
		
	}
}
