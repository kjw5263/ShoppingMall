package com.admin.goods.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.coupon.db.CouponDTO;
import com.goods.db.GoodsDTO;
import com.member.db.MemberDTO;
import com.order.db.OrderDTO;

public class AdminGoodsDAO {
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
	
	// insertGoods(gdto)
	public void insertGoods(GoodsDTO gdto){
		int cosNum = 0;
		try {
			conn = getConnection();
			// 1. 상품 번호 계산
			sql = "select max(cosNum) from cos_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cosNum = rs.getInt(1)+1;
			}
			System.out.println("DAO : 상품번호 - "+cosNum);
			
			// 2. 상품등록
			sql = "insert into cos_list(cosNum,cosName,cosPrice,cosBrand,cosCategory,"
					+ "cosSkinType,cosTrouble,cosAmount,cosVolumn,madeCompany,"
					+ "ingredient,cosMethod,cosWarning,cosImage,cosWriteDate) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cosNum);
			pstmt.setString(2, gdto.getCosName());
			pstmt.setInt(3, gdto.getCosPrice());
			pstmt.setString(4, gdto.getCosBrand());
			pstmt.setString(5, gdto.getCosCategory());
			pstmt.setString(6, gdto.getCosSkinType());
			pstmt.setString(7, gdto.getCosTrouble());
			pstmt.setInt(8, gdto.getCosAmount());
			pstmt.setInt(9, gdto.getCosVolumn());
			pstmt.setString(10, gdto.getMadeCompany());
			pstmt.setString(11, gdto.getIngredient());
			pstmt.setString(12, gdto.getCosMethod());
			pstmt.setString(13, gdto.getCosWarning());
			pstmt.setString(14, gdto.getCosImage());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 상품 등록 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// insertGoods(gdto)
	
	// getBoardCount()
	public int getGoodsCount(){
		
		int cnt = 0;
		
		try {
			conn = getConnection();
			sql = "select count(*) from cos_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			
			System.out.println("글 개수 : "+cnt+"개");

		} catch (Exception e) {
			System.out.println("관리자 상품목록 개수 에러 발생");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return cnt;
	}
	
	// getBoardCount()
	
	// getGoodsList()
	public ArrayList getGoodsList(){

		// 상품 정보를 모두 저장하는 가변길이 배열
		ArrayList goodsListAll = new ArrayList();
		
		// 상품 1개의 정보를 저장하는 객체 
		GoodsDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from cos_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				dto = new GoodsDTO();
				
				dto.setCosAmount(rs.getInt("cosAmount"));
				dto.setCosBrand(rs.getString("cosBrand"));
				dto.setCosCategory(rs.getString("cosCategory"));
				dto.setCosImage(rs.getString("cosImage"));
				dto.setCosName(rs.getString("cosName"));
				dto.setCosNum(rs.getInt("cosNum"));
				dto.setCosPrice(rs.getInt("cosPrice"));
				dto.setCosSkinType(rs.getString("cosSkinType"));
				dto.setCosTrouble(rs.getString("cosTrouble"));
				dto.setCosVolumn(rs.getInt("cosVolumn"));
				dto.setCosWriteDate(rs.getDate("cosWriteDate"));
				
				goodsListAll.add(dto);
				
			}//while
			System.out.println("DAO : 관리자 상품리스트 저장 완료");
			System.out.println(" 총 "+goodsListAll.size()+"개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return goodsListAll;
		
	}
	// getGoodsList()
	
	// getGoodsList(startRow,pageSize)
	public ArrayList<GoodsDTO> getGoodsList(int startRow,int pageSize){
		
		// DB데이터 1row 정보를 GoodsDTO 저장 -> ArrayList 한칸에 저장
		
		// 상품리스트의 정보를 원하는 만큼 저장하는 가변길이 배열
		ArrayList<GoodsDTO> goodsList = new ArrayList<GoodsDTO>();
		
		// 상품 1개의 정보를 저장하는 객체 
		GoodsDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from cos_list order by cosNum desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				dto = new GoodsDTO();

				dto.setCosAmount(rs.getInt("cosAmount"));
				dto.setCosBrand(rs.getString("cosBrand"));
				dto.setCosCategory(rs.getString("cosCategory"));
				dto.setCosImage(rs.getString("cosImage"));
				dto.setCosName(rs.getString("cosName"));
				dto.setCosNum(rs.getInt("cosNum"));
				dto.setCosPrice(rs.getInt("cosPrice"));
				dto.setCosSkinType(rs.getString("cosSkinType"));
				dto.setCosTrouble(rs.getString("cosTrouble"));
				dto.setCosVolumn(rs.getInt("cosVolumn"));
				dto.setCosWriteDate(rs.getDate("cosWriteDate"));
				
				goodsList.add(dto);
				
				
			}//while
			
			System.out.println("상품 모든정보 저장완료!");
			System.out.println("총 "+goodsList.size()+"개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return goodsList;
		
	}
	// getGoodsList(startRow,pageSize)
	
	// getGoods(cosNum)
	public GoodsDTO getGoods(int cosNum){
		GoodsDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from cos_list where cosNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cosNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new GoodsDTO();
				
				dto.setCosAmount(rs.getInt("cosAmount"));
				dto.setCosBrand(rs.getString("cosBrand"));
				dto.setCosCategory(rs.getString("cosCategory"));
				dto.setCosName(rs.getString("cosName"));
				dto.setCosNum(rs.getInt("cosNum"));
				dto.setCosPrice(rs.getInt("cosPrice"));
				dto.setCosSkinType(rs.getString("cosSkinType"));
				dto.setCosTrouble(rs.getString("cosTrouble"));
				dto.setCosVolumn(rs.getInt("cosVolumn"));	
				dto.setIngredient(rs.getString("ingredient"));
				dto.setCosMethod(rs.getString("cosMethod"));
				dto.setCosWarning(rs.getString("cosWarning"));
				dto.setMadeCompany(rs.getString("madeCompany"));
			}//if
			System.out.println("DAO : 수정할 상품정보 저장완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	
	// getGoods(cosNum)
	
	// modifyGoods(gdto)
	public void modifyGoods(GoodsDTO gdto){
		try {
			conn = getConnection();
			sql = "update cos_list set "
					+ "cosName=?,cosPrice=?,cosBrand=?,cosCategory=?,"
					+ "cosSkinType=?,cosTrouble=?,cosAmount=?,cosVolumn=?,"
					+ "madeCompany=?,ingredient=?,cosMethod=?,cosWarning=? "
					+ "where cosNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, gdto.getCosName());
			pstmt.setInt(2, gdto.getCosPrice());
			pstmt.setString(3, gdto.getCosBrand());
			pstmt.setString(4, gdto.getCosCategory());
			pstmt.setString(5, gdto.getCosSkinType());
			pstmt.setString(6, gdto.getCosTrouble());
			pstmt.setInt(7, gdto.getCosAmount());
			pstmt.setInt(8, gdto.getCosVolumn());
			pstmt.setString(9, gdto.getMadeCompany());
			pstmt.setString(10, gdto.getIngredient());
			pstmt.setString(11, gdto.getCosMethod());
			pstmt.setString(12, gdto.getCosWarning());
			pstmt.setInt(13, gdto.getCosNum());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 상품정보 수정 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// modifyGoods(gdto)
	
	// deleteGoods(cosNum)
	public void deleteGoods(int cosNum){
		
		try {
			conn = getConnection();
			sql = "delete from cos_list where cosNum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cosNum);
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 상품정보 삭제 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// deleteGoods(cosNum)
	
	///////////////////////////////////////////////////////////////////
	// 관리자 주문, 회원, 쿠폰 리스트
	///////////////////////////////////////////////////////////////////
	
	// getAdminMemberList()
	public List getAdminMemberList(){
		
		List memberList = new ArrayList();
		
		try {
			// 1, 2 디비연결
			conn = getConnection();
			// 3 sql 작성 & pstmt 객체 생성
			sql = "select * from user_info where userId != 'admin'";
			pstmt = conn.prepareStatement(sql);
			//4 sql 실행
			rs = pstmt.executeQuery();
			//5 데이터 처리
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserLevel(rs.getInt("userLevel"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserNum(rs.getInt("userNum"));
				dto.setUserPoint(rs.getInt("userPoint"));
				dto.setUserSkinType(rs.getString("userSkinType"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserTotal(rs.getInt("userTotal"));
				dto.setUserTrouble(rs.getString("userTrouble"));
				
				// 리스트 한칸 -> 1명 정보 저장
				memberList.add(dto);
			}
			
			System.out.println("DAO : 모든 회원 정보 저장 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}
	// getAdminMemberList()
	
	// getMemberList()
	public ArrayList getMemberList(){

		// 상품 정보를 모두 저장하는 가변길이 배열
		ArrayList memberListAll = new ArrayList();
		
		// 상품 1개의 정보를 저장하는 객체 
		MemberDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from user_info";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				dto = new MemberDTO();
				
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserLevel(rs.getInt("userLevel"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserNum(rs.getInt("userNum"));
				dto.setUserPoint(rs.getInt("userPoint"));
				dto.setUserSkinType(rs.getString("userSkinType"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserTotal(rs.getInt("userTotal"));
				dto.setUserTrouble(rs.getString("userTrouble"));
				
				memberListAll.add(dto);
				
			}//while
			System.out.println("DAO : 관리자 회원리스트 저장 완료");
			System.out.println(" 총 "+memberListAll.size()+"개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberListAll;
		
	}
	// getGoodsList()
	
	// getGoodsList(startRow,pageSize)
	public ArrayList<MemberDTO> getMemberList(int startRow,int pageSize){
		
		// DB데이터 1row 정보를 GoodsDTO 저장 -> ArrayList 한칸에 저장
		
		// 상품리스트의 정보를 원하는 만큼 저장하는 가변길이 배열
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		// 상품 1개의 정보를 저장하는 객체 
		MemberDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from user_info order by userNum desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				dto = new MemberDTO();
				
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setUserGender(rs.getString("userGender"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserLevel(rs.getInt("userLevel"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserNum(rs.getInt("userNum"));
				dto.setUserPoint(rs.getInt("userPoint"));
				dto.setUserSkinType(rs.getString("userSkinType"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserTotal(rs.getInt("userTotal"));
				dto.setUserTrouble(rs.getString("userTrouble"));
				
				memberList.add(dto);
				
				
			}//while
			
			System.out.println("회원 모든정보 저장완료!");
			System.out.println("총 "+memberList.size()+"명");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;
		
	}
	// getGoodsList(startRow,pageSize)
	
	// getAdminCouponList()
	public List getAdminCouponList(){
		
		List couponList = new ArrayList();
		
		try {
			// 1, 2 디비연결
			conn = getConnection();
			// 3 sql 작성 & pstmt 객체 생성
			sql = "select * from coupon_type";
			pstmt = conn.prepareStatement(sql);
			// 4 sql 실행
			rs = pstmt.executeQuery();
			// 5 데이터 처리
			while(rs.next()){
				CouponDTO dto = new CouponDTO();
				dto.setCouponNum(rs.getInt("couponNum"));
				dto.setCouponName(rs.getString("couponName"));
				dto.setCouponNote(rs.getString("couponNote"));
				dto.setCouponDc(rs.getInt("couponDc"));
				
				// 리스트 한칸 -> 1개 정보 저장
				couponList.add(dto);
			}
			
			System.out.println("DAO : 모든 쿠폰 정보 저장 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return couponList;
	}
	// getAdminCouponList()
	
	// insertCoupons(cdto)
	public void insertCoupons(CouponDTO cdto){
		int couponNum = 0;
		try {
			conn = getConnection();
			// 1. 상품 번호 계산
			sql = "select max(couponNum) from coupon_type";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				couponNum = rs.getInt(1)+1;
			}
			// 2. 상품등록
			sql = "insert into coupon_type(couponNum,couponName,couponNote,couponDc) values (?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, couponNum);
			pstmt.setString(2, cdto.getCouponName());
			pstmt.setString(3, cdto.getCouponNote());
			pstmt.setInt(4, cdto.getCouponDc());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 쿠폰 등록 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// insertCoupons(cdto)
	
	// getCoupons(couponNum)
	public CouponDTO getCoupons(int couponNum){
		
		CouponDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from coupon_type where couponNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, couponNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new CouponDTO();
				
				dto.setCouponDc(rs.getInt("couponDc"));
				dto.setCouponName(rs.getString("couponName"));
				dto.setCouponNote(rs.getString("couponNote"));
				dto.setCouponNum(rs.getInt("couponNum"));
			}
			System.out.println("DAO : 수정할 쿠폰정보 저장완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	
	
	// getCoupons(couponNum)
	
	// modifyCoupons(cdto)
	public void modifyCoupons(CouponDTO cdto){
		try {
			conn = getConnection();
			sql = "update coupon_type set couponName=?,couponNote=?,couponDc=? where couponNum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cdto.getCouponName());
			pstmt.setString(2, cdto.getCouponNote());
			pstmt.setInt(3, cdto.getCouponDc());
			pstmt.setInt(4, cdto.getCouponNum());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 쿠폰 수정 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// modifyCoupons(cdto)
	
	// deleteCoupons(couponNum)
	
	public void deleteCoupons(int couponNum){
		
		try {
			conn = getConnection();
			sql = "delete from coupon_type where couponNum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, couponNum);
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 쿠폰정보 삭제 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// deleteCoupons(couponNum)
	
	// getOrderCount()
	public int getOrderCount(){
		
		int cnt = 0;
		
		try {
			conn = getConnection();
			sql = "select count(*) from order_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			
			System.out.println("주문 개수 : "+cnt+"개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cnt;
	}
	// getOrderCount()
	
	// getAdminOrderList()
	public List getAdminOrderList(){
	
		List orderList = new ArrayList();
		
		try {
			conn = getConnection();
			sql = "select * from order_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderDTO dto = new OrderDTO();
				
				dto.setAddPoint(rs.getInt("addPoint"));
				dto.setCpUseAmount(rs.getInt("cpUseAmount"));
				dto.setO_cosAmount(rs.getInt("o_cosAmount"));
				dto.setO_cosName(rs.getString("o_cosName"));
				dto.setO_cosNum(rs.getInt("o_cosNum"));
				dto.setO_msg(rs.getString("o_msg"));
				dto.setO_Num(rs.getInt("o_Num"));
				dto.setO_tradeNum(rs.getString("o_tradeNum"));
				dto.setO_userId(rs.getString("o_userId"));
				dto.setOrderDate(rs.getDate("orderDate"));
				dto.setOrderStatus(rs.getString("orderStatus"));
				dto.setPayDate(rs.getDate("payDate"));
				dto.setPayerName(rs.getString("payerName"));
				dto.setPayMoney(rs.getInt("payMoney"));
				dto.setPayType(rs.getString("payType"));
				dto.setPtUseAmount(rs.getInt("ptUseAmount"));
				dto.setReceiverAddr(rs.getString("receiverAddr"));
				dto.setReceiverEmail(rs.getString("receiverEmail"));
				dto.setReceiverName(rs.getString("receiverName"));
				dto.setReceiverTel(rs.getString("receiverTel"));
				dto.setSumMoney(rs.getInt("sumMoney"));
				
				// 리스트 한칸 -> 1명 정보 저장
				orderList.add(dto);
			}
			
			System.out.println("DAO : 모든 회원 주문 정보 저장 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return orderList;
	}
	// getAdminOrderList()
	
	// getOrderList();
	public ArrayList getOrderList(){
		
		// 주문 정보를 모두 저장하는 가변길이 배열
		ArrayList orderListAll = new ArrayList();
		
		// 주문 정보 1개를 저장하는 객체
		OrderDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from order_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto = new OrderDTO();
				
				dto.setAddPoint(rs.getInt("addPoint"));
				dto.setCpUseAmount(rs.getInt("cpUseAmount"));
				dto.setO_cosAmount(rs.getInt("o_cosAmount"));
				dto.setO_cosName(rs.getString("o_cosName"));
				dto.setO_cosNum(rs.getInt("o_cosNum"));
				dto.setO_msg(rs.getString("o_msg"));
				dto.setO_Num(rs.getInt("o_Num"));
				dto.setO_tradeNum(rs.getString("o_tradeNum"));
				dto.setO_userId(rs.getString("o_userId"));
				dto.setOrderDate(rs.getDate("orderDate"));
				dto.setOrderStatus(rs.getString("orderStatus"));
				dto.setPayDate(rs.getDate("payDate"));
				dto.setPayerName(rs.getString("payerName"));
				dto.setPayMoney(rs.getInt("payMoney"));
				dto.setPayType(rs.getString("payType"));
				dto.setPtUseAmount(rs.getInt("ptUseAmount"));
				dto.setReceiverAddr(rs.getString("receiverAddr"));
				dto.setReceiverEmail(rs.getString("receiverEmail"));
				dto.setReceiverName(rs.getString("receiverName"));
				dto.setReceiverTel(rs.getString("receiverTel"));
				dto.setSumMoney(rs.getInt("sumMoney"));
				
				orderListAll.add(dto);
			}
			System.out.println("DAO : 관리자 주문리스트 저장 완료");
			System.out.println(" 총 "+orderListAll.size()+"개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return orderListAll;
	}
	// getOrderList();
	
	// getOrderList(startRow,pageSize)
	public ArrayList<OrderDTO> getOrderList(int startRow,int pageSize){
		
		// DB데이터 1row 정보를 OrderDTO 저장 -> ArrayList 한칸에 저장
		
		// 주문리스트의 정보를 원하는 만큼 저장하는 가변길이 배열
		ArrayList<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		// 주문 정보 1개를 저장하는 객체
		OrderDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from order_board order by o_Num desc limit ?,?";
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				dto = new OrderDTO();
				
				dto.setAddPoint(rs.getInt("addPoint"));
				dto.setCpUseAmount(rs.getInt("cpUseAmount"));
				dto.setO_cosAmount(rs.getInt("o_cosAmount"));
				dto.setO_cosName(rs.getString("o_cosName"));
				dto.setO_cosNum(rs.getInt("o_cosNum"));
				dto.setO_msg(rs.getString("o_msg"));
				dto.setO_Num(rs.getInt("o_Num"));
				dto.setO_tradeNum(rs.getString("o_tradeNum"));
				dto.setO_userId(rs.getString("o_userId"));
				dto.setOrderDate(rs.getDate("orderDate"));
				dto.setOrderStatus(rs.getString("orderStatus"));
				dto.setPayDate(rs.getDate("payDate"));
				dto.setPayerName(rs.getString("payerName"));
				dto.setPayMoney(rs.getInt("payMoney"));
				dto.setPayType(rs.getString("payType"));
				dto.setPtUseAmount(rs.getInt("ptUseAmount"));
				dto.setReceiverAddr(rs.getString("receiverAddr"));
				dto.setReceiverEmail(rs.getString("receiverEmail"));
				dto.setReceiverName(rs.getString("receiverName"));
				dto.setReceiverTel(rs.getString("receiverTel"));
				dto.setSumMoney(rs.getInt("sumMoney"));
				
				orderList.add(dto);
			}
			
			System.out.println("모든 주문정보 저장완료");
			System.out.println("총 "+orderList.size()+"명");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return orderList;
	}
	// getOrderList(startRow,pageSize)
	
	// OrderStatusModify(odto)
	public void OrderStatusModify(OrderDTO odto){
		try {
			conn = getConnection();
			sql = "update order_board set orderStatus=? where o_Num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, odto.getOrderStatus());
			pstmt.setInt(2, odto.getO_Num());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 주문 상태 수정 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// OrderStatusModify(odto)
	
	// detailOrder(o_Num)
	public Vector detailOrder(String o_tradeNum){
		
		Vector totalDetail = new Vector();
		List detailOrder = new ArrayList();
		List detailGoods = new ArrayList();
		
		try {
			conn = getConnection();
			
			sql = "select c.cosImage, o.* "
					+ "from order_board o join cos_list c "
					+ "on o.o_cosNum = c.cosNum "
					+ "where o.o_tradeNum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o_tradeNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				OrderDTO orDTO = new OrderDTO();
				GoodsDTO goDTO = new GoodsDTO();
				orDTO.setAddPoint(rs.getInt("addPoint"));
				orDTO.setCpUseAmount(rs.getInt("cpUseAmount"));
				orDTO.setO_cosAmount(rs.getInt("o_cosAmount"));
				orDTO.setO_cosName(rs.getString("o_cosName"));
				orDTO.setO_cosNum(rs.getInt("o_cosNum"));
				orDTO.setO_msg(rs.getString("o_msg"));
				orDTO.setO_tradeNum(rs.getString("o_tradeNum"));
				orDTO.setO_userId(rs.getString("o_userId"));
				orDTO.setOrderDate(rs.getDate("orderDate"));
				orDTO.setOrderStatus(rs.getString("orderStatus"));
				orDTO.setPayDate(rs.getDate("payDate"));
				orDTO.setPayerName(rs.getString("payerName"));
				orDTO.setPayMoney(rs.getInt("payMoney"));
				orDTO.setPayType(rs.getString("payType"));
				orDTO.setPtUseAmount(rs.getInt("ptUseAmount"));
				orDTO.setReceiverAddr(rs.getString("receiverAddr"));
				orDTO.setReceiverEmail(rs.getString("receiverEmail"));
				orDTO.setReceiverName(rs.getString("receiverName"));
				orDTO.setReceiverTel(rs.getString("receiverTel"));
				orDTO.setSumMoney(rs.getInt("sumMoney"));
				goDTO.setCosImage(rs.getString("cosImage"));
				
				// 리스트 한칸에 주문정보 객체 1개를 저장
				detailOrder.add(orDTO);
				detailGoods.add(goDTO);
			}
			System.out.println("DAO : 주문번호에 해당하는 상품 모두 저장완료");
			totalDetail.add(detailGoods);
			totalDetail.add(detailOrder);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return totalDetail;
	}
	
	// deleteOrder(o_tradeNum)
	public void deleteOrder(String o_tradeNum){
		try {
			conn = getConnection();
			sql = "delete from order_board where o_tradeNum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o_tradeNum);
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 주문내역 삭제 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// deleteOrder(o_tradeNum)

}


























