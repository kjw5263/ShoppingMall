package com.var.list;
//DBcon원본
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.omg.IOP.CodecPackage.TypeMismatch;

import com.var.list.varlist;

public class DBconnection {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	varlist vars = new varlist();
	private String databasename = vars.getDatabasename();
	
	protected void insql(String sql ){
		try {
		conn = getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	protected void delsql(String sql ){
		try {
		conn = getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	protected void upsql(String sql ){
		try {
		conn = getConnection();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	protected ResultSet selsql(String sql ){
		try {
		conn = getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rs;
	}
	protected ResultSet conpstmt(PreparedStatement pstmt ,ArrayList a ){
		try {
		conn = getConnection();
		
		for(int i=0; i<a.size();i++){
			
			if(a.get(i) instanceof Integer ){
				pstmt.setInt(i,(int)a.get(i));
			}else if(a.get(i) instanceof String ){
				pstmt.setString(i,(String)a.get(i));
			}
			else if(a.get(i) instanceof Float ){
				pstmt.setFloat(i,(Float)a.get(i));
			}else{
				pstmt.setString(i,(String)a.get(i));
			}
			
		}
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
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
		setConn(conn);
		return conn;
	}
	// getConnection() - 디비연결 끝

	// 자원해제코드 - finally 구문에서 사용
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



	public Connection getConn() {
		return conn;
	}



	public void setConn(Connection conn) {
		this.conn = conn;
	}



	public PreparedStatement getPstmt() {
		return pstmt;
	}



	public void setPstmt(PreparedStatement pstmt) {
		this.pstmt = pstmt;
	}



	public ResultSet getRs() {
		return rs;
	}



	public void setRs(ResultSet rs) {
		this.rs = rs;
	}



	public String getSql() {
		return sql;
	}



	public void setSql(String sql) {
		this.sql = sql;
	}
}
