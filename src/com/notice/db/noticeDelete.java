package com.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.var.list.varlist;


public class noticeDelete {
	varlist var = new varlist();
	private String tablename = var.getnoticelistTablename();
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	private String databasename = var.getDatabasename();
	
	public void doit(String noticeNum){
		
		setnoticetool notit = new setnoticetool();
		ResultSet rs = null;
		String sql = "";
		
			try {
				sql = "delete from "+ tablename + " where noticeNum = "+ noticeNum;
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				


				System.out.println("DAO : 공지 삭제 완료");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
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
