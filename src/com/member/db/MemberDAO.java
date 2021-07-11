package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.coupon.db.CouponDTO;

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
				sql = "select userPass from user_info where userId=?";
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
		
		
		// kakaoIdCheck(userEmail)
		public String kakaoIdCheck(String k_Email){
			String check = "";

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userId, kakaoLogin from user_info where kakaoLogin=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, k_Email);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				
				
				if(rs.next()){
					
					check = rs.getString("userId");
					
				}else{
					// 회원정보 x
					check = "";
				}
				
				System.out.println("DAO : 로그인 처리 결과 "+check);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return check;
		}
		// kakaoIdCheck(userEmail)
		
		
		// findId(userName, userEmail) 시작
		public String findId(String userName,String userEmail){
			String check = "";

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userId from user_info where userName=? and userEmail=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, userName);
				pstmt.setString(2, userEmail);
				
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				if(rs.next()){
					check = rs.getString("userId");
					
				}else{
					// 회원정보 x
					check = "";
				}
				
				System.out.println("DAO : 로그인 처리 결과 "+check);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return check;
		}
		// findId(userName, userEmail) 끝
		
		
		// findPw(userName, userEmail) 시작
		public String findPw(String userId,String userEmail, String userTel){
			String check = "";

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userPass from user_info where userId=? and userEmail=? and userTel=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, userId);
				pstmt.setString(2, userEmail);
				pstmt.setString(3, userTel);
				
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				if(rs.next()){
					check = rs.getString("userPass");
					
				}else{
					// 회원정보 x
					check = "";
				}
				
				System.out.println("DAO : 로그인 처리 결과 "+check);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return check;
		}
		// findPw(userName, userEmail) 끝
		
	
		// findPwAjax(userId, userEmail, userTel) 시작
//		public int findPwAjax(String userId, String userEmail, String userTel){
//			int check = -1;
//
//			System.out.println("넘어온 userId 는 : @@@@@@@@@@@@@@ " + userId);
//			System.out.println("넘어온 userEmail 는 : @@@@@@@@@@@@@@ " + userEmail);
//			System.out.println("넘어온 userTel 는 : @@@@@@@@@@@@@@ " + userTel);
//			
//			try {
//				// 1,2 디비연결
//				conn = getConnection();
//				// 3 sql 구문 & pstmt 객체생성
//				sql = "select userPass from user_info where userId=? and userEmail=? and userTel =?";
//				pstmt = conn.prepareStatement(sql);
//				//?
//				pstmt.setString(1, userId);
//				pstmt.setString(2, userEmail);
//				pstmt.setString(3, userTel);
//				
//				// 4 sql 실행
//				rs = pstmt.executeQuery();
//				// 5 데이터 처리 (본인확인)
//				if(rs.next()){
//					check = 0;
//					
//				}else{
//					// 회원정보 x
//					check = -1;
//				}
//				System.out.println("DAO : 로그인 처리 결과 "+check);
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				closeDB();
//			}
//			
//			return check;
//		}
		// findPwAjax(userId, userEmail, userTel) 끝
		
		
		
		
		// findPwCerAction 시작
		
		public int findPwCerAction(String userId, String userEmail, String userTel){
			int check = -1;

			System.out.println("넘어온 userId 는 : @@@@@@@@@@@@@@ " + userId);
			System.out.println("넘어온 userEmail 는 : @@@@@@@@@@@@@@ " + userEmail);
			System.out.println("넘어온 userTel 는 : @@@@@@@@@@@@@@ " + userTel);
			
			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userPass from user_info where userId=? and userEmail=? and userTel =?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, userId);
				pstmt.setString(2, userEmail);
				pstmt.setString(3, userTel);
				
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				if(rs.next()){
					check = 0;
					
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
		
		
		// findPwCerAction 끝
		
		
		// CheckPw(userId, rm) 시작
		public void CheckPw(String userId, String rm){
			String check = "";

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "update user_info set userPwCheck=? where userId=?";
				
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, rm);
				pstmt.setString(2, userId);
				
				// 4 sql 실행
				pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
		
		// CheckPw(userId, rm)  끝
		
		
		// PwCheck(checkNum) 시작 .. 가져온 인증번호를 디비에 대비해보는 메소드
		public String PwCheck(String checkNum, String rm){
			String check = "";
			
			System.out.println("PwCheckId 는 @@@@@@@@ " + rm);
			
			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userPass from user_info where userPwCheck=? and userId=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, checkNum);
				// pstmt.setString(2, PwCheckId);

				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				if(rs.next()){
					check = rs.getString("userPass");
					
				}else{
					// 회원정보 x
					check = "";
				}
				
				System.out.println("DAO : 로그인 처리 결과 "+check);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return check;
		}
		// PwCheck(checkNum) 끝 .. 가져온 인증번호를 디비에 대비해보는 메소드
		
		// getMemberInfo
		/**
		 * @param userId
		 * @return dto 회원정보 조회, mypage 쿠폰,포인트,피부타입 조회에 사용
		 */
		public MemberDTO getMemberInfo(String userId) {
			MemberDTO dto = null;
			try {
				conn = getConnection();
				sql = "select * from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto = new MemberDTO();

					dto.setUserId(rs.getString("userId"));
					dto.setUserPass(rs.getString("userPass"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserEmail(rs.getString("userEmail"));
					dto.setUserAddr(rs.getString("userAddr"));
					dto.setUserTel(rs.getString("userTel"));
					dto.setUserBirth(rs.getString("userBirth"));
					dto.setUserGender(rs.getString("userGender"));
					dto.setUserSkinType(rs.getString("userSkinType"));
					dto.setUserTrouble(rs.getString("userTrouble"));
					dto.setUserPoint(rs.getInt("userPoint"));
					dto.setUserTotal(rs.getInt("userTotal"));
					dto.setUserPoint(rs.getInt("userPoint"));
					dto.setUserLevel(rs.getInt("userLevel"));
				}
				System.out.println("DAO : 회원정보 저장완료");

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return dto;
		}

		// getMemberInfo

		// PassCheck(userId,userPass);
		/**
		 * @param userId
		 * @param userPass
		 * @return int check 1:일치 0:비밀번호 일치x 회원정보 수정페이지 클릭시 pass일치여부 확인하는 메소드
		 */
		public int PassCheck(String userId, String userPass) {
			int check = -1;
			try {

				conn = getConnection();
				sql = "select userPass from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					if (userPass.equals(rs.getString("userPass"))) {
						// 본인
						check = 1;
					} else {
						// 비밀번호 일치x
						check = 0;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}// PassCheck(userId,userPass);

		// updatemembertel(mdto);
		
		/**
		 * @param mdto
		 * @return int result
		 * 회원정보 수정  전화번호 업데이트 메소드
		 */
		public int updatemembertel(MemberDTO mdto) {
			int result = -1;
			try {


				conn = getConnection();
				sql = "select * from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getUserId());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					sql = "update user_info set userTel=? where userId=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, mdto.getUserTel());
					pstmt.setString(2, mdto.getUserId());
					pstmt.executeUpdate();
					System.out.println("휴대폰번호 수정완료");
					result = 1;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		}

		//updatemembertel(mdto);
		
		//updatemembermail(mdto)
		
		/**
		 * @param mdto
		 * @return
		 * 회원정보 수정  메일 업데이트 메소드
		 */
		public int updatemembermail(MemberDTO mdto) {
			int result = -1;
			try {
				conn = getConnection();
				sql = "select * from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getUserId());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					sql = "update user_info set userEmail=? where userId=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, mdto.getUserEmail());
					pstmt.setString(2, mdto.getUserId());
					pstmt.executeUpdate();
					System.out.println("이메일 수정완료");
					result = 1;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		}
		// updatemembermail(mdto)

		// updatememberpw(userId,number)
		
		/**
		 * @param userId
		 * @param userPass
		 * @param newpw1
		 * @return
		 * 회원정보 수정  비밀번호 업데이트 메소드
		 */
		public int updatememberpw(String userId, String userPass, String newpw1) {
			int result = -1;
			try {
				conn = getConnection();
				sql = "select userPass from user_info where userId=?";
				System.out.println("111111111111");
				System.out.println(userId);
				System.out.println(userPass);
				System.out.println(newpw1);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (userPass.equals(rs.getString("userPass"))) {

						sql = "update user_info set userPass=? where userId=?";
						pstmt = conn.prepareStatement(sql);

						pstmt.setString(1, newpw1);
						pstmt.setString(2, userId);
						pstmt.executeUpdate();
						System.out.println("이메일 수정완료");
						result = 1;
					} else {// 비밀번호 불일치
						result = 0;

					}
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;

		}
		// updatememberpw(userId,number)

		// updatememberskin(mdto)
		
		/**
		 * @param mdto
		 * @return
		 * 회원정보 수정  선택정보 업데이트 메소드
		 */
		public int updatememberskin(MemberDTO mdto) {
			int result = -1;
			try {
				conn = getConnection();
				sql = "select * from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getUserId());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					sql = "update user_info set userTrouble=?,userSkinType=? where userId=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, mdto.getUserTrouble());
					pstmt.setString(2, mdto.getUserSkinType());
					pstmt.setString(3, mdto.getUserId());
					pstmt.executeUpdate();
					System.out.println("피부타입 수정완료");
					result = 1;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return result;
		}
		// updatememberskin(mdto)

		// deleteMember(userId,userPass)
		/**
		 * @param userId
		 * @param userPass
		 * @return int check 회원정보 탈퇴 메소드
		 */
		public int deleteMember(String userId, String userPass) {
			int check = -1;

			try {
				conn = getConnection();
				sql = "select userPass from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					if (userPass.equals(rs.getString("userPass"))) {
						sql = "delete from user_info where userId=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);

						check = pstmt.executeUpdate();
					} else {
						check = 0;
					}

				} else {
					check = -1;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}
		// deleteMember(userId,userPass)

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
			}finally {
				closeDB();
			}

			return couponList;
		}
	// mycouponlist(userId);
		
		// NewPassCheck(String newPass) 시작
		public void NewPassCheck(String newPass, String userId){
			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "update user_info set userPass=? where userId=?";
				
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, newPass);
				pstmt.setString(2, userId);
				
				// 4 sql 실행
				pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
		// NewPassCheck(String newPass) 끝
		
		// NaverIdCheck(n_Email)
		public String NaverIdCheck(String n_Email){
			String check = "";

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userId, naverLogin from user_info where naverLogin=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, n_Email);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				
				if(rs.next()){
					
					check = rs.getString("userId");
					
				}else{
					// 회원정보 x
					check = "";
				}
				
				System.out.println("DAO : 로그인 처리 결과 "+check);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return check;
		}
		// NaverIdCheck(n_Email)
		
		
		// ConNaver(userId, userPass, n_email) 시작
		public int ConNaver(String userId,String userPass, String n_email){
			int check = -1;

			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userPass from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, userId);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				
				//아이디 있음
				if(rs.next()){
					if(userPass.equals(rs.getString("userPass"))){
						// 비밀번호 일치 본인 
						sql = "update user_info set naverLogin=? where userId=?";
						pstmt = conn.prepareStatement(sql);
						//?
						pstmt.setString(1, n_email);
						pstmt.setString(2, userId);
						
						// 4 sql 실행
						pstmt.executeUpdate();
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
		
		// ConNaver(userId, userPass, n_email) 끝
		
		
		// ConKakao(userId, userPass, k_email) 시작
		public int ConKakao(String userId,String userPass, String k_email){
			int check = -1;


			try {
				// 1,2 디비연결
				conn = getConnection();
				// 3 sql 구문 & pstmt 객체생성
				sql = "select userPass from user_info where userId=?";
				pstmt = conn.prepareStatement(sql);
				//?
				pstmt.setString(1, userId);
				// 4 sql 실행
				rs = pstmt.executeQuery();
				// 5 데이터 처리 (본인확인)
				
				//아이디 있음
				if(rs.next()){
					if(userPass.equals(rs.getString("userPass"))){
						// 비밀번호 일치 본인 
						sql = "update user_info set kakaoLogin=? where userId=?";
						pstmt = conn.prepareStatement(sql);
						//?
						pstmt.setString(1, k_email);
						pstmt.setString(2, userId);
						
						// 4 sql 실행
						pstmt.executeUpdate();
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
		
		// ConKakao(userId, userPass, k_email) 끝
		
		/////////////// Member Join DAO /////////////////
		        
		//mailAddrCheck() -> 이메일이 DB에 있는지 확인
		
		public int mailAddrCheck(String mail){
		   
		   int result = 0;
		   
		   try {
		      conn = getConnection();
		
		      sql="select * from user_info where userEmail=?";
		   
		      pstmt = conn.prepareStatement(sql);
		      
		      pstmt.setString(1, mail);
		      
		      rs = pstmt.executeQuery();
		      
		      if(rs.next()){
		         result=1; //메일주소 있음 사용x
		      }else{
		         result=0; //메일주소 없음 사용ㅇ
		      }
		
		   } catch (SQLException e) {
		      
		      e.printStackTrace();
		   }finally{
		      closeDB();
		   }
		   
		   return result;
		}
		
		//mailAddrCheck() -> 이메일이 DB에 있는지 확인
		
		
		//signUpIdCheck() ->ajax 중복 id 확인
		
		public int signUpIdCheck(String userId) {
		    
		   int result = 0;
		
		   try {
		      conn = getConnection();
		      
		      sql="select * from user_info where userId=?";
		      
		      PreparedStatement pstmt = conn.prepareStatement(sql);
		      
		      pstmt.setString(1, userId);
		      
		      rs = pstmt.executeQuery();
		      
		      if(rs.next()){
		            return 1;      //아이디 있음 사용X
		      }else{
		            return 0;      //아이디 없음 사용O
		      }
		      
		      } catch (SQLException e) {
		      
		      e.printStackTrace();
		      } finally{
		         closeDB();
		      }
		   
		   return result;
		}
		
		//signUpIdCheck() ->ajax 중복 id 확인
		
		//insertMember() 시작    -> 회원가입 폼에 있는 정보 DB로 전달
		public void insertMember(MemberDTO mdto, String referral_id){
		      
			System.out.println(" 카카오에서 받아오는 값은 kkkkkkkkkkkkkkkkkk :" + mdto.getKakaoLogin());
			System.out.println(" 네이버에서 받아오는 값은 nnnnnnnnnnnnnnnnnn :" + mdto.getNaverLogin());
			
		      int num = 0;
		
		      int point = 500;
		   
		   try {   
		      conn = getConnection();
		      
		      sql = "select max(userNum) from user_info";
		      
		      pstmt = conn.prepareStatement(sql);
		      
		      rs = pstmt.executeQuery();
		      
		         System.out.println("회원번호: "+num);
		      
		      if(rs.next()){
		         num = rs.getInt(1)+1;
		      }
		      
		         
		      if(referral_id != ""){
		         System.out.println("추천인 아이디: "+referral_id);
		            conn = getConnection();
		            //추천인 아이디가 있을 경우, 회원정보 입력
		         
		            sql="insert into user_info (userNum, userId, userPass, userName, userEmail, userAddr, userTel, "
		                  + "userBirth, userGender, userSkinType, userTrouble) values(?,?,?,?,?,?,?,?,?,?,?)";
		            
		            pstmt = conn.prepareStatement(sql);
		            
		            pstmt.setInt(1, num);
		            pstmt.setString(2, mdto.getUserId());
		            pstmt.setString(3, mdto.getUserPass());
		            pstmt.setString(4, mdto.getUserName());
		            pstmt.setString(5, mdto.getUserEmail());
		            pstmt.setString(6, mdto.getUserAddr());
		            pstmt.setString(7, mdto.getUserTel());
		            pstmt.setString(8, mdto.getUserBirth());
		            pstmt.setString(9, mdto.getUserGender());
		            pstmt.setString(10, mdto.getUserSkinType());
		            pstmt.setString(11, mdto.getUserTrouble());
		   
		            
		            pstmt.executeUpdate();
		            
		            System.out.println("회원가입: 저장완료");      
		            
		            conn = getConnection();
		
		            sql="update user_info set userPoint=userPoint+? where userId=? "
		                  + "or userId=?";
		            
		            pstmt = conn.prepareStatement(sql);
		            
		            pstmt.setInt(1,point);
		            pstmt.setString(2, mdto.getUserId());
		            pstmt.setString(3, referral_id);
		            
		            pstmt.executeUpdate();
		            
		      //      System.out.println("회원가입 추천인,신규회원: 포인트 지급 완료");                           
		         
		      
		         }else {
		            //추천인 아이디가 없을 경우, 회원 가입만 시키기.
		            
		            conn = getConnection();
		            
		            sql="insert into user_info (userNum, userId, userPass, userName, userEmail, userAddr, userTel, "
		                  + "userBirth, userGender, userSkinType, userTrouble) values(?,?,?,?,?,?,?,?,?,?,?)";
		            
		            pstmt = conn.prepareStatement(sql);
		            
		            
		            pstmt.setInt(1, num);
		            pstmt.setString(2, mdto.getUserId());
		            pstmt.setString(3, mdto.getUserPass());
		            pstmt.setString(4, mdto.getUserName());
		            pstmt.setString(5, mdto.getUserEmail());
		            pstmt.setString(6, mdto.getUserAddr());
		            pstmt.setString(7, mdto.getUserTel());
		            pstmt.setString(8, mdto.getUserBirth());
		            pstmt.setString(9, mdto.getUserGender());
		            pstmt.setString(10, mdto.getUserSkinType());
		            pstmt.setString(11, mdto.getUserTrouble());
		   
		            pstmt.executeUpdate();
		            
		         //   System.out.println("회원가입: 저장완료");      
		            
		            conn = getConnection();
		            sql="update user_info set userPoint=userPoint+? where userId=?";
		            
		            pstmt = conn.prepareStatement(sql);
		            
		            pstmt.setInt(1, mdto.getUserPoint()+point);
		            pstmt.setString(2, mdto.getUserId());
		            
		            
		            pstmt.executeUpdate();
		
		            System.out.println("회원가입 신규회원: 포인트 지급 완료 (추천인x)");   
		         
		      }
		      
		      
		      
		      if(!mdto.getNaverLogin().equals(null) || !mdto.getNaverLogin().equals("")){
		    	  conn = getConnection();
			      
			      sql = "update user_info set naverLogin=? where userId=?";
			      
			      pstmt = conn.prepareStatement(sql);
			      
		          pstmt.setString(1, mdto.getNaverLogin());
		          pstmt.setString(2, mdto.getUserId());
			      
			      
			      pstmt.executeUpdate();
			      
		      }
		      
		      if(!mdto.getKakaoLogin().equals(null) || !mdto.getKakaoLogin().equals("")){
	    	  conn = getConnection();
		      
	    	  sql = "update user_info set kakaoLogin=? where userId=?";
		      
		      pstmt = conn.prepareStatement(sql);
		      
	          pstmt.setString(1, mdto.getKakaoLogin());
	          pstmt.setString(2, mdto.getUserId());
			      
		      pstmt.executeUpdate();
		    	  
		      }
		         
		   } catch (SQLException e) {
		      
		      e.printStackTrace();
		   } finally{
		      closeDB();
		   }
		
		}
		//insertMember() 끝
		
		//insertCoupon(userId)
	      public void insertCoupon(String userId){
	         
	         int num=0;
	         
	         try {
	            
	            conn = getConnection();
	         
	         //mcNum, mcCouponNum, mcUserId, mcAmount
	         // mcCouponNum = 1 -> 회원가입 축하 쿠폰 No.

	         sql = "select max(mcNum) from my_coupon";
	      
	            pstmt = conn.prepareStatement(sql);
	            
	            rs = pstmt.executeQuery();
	            
	         if(rs.next()){
	            num = rs.getInt(1)+1;
	         }
	         
	         System.out.println("mcNum : "+num);
	         
	         conn = getConnection();
	         sql = "insert into my_coupon values(?,1,?,1)";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	            pstmt.setInt(1, num);
	            pstmt.setString(2, userId);
	            
	            
	            pstmt.executeUpdate(); //insert, update, delete => int 형이라서 rs로 받을수 없음.
	         
	            System.out.println("회원가입 축하 쿠폰 지급 완료");
	            
	         } catch (SQLException e) {            
	            e.printStackTrace();   
	         }finally{
	            closeDB();
	         }

	      }

	      //insertCoupon(userId)
		
		
		/////////////// Member SignUp DAO /////////////////
		
}
