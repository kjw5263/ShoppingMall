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
		noticeinsert insertnoti = new noticeinsert();
		insertnoti.doit(noti);
		
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

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

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
			
			 sql= "select * from"+tablename
						+ "order by noticeNum desc limit " + startRow +" , "+ pageSize;		
			
			rs = con.selsql(sql);
			

			while (rs.next()) {
				
				noticeDTO noti = new noticeDTO();
				
				
				noti = setTool.setdata(noti, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				notiList.add(noti);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

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
			rs = con.selsql(sql);
			

			while (rs.next()) {
				
				noticeDTO noti = new noticeDTO();
				
				
				noti = setTool.setdata(noti, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				notiList.add(noti);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

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
