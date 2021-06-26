package com.faq.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class FaqDAO {
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
	
	// getFaqList()
	public List getFaqList() {
		List faqList = new ArrayList();
		try {
			conn = getConnection();
			sql = "select * from faq_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FaqDTO dto = new FaqDTO();
				dto.setFaqNum(rs.getInt("faqNum"));
				dto.setFaqCategory(rs.getString("faqCategory"));
				dto.setFaqQuestion(rs.getString("faqQuestion"));
				dto.setFaqAnswer(rs.getString("faqAnswer"));

				// 리스트 한칸에 faq 1개를 저장
				faqList.add(dto);

			} // while

			System.out.println("DAO : faqList 리스트 저장 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return faqList;
	}
	// getFaqList()
	
	// getFaqList(category)
		public List getFaqList(String category) {
			// item에 따라서 다른 결과를 처리
			// item - all/best/그외 카테고리
			List faqList = new ArrayList();

			try {
				conn = getConnection();
				

				if (category.equals("all")) {
					
					sql = "select * from faq_board";
					pstmt = conn.prepareStatement(sql);

					
				} else {
					
					sql = "select * from faq_board where faqCategory=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, category);

				}
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					FaqDTO dto = new FaqDTO();
					dto.setFaqNum(rs.getInt("faqNum"));
					dto.setFaqCategory(rs.getString("faqCategory"));
					dto.setFaqQuestion(rs.getString("faqQuestion"));
					dto.setFaqAnswer(rs.getString("faqAnswer"));

					// 리스트 한칸에 faq 1개를 저장
					faqList.add(dto);
				} // while

				System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return faqList;
		}
		// getGoodsList(item)
	
}
