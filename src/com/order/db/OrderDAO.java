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
	
	
	/* getBasketList()
	 * 설명 : 장바구니 목록 가져오기 메소드
	 * return : vector  */
	public Vector getBasketList(String userId) {
		Vector totalVector = new Vector();
		
		List basketList = new ArrayList();
		List goodsList = new ArrayList();
		
		
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
				
				// 2. 상품 목록 가져오기 : 장바구니에 해당하는 상품 상세 정보저장
				sql = "select * from cos_list where cosNum=?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql);
				pstmt2.setInt(1, rs.getInt("basketCosNum"));
				
				ResultSet rs2 = pstmt2.executeQuery();
				
				// 상품정보가 있을 때
				if(rs2.next()) {
					GoodsDTO gDTO = new GoodsDTO();
					gDTO.setCosNum(rs2.getInt("cosNum"));
					gDTO.setCosName(rs2.getString("cosName"));
					gDTO.setCosBrand(rs2.getString("cosBrand"));
					gDTO.setCosPrice(rs2.getInt("cosPrice"));
					gDTO.setCosImage(rs2.getString("cosImage"));
					
					goodsList.add(gDTO);
				}
			}
			
			totalVector.add(basketList);
			totalVector.add(goodsList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return totalVector;
	}
	 /* getBasketList() 종료 */
	
	
	/* addOrder() 시작 */
	public void addOrder(OrderDTO oDTO, List<BasketDTO> basketList, List<GoodsDTO> goodsList) {
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
													+ "?,?,?,?,?,"
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
				pstmt.setInt(15, oDTO.getPayNum());	// 결제번호 - 이건필요 없을 수도 있음.. 삭제가능할듯
				
				pstmt.setString(16, oDTO.getPayerName());
				pstmt.setString(17, oDTO.getPayType());
				pstmt.setInt(18, 1);
				pstmt.setInt(19, oDTO.getAddPoint());
				pstmt.setInt(20, oDTO.getCpUseAmount());
				pstmt.setInt(21, oDTO.getPtUseAmount());
				
				pstmt.executeUpdate();
				
				o_num++;
				System.out.println("주문 디비 넣기 성공 ");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
				
	}
	/* addOrder() 시작 */
	
	
}
