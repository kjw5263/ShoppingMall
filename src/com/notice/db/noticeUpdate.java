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
				sql = "update "+ tablename + " set "
				+ " noticeNum =" + noti.getNoticeNum() +","
				+ " noticeTitle = '"+ noti.getNoticeTitle() +"',"
				+ " noticeContent = '"+noti.getNoticeContent()+ "',"
				+ " noticeFile = "+"'"+noti.getNoticeFile() +"',"
				+ " noticeType = '"+noti.getNoticeType() +"',"
				+ " noticeRealFileName = '"+noti.getNoticeRealFileName() +"',"
				+ " noticeImg = '"+noti.getNoticeImg() +"',"
				+ " noticeRealImgName = '"+noti.getNoticeRealImgName() +"'"
				+ " where  noticeNum = "+noti.getNoticeNum()+" ";
				System.out.println("수정 sql = "+ sql );
				con.upsql(sql);
				

				System.out.println("DAO : 공지 등록 완료");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.closeDB();
				
			}

		
		
	}
}
