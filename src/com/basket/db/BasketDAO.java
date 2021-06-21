package com.basket.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class BasketDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	//-----------DB 드라이버 정보--------------------
	/*final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/cosshopping";
	final String DBID = "root";
	final String DBPW = "1234";*/
	
	
	private Connection getConnection() {
		// 커넥션 풀 (Connection pool) : 미리 연결정보(connection)을 생성해서 저장 후 사용(pool) -> 사용 후 반납
		// Context 객체를 생성 (현재 프로젝트 정보를 가지고 있는 객체)
		try {
			Context initCTX = new InitialContext();	 //얘는 인터페이스(부모)!인데 객체 생성(자식)-> 업캐스팅(상속)
			
			// DB 연동 정보를 불러오기 (context.xml)
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/cosshopping");	// 다운캐스팅
			
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
	
	// checkGoods(bkDTO)
	public int checkGoods(BasketDTO bkDTO){
		int result = 0;
		try {
			conn = getConnection();
			// 전달받은 옵션값들 (basketCosNum, basketCosAmount, basketUserID) 사용하여
			// 기존의 추가된 상품이 있는지 체크 => 상품이 있을 때 1리턴 + 상품의 수량만 update
			//						 => 상품이 없을 때 0리턴
			sql = "select * from basket_list where basketCosNum=? and "
					+ "basketCosAmount=? and "
					+ "basketUserID=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bkDTO.getBasketCosNum());
			pstmt.setInt(2, bkDTO.getBasketCosAmount());
			pstmt.setString(3, bkDTO.getBasketUserId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//result = 1;
				
				// 장바구니 상품의 정보(수량)를 수정
				sql = "update basket_list set basketCosAmount = basketCosAmount + ? "
						+ "where basketUserID=? and basketCosNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bkDTO.getBasketCosAmount());
				pstmt.setString(2, bkDTO.getBasketUserId());
				pstmt.setInt(3, bkDTO.getBasketCosNum());
				
				result = pstmt.executeUpdate();
			}
			
			System.out.println("DAO : 장바구니 상품 체크 완료! -> "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
		
	}
	// checkGoods(bkDTO)
	
	// basketAdd(bkDTO)
	public void basketAdd(BasketDTO bkDTO){
		// 장바구니 번호
		int basketNum = 0;
		
		try {
			conn = getConnection();
			
			// 상품번호 계산 : 기존의 장바구니가 있으면 해당번호 + 1
			sql = "select max(basketNum) from basket_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				basketNum = rs.getInt(1)+1;
			}
			System.out.println("DAO : 장바구니 번호"+basketNum);
			
			// 화장품 장바구니에 추가
			sql = "insert into basket_list values()";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basketNum);
			pstmt.setString(2, bkDTO.getBasketUserId());
			pstmt.setInt(3, bkDTO.getBasketCosNum());
			pstmt.setInt(4, bkDTO.getBasketCosAmount());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 장바구니 추가 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// basketAdd(bkDTO)
}
