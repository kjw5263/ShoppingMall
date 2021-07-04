package com.order.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.basket.db.BasketDTO;
import com.coupon.db.CouponDTO;
import com.goods.db.GoodsDTO;

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
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/cosShopping");	// 다운캐스팅
			
			conn = ds.getConnection();
			
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
	
	
	
	/* addOrder() 시작 */
	public String addOrder(OrderDTO oDTO, List<BasketDTO> basketList, List<GoodsDTO> goodsList) {
		int o_tradeNum=0;
		int o_num=0;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		try {
			conn = getConnection();
			sql = "select max(o_Num) from order_board";
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				o_num = rs.getInt("max(o_Num)")+1;
			}
			
			o_tradeNum = o_num;
			
			// 주문 등록
			for(int i=0; i<basketList.size(); i++) {
				BasketDTO bkDTO = basketList.get(i);
				GoodsDTO gDTO = goodsList.get(i);
				
				sql = "insert into order_board values (?,?,?,?,?,"
													+ "?,?,?,?,?,"
													+ "?,?,?,?,"
													+ "?,?,now(),now(),?,"
													+ "?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, o_num);
				pstmt.setString(2, sdf.format(cal.getTime())+"-"+o_tradeNum);	// 	주문번호 생성
				pstmt.setInt(3, bkDTO.getBasketCosNum());
				pstmt.setString(4, gDTO.getCosName());
				pstmt.setInt(5, bkDTO.getBasketCosAmount());
				
				pstmt.setString(6, bkDTO.getBasketUserId());
				pstmt.setString(7, oDTO.getReceiverName());
				pstmt.setString(8, oDTO.getReceiverAddr());
				pstmt.setString(9, oDTO.getReceiverEmail());
				pstmt.setString(10, oDTO.getReceiverTel());
				
				pstmt.setString(11, oDTO.getReceiverTel2());
				pstmt.setString(12, oDTO.getO_msg());
				pstmt.setInt(13, oDTO.getSumMoney());
				pstmt.setInt(14, oDTO.getPayMoney());
				//pstmt.setInt(15, oDTO.getPayNum());	// 결제번호 - 이건필요 없을 수도 있음.. 삭제가능할듯
				
				pstmt.setString(15, oDTO.getPayerName());
				pstmt.setString(16, oDTO.getPayType());
				pstmt.setInt(17, 1);
				pstmt.setInt(18, oDTO.getAddPoint());
				pstmt.setInt(19, oDTO.getCpUseAmount());
				pstmt.setInt(20, oDTO.getPtUseAmount());
				
				pstmt.executeUpdate();
				
				o_num++;
			}
			System.out.println("주문 디비 넣기 성공 ");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return sdf.format(cal.getTime())+"-"+o_tradeNum;
				
	}
	/* addOrder() 끝 */
	
	/* updateUserInfo(oDTO) 시작 : 결제 후 사용자 정보 변경하기 */
	public void updateUserInfo(OrderDTO oDTO) {
		// 1. 사용자가 사용한 포인트 차감하기
		// 2. 누적 사용금액 더하기
		// 3. 누적금액에 따라 사용자 레벨 변경하기
		
		try {
			conn = getConnection();
			sql = "update user_info set userPoint=userPoint+?, userTotal=userTotal+? where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oDTO.getPtUseAmount());
			pstmt.setInt(2, oDTO.getPayMoney());
			pstmt.setString(3, oDTO.getO_userId());
			
			// 포인트 빼야하는데 플러스로 연산한 이유
			// -> oDTO에 저장된 사용한 포인트값이 음수로 되어있기 때문
			pstmt.executeUpdate();
			
			sql = "update user_info set userLevel = case when (userTotal between 0 and 99999) then 1 "
					   + "when (userTotal between 100000 and 149999) then 2 "
					   + "when (userTotal between 150000 and 199999) then 3 "
					   + "else 4 end "
					   + "where userId=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, oDTO.getO_userId());
			int result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	/* updateUserInfo(oDTO) 끝 */
	
	
	
	/* 사용한 쿠폰 삭제하기 ; deleteCoupon(CouponDTO) */
	public void deleteCoupon(CouponDTO cDTO) {
		try {
			conn = getConnection();
			sql = "select * from my_coupon where mcUserId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cDTO.getMcUserID());
			
			rs = pstmt.executeQuery();
			System.out.println("dkdk >>>>>>>>>" + cDTO.getMcCouponNum());
			
			if(rs.next()) {
				sql = "delete from my_coupon where mcUserId=? and mcCouponNum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cDTO.getMcUserID());
				pstmt.setInt(2, cDTO.getMcCouponNum());
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	/* 사용한 쿠폰 삭제하기 ; deleteCoupon(CouponDTO) */
	
	
}
