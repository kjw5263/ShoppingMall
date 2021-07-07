package com.coupon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.sql.DataSource;


import com.coupon.db.CouponDTO;
import com.order.db.OrderDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class CouponDAO {
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
	
	// getCoupon(userId);
	
	/**
	 * @param userId
	 * @return
	 * 쿠폰 목록 가져오는 메소드
	 */
	public List getCoupon(String userId) {
		List couponList = new ArrayList();

		try {
			conn = getConnection();
			sql = "select * from coupon_type t join my_coupon m on m.mcCouponNum = t.couponNum where m.mcUserId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CouponDTO dto = new CouponDTO();

				dto.setMcAmount(rs.getInt("mcAmount"));
				dto.setCouponDc(rs.getInt("couponDc"));
				dto.setCouponName(rs.getString("couponName"));
				dto.setCouponNote(rs.getString("couponNote"));
				dto.setMcCouponNum(rs.getInt("mcCouponNum"));

				couponList.add(dto);
			}
			System.out.println("DAO : 쿠폰 정보 저장완료");
			System.out.println(couponList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return couponList;
	}
	// mycouponlist(userId);
	
	
	//insertCoupon(userId, mcCouponNum): 발급된 쿠폰번호를 my_coupon에 insert
    public void insertCoupon(String userId, int mcCouponNum){
       
       int num=0;
       
       try {
	       conn = getConnection();
	       sql = "select max(mcNum) from my_coupon";
	       pstmt = conn.prepareStatement(sql);
	       rs = pstmt.executeQuery();

       if(rs.next()){
           num = rs.getInt(1)+1;
       }
       		System.out.println("회원번호: "+num);
       
       		sql = "insert into my_coupon values(?,?,?,1)";
       
       		pstmt = conn.prepareStatement(sql);
       		
       		pstmt.setInt(1, num);
       		pstmt.setInt(2, mcCouponNum);
       		pstmt.setString(3, userId);
          
       		pstmt.executeUpdate(); //insert, update, delete => int 형이라서 rs로 받을수 없음.
       
       } catch (SQLException e) {            
          e.printStackTrace();   
       }finally{
          closeDB();
       }

    }
    //insertCoupon(userId, mcCouponNum)
    
	//couponNumList(): 쿠폰 번호 배열에 저장
	public List couponNumList(CouponDTO cdto){
		
		LinkedList couponNumList = new LinkedList();
		
		try {
			conn=getConnection();
			sql="select couponNum from coupon_type";
			//1:가입축하 10% (회원가입시 자동 발급), 2:생일 20% 할인쿠폰, 3:전회원 10% 할인, 4: 여름맞이 50% 할인, 5: 첫구매 30%
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CouponDTO cpNum = new CouponDTO();
				
				cpNum.setCouponNum(rs.getInt("couponNum"));
				
				couponNumList.add(cpNum);
			}
			
				System.out.println("쿠폰번호 리스트에 저장완료");
				System.out.println("쿠폰번호 리스트: "+couponNumList);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return couponNumList;
		
	}//couponNumList()
   
}
