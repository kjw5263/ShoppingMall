package com.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.notice.db.DBconnection;
import com.var.list.varlist;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class NoticeDAO extends DBconnection{
	
	private ResultSet rs = null;
	private String sql = "";
	varlist var = new varlist();
	private String tablename = var.getnoticelistTablename();
	DBconnection con = new DBconnection();
	setnoticetool setTool = new setnoticetool();
	
	public void insertNotice(noticeDTO noti){
		noticeinsert Dobbynoti = new noticeinsert();
		Dobbynoti.doit(noti);
		
	}
	public void deleteNotice(noticeDTO noti){
		noticeinsert Dobbynoti = new noticeinsert();
		Dobbynoti.doit(noti);
		//도비는 자유에요!
	}
	public void updateNotice(noticeDTO noti){
		noticeinsert Dobbynoti = new noticeinsert();
		Dobbynoti.doit(noti);
		
	}
	public int deleteCheckNotice(String id ){
		noticeDeleteCheck Dobbynoti = new noticeDeleteCheck();
		return Dobbynoti.doit(id);
		
	}
	public noticeDTO getNoticeData(int num){
		NoticeData  Dobbynoti = new NoticeData();
		return Dobbynoti.doit(num);
		
		
	}
	
	
	
	public List getNoticeList() {
		List notiList = new ArrayList();
		try {
			
			
			sql = "select * from "+tablename;
			rs = con.selsql(sql);
			

			while (rs.next()) {
				
				noticeDTO noti = new noticeDTO();
				
				
				noti = setTool.setdata(noti, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				notiList.add(noti);

			} // while

			System.out.println("DAO : 돌아가면 안되는 거 돌아감");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.closeDB();
			closeDB();
		}

		return notiList;
	}
	
	public List getNoticeList(int startRow , int pageSize ) {
		List notiList = new ArrayList();
		try {
			
			 sql= "select * from "+tablename
						+ " where noticeType = 0 order by noticeNum desc limit " + startRow +" , "+ pageSize;		
			
			 System.out.println("minsql = "+ sql);
			rs = con.selsql(sql);
			

			while (rs.next()) {
				
				noticeDTO noti = new noticeDTO();
				
				
				noti = setTool.setdata(noti, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				notiList.add(noti);

			} // while

			System.out.println("DAO : 일반 공지 등록");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.closeDB();
			closeDB();
		}

		return notiList;
	}
	
	public List getTopNoticeList() {
		List notiList = new ArrayList();
		try {
			
			
			sql = "select * from "+tablename +" where noticeType = 1 ";
			System.out.println("bigsql = "+ sql);
			rs = con.selsql(sql);
			
			
			while (rs.next()) {
				
				noticeDTO noti = new noticeDTO();
				
				
				noti = setTool.setdata(noti, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				notiList.add(noti);

			} // while

			System.out.println("DAO : 중요 공지 등록");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.closeDB();
			closeDB();
		}

		return notiList;
	}
	
	public int notiCount(){
		
		  try{
		        sql =  "select max(noticeNum) as num from "+ tablename ;
				rs = con.selsql(sql);
				rs.next();
				return rs.getInt(1);
		        }catch (Exception e) {
			// TODO: handle exception
		        	return 0;
		        }finally {
		        	closeDB();
		        
				}
		 	
			
		
		
	}
	public int topnoticount(){
		
		  try{
		        sql =  "select max(noticeNum) as num from "+ tablename
		        		+ " where noticeType = 1 ";
				rs = con.selsql(sql);
				rs.next();
				return rs.getInt(1);
		        }catch (Exception e) {
			// TODO: handle exception
		        	return 0;
		        }finally {
		        	closeDB();
		        
				}
		        
		
		
	}
	
	
}
