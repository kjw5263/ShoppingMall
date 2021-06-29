package com.usedate.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.goods.db.GoodsDAO;
import com.goods.db.GoodsDTO;
import com.member.action.ActionForward;

public class UsedateDAO {
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
		
		public Vector getusedate(String userId){
			Vector totalList = new Vector();
			List useList =  new ArrayList();
			List openList = new ArrayList();
			
			try {
				conn = getConnection();
				sql = "SELECT * FROM open_date od join cos_list cl on od.openCosNum = cl.cosNum where od.openUserId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					GoodsDTO gdto = new GoodsDTO();
					UsedateDTO udto = new UsedateDTO();
					
					gdto.setCosBrand(rs.getString("cosBrand"));
					gdto.setCosImage(rs.getString("cosImage"));
					gdto.setCosCategory(rs.getString("cosCategory"));
					gdto.setUseDate(rs.getInt("useDate"));
					gdto.setCosName(rs.getString("cosName"));
					udto.setOpenDate(rs.getDate("openDate"));
					
					useList.add(gdto);
					openList.add(udto);
				}
				
				totalList.add(useList);
				totalList.add(openList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return totalList;
		}
		
		public void regusedate(int usedate){
			
			
			
			
			
		}
		
		
	
	}//UsedateDAO

