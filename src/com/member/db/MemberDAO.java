package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class MemberDAO {
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
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/cosShopping");	// 다운캐스팅
			
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
	
	
	// idCheck(userId,userPass)
		public int idCheck(String userId,String userPass){
			int check = -1;

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userPass from userinfo where userId=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, userId);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				if(rs.next()){
					if(userPass.equals(rs.getString("userPass"))){
						// 본인 
						check = 1;
					}else{
						// 비밀번호 오류
						check = 0;
					}
				}else{
					// 회원정보 x
					check = -1;
				}
				
				System.out.println("DAO : 로그인 처리 결과 "+check);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return check;
		}
		// idCheck(id,pass)
	
}
