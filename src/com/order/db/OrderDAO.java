package com.order.db;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.basket.db.BasketDTO;

public class OrderDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	//-----------DB 드라이버 정보--------------------
	/*final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";*/
	
	
	private Connection getConnection() {
		// 1, 2단계 - 드라이버 로드, DB 연결
		// Connection Pool을 사용하지 않을 때, 
/*		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		
		
		// 커넥션 풀 (Connection pool) : 미리 연결정보(connection)을 생성해서 저장 후 사용(pool) -> 사용 후 반납
		// Context 객체를 생성 (현재 프로젝트 정보를 가지고 있는 객체)
		try {
			Context initCTX = new InitialContext();	 //얘는 인터페이스(부모)!인데 객체 생성(자식)-> 업캐스팅(상속)
			
			// DB 연동 정보를 불러오기 (context.xml)
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/model2DB");	// 다운캐스팅
			
			conn = ds.getConnection();
			
			System.out.println("드라이버 로드, 디비 연결 성공!");
			System.out.println(conn);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		return conn;
	}
	
	
	// 자원 해제 코드
	public void closeDB() {
		// 자원 해제
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/* getBasketList()
	 * 설명 : 장바구니 목록 가져오기 메소드
	 * return : vector  */
	public Vector<List> getBasketList(String userId) {
		Vector<List> totalVector = new Vector();
		
		ArrayList basketList = new ArrayList();
		ArrayList goodsList = new ArrayList();
		
		
		try {
			conn = getConnection();
			sql = "select * from basket_list where basketUserId=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			// 1. 장바구니 목록 가져오기 : 아이디에 해당하는 장바구니 데이터 있을 때
			while(rs.next()){
				// 화면에 뿌려주기 위해 DTO통째로 List에 저장하여 넘겨줘야함
				BasketDTO bkDTO = new BasketDTO();
				bkDTO.setBasketNum(rs.getInt("basketNum"));
				bkDTO.setBasketUserId(rs.getString("basketUserId"));
				bkDTO.setBasketCosNum(rs.getInt("basketCosNum"));
				bkDTO.setBasketCosAmount(rs.getInt("basketCosAmount"));
				
				// 장바구니 목록 한칸에 저장하기
				basketList.add(bkDTO);
				
				// 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	 /* getBasketList() 종료 */
	
	
}
