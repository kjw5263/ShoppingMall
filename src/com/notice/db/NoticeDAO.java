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

public class NoticeDAO {
	
	private ResultSet rs = null;
	private String sql = "";
	varlist var = new varlist();
	private String tablename = var.getnoticelistTablename();
	
	setnoticetool setTool = new setnoticetool();
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private String databasename = var.getDatabasename();
	public void insertNotice(noticeDTO noti){
		noticeinsert Dobbynoti = new noticeinsert();
		Dobbynoti.doit(noti);
		
	}
	public void deleteNotice(String noticeNum){
		noticeDelete Dobbynoti = new noticeDelete();
		Dobbynoti.doit(noticeNum);
		//도비는 자유에요!
	}
	public void updateNotice(noticeDTO noti){
		noticeUpdate Dobbynoti = new noticeUpdate();
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
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			

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
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

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
			
			closeDB();
		}

		return notiList;
	}
	
	public List getTopNoticeList() {
		List notiList = new ArrayList();
		try {
			
			
			sql = "select * from "+tablename +" where noticeType = 1 ";
			System.out.println("bigsql = "+ sql);
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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

			closeDB();
		}

		return notiList;
	}
	
	public int notiCount(){
		
		  try{
		        sql =  "select max(noticeNum) as num from "+ tablename ;
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
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
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				return rs.getInt(1);
		        }catch (Exception e) {
			// TODO: handle exception
		        	return 0;
		        }finally {
		        	closeDB();
		        
				}
		        
		
		
	}
	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected Connection getConnection() {
		try {
			// Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
			Context initCTX = new InitialContext();
			// DB연동 정보를 불러오기(context.xml)
			
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/"+ databasename);

			conn = ds.getConnection();

			System.out.println(" 드라이버 로드, 디비연결 성공! ");
			System.out.println(conn);

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
}
