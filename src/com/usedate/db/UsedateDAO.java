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
import com.order.db.OrderDTO;

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
		
		//getorderList
		/**
		 * @param userId
		 * @return totalList2
		 * 주문한 상품 리스트 가져오는 메소드
		 */
		public Vector getorderList(String userId){
			Vector totalList2 = new Vector();
			List orderList =  new ArrayList();
			List goodsList = new ArrayList();
			
			try {
				conn = getConnection();
				sql = "select * from cos_list cl join order_board ob on ob.o_cosNum = cl.cosNum where ob.o_userId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					GoodsDTO gdto2 = new GoodsDTO();
					OrderDTO odto = new OrderDTO();
					
					gdto2.setCosNum(rs.getInt("cosNum"));
					odto.setO_cosNum(rs.getInt("o_cosNum"));
					gdto2.setCosBrand(rs.getString("cosBrand"));
					gdto2.setCosImage(rs.getString("cosImage"));
					gdto2.setCosCategory(rs.getString("cosCategory"));
					gdto2.setUseDate(rs.getInt("useDate"));
					gdto2.setCosName(rs.getString("cosName"));
					odto.setO_cosAmount(rs.getInt("o_cosAmount"));
					odto.setOrderDate(rs.getDate("orderDate"));
					
					
					goodsList.add(gdto2);
					orderList.add(odto);
				}
				
				totalList2.add(goodsList);
				totalList2.add(orderList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return totalList2;
		}
		//getorderList
		//getorderList(s,p)
		/**
		 * @param userId
		 * @return totalList2
		 * 주문한 상품 리스트 가져오는 메소드
		 */
		public Vector getorderList(String userId,int startRow,int pageSize){
			
			Vector totalList2 = new Vector();
			List orderList =  new ArrayList();
			List goodsList = new ArrayList();
			List usestatusList = new ArrayList();
			
			try {
				conn = getConnection();
				sql = "select * from cos_list cl join order_board ob "
						+ "on ob.o_cosNum = cl.cosNum left outer "
						+ "join use_status us on ob.o_cosNum = us.s_cosNum "
						+ "and ob.o_userId = us.s_userId "
						+ "where ob.o_userId = ? order by ob.o_Num desc limit ?,?"; 
				
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3,pageSize);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					GoodsDTO gdto2 = new GoodsDTO();
					OrderDTO odto = new OrderDTO();
					UsestatusDTO ustdo = new UsestatusDTO();
					
					gdto2.setCosNum(rs.getInt("cosNum"));
					odto.setO_cosNum(rs.getInt("o_cosNum"));
					gdto2.setCosBrand(rs.getString("cosBrand"));
					gdto2.setCosImage(rs.getString("cosImage"));
					gdto2.setCosCategory(rs.getString("cosCategory"));
					gdto2.setUseDate(rs.getInt("useDate"));
					gdto2.setCosName(rs.getString("cosName"));
					
					odto.setO_cosAmount(rs.getInt("o_cosAmount"));
					odto.setOrderDate(rs.getDate("orderDate"));
					odto.setO_Num(rs.getInt("o_Num"));
					
					ustdo.setOpen_status(rs.getInt("open_status"));
					ustdo.setRemain_amount(rs.getInt("remain_amount"));
					ustdo.setFirst_open(rs.getInt("first_open"));
					ustdo.setStatus_Num(rs.getInt("status_Num"));
					
					
					goodsList.add(gdto2);
					orderList.add(odto);
					usestatusList.add(ustdo);
					System.out.println("저장 완료 " + gdto2 + odto + ustdo);
				}
				
				
				totalList2.add(goodsList);
				totalList2.add(orderList);
				totalList2.add(usestatusList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return totalList2;
		}
		//getorderList
		
		//getordercount
		public int getordercount(String userId){
			int cnt = 0;
			
			try {
				conn = getConnection();
				sql = "select count(*) from cos_list cl join order_board ob on ob.o_cosNum = cl.cosNum where ob.o_userId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					cnt = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return cnt;
		}
		//getordercount
		
		//getusedate
		/**
		 * @param userId
		 * @return totalList
		 * 화장품 사용기한 가져오는 메소드
		 */
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
					
					gdto.setCosNum(rs.getInt("cosNum"));
					gdto.setCosBrand(rs.getString("cosBrand"));
					gdto.setCosImage(rs.getString("cosImage"));
					gdto.setCosCategory(rs.getString("cosCategory"));
					gdto.setUseDate(rs.getInt("useDate"));
					gdto.setCosName(rs.getString("cosName"));
					udto.setOpenNum(rs.getInt("openNum"));
					udto.setOpenDate(rs.getDate("openDate"));
					
					
					useList.add(gdto);
					openList.add(udto);
				}
				
				totalList.add(useList);
				totalList.add(openList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return totalList;
		}
		//getusedate
		
		//regusedatefirstopen
		/**
		 * @param userId
		 * @param cosNum
		 * @param openstatus
		 * @param cosAmount
		 * @param statusnum
		 * 화장품 첫 오픈시 호출 메소드
		 */
		public void regusedate1(String userId,int cosNum,int openstatus,int cosAmount,int statusnum,int oNum){
			int status_Num = 0;
			System.out.println("22222");
			
			try {
				conn = getConnection();
				sql = "select max(status_Num) from use_status";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					status_Num = rs.getInt(1)+1;
				}
				System.out.println("33333");
				
					System.out.println("첫 오픈");
					sql = "insert into use_status values(?,?,?,?,?,?,?,now())";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, status_Num);
					pstmt.setInt(2, oNum);
					pstmt.setInt(3,	cosNum);
					pstmt.setString(4, userId);
					pstmt.setInt(5, 1);
					pstmt.setInt(6, cosAmount-1);
					pstmt.setInt(7, 1);
					
					pstmt.executeUpdate();
					System.out.println("DAO : regusedate 실행완료");
					
					sql =  "insert into open_date (o_Num,openCosNum,openUserId,openDate) values(?,?,?,now())";
					PreparedStatement pstmt2 = conn.prepareStatement(sql);
					pstmt2.setInt(1, oNum);
					pstmt2.setInt(2, cosNum);
					pstmt2.setString(3, userId);
					
					pstmt2.executeUpdate();
					System.out.println("open_date에 insert 완");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
		//regusedate1
		

		//regusedate2
		/**
		 * @param userId
		 * @param cosNum
		 * @param openstatus
		 * @param cosAmount
		 * @param statusnum
		 * 화장품 2번째 이후 오픈 메서드
		 */
		public void regusedate2(String userId,int cosNum,int openstatus,int cosAmount,int statusnum,int oNum){
			int status_Num = 0;
			System.out.println("22222");

				try {
					conn = getConnection();
					sql = "select max(status_Num) from use_status";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						status_Num = rs.getInt(1)+1;
					}
					System.out.println("33333");

						System.out.println("첫 오픈x");
						sql = "update use_status set remain_amount=remain_amount-1,first_date=now() where status_Num = ?"; 
						PreparedStatement pstmt2 = conn.prepareStatement(sql);
						pstmt2.setInt(1, statusnum);
						
						pstmt2.executeUpdate();
					
					System.out.println("44444");
					sql =  "insert into open_date (o_Num,openCosNum,openUserId,openDate) values(?,?,?,now())";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setInt(1, oNum);
					pstmt2.setInt(2, cosNum);
					pstmt2.setString(3, userId);
					
					pstmt2.executeUpdate();
					System.out.println("open_date에 insert 완");
					

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
			}
		//regusedate
		
		
		/**
		 * @param userId
		 * 페이지 업로드 시 실행, use_status에 
		 */
		public void remainupdate(String userId){
			
			int open_Num = 0;
			
			try {
				conn = getConnection();
				sql = "select max(open_Num) from use_status";
				pstmt = conn.prepareStatement(sql);
				
				if(rs.next()){
					open_Num = rs.getInt(1) +1; 
				}
				System.out.println("글번호 테스트");
				

				sql = "insert into use_status (open_Num,cosNum,userId,remain_amount) "
						+ "select ?,o_cosNum,?,o_cosAmount from order_board where o_userId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,open_Num);
				pstmt.setString(2, userId);
				pstmt.setString(3, userId);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			
		}
		
	public void completeuse(int openNum){
		
		try {
			conn = getConnection();
			sql = "delete from open_date where openNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, openNum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
	}
		
	}//UsedateDAO

