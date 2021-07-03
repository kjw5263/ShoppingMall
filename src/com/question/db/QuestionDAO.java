package com.question.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.faq.db.FaqDTO;
import com.goods.db.GoodsDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class QuestionDAO {
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
	
	// getFaqList() 시작
	public List getQueList() {
		List queList = new ArrayList();
		try {
			conn = getConnection();
			sql = "select * from question_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QuestionDTO qdto = new QuestionDTO();
				qdto.setQnum(rs.getInt("Qnum"));
				qdto.setQsub(rs.getString("Qsub"));

				// 리스트 한칸에 faq 1개를 저장
				queList.add(qdto);

			} // while

			System.out.println("DAO : queList 리스트 저장 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return queList;
	}
	// getFaqList() 끝
	
	// getListCount() 시작 ( 캠핑장 게시판 게시글 수 기능 )
	public int getListCount() {

		int cnt = 0;

		try {
			// 1, 2 드라이버로드, 디비연결
			conn = getConnection();

			// 3 sql 작성(select) & pstmt 객체 생성
			sql = "select count(*) from question_list";

			pstmt = conn.prepareStatement(sql);

			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			if (rs.next()) {
				cnt = rs.getInt(1);
			} // try

			System.out.println("SQL 구문 실행 완료!");
			System.out.println(" 질문 개수 : " + cnt + "개");

		} catch (Exception e) {
			System.out.println(" 질문 개수 에러 발생 !!");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cnt;
	}
	// getBoardCount() 끝	
	
	// getBoardList(int startRow, int pageSize) 시작 ( 캠핑지 게시판 게시글 시작 끝 기능 )
	public ArrayList getBoardList(int startRow, int pageSize) {
		// DB데이터 1행의 정보를 BoardBean에 저장 -> ArrayList 한칸에 저장

		// 게시판의 글 정보를 원하는 만큼 저장하는 가변길이 배열
		ArrayList QueList = new ArrayList();

		// 게시판 글 1개의 정보를 저장하는 객체
		QuestionDTO qdto = null;

		try {
			// 1, 2 드라이버 로드, 디비 열결
			conn = getConnection();

			// 3sql 구문 & pstmtm객체
			// 글 정보 정렬 - re_ref 값을 최신글 위쪽으로 정렬(내림차순)
			//				- re_seq 값을 사용 (오름 차순)
			//				- limit a, b (a 시작, b 개수)
			//				ex) 1번글 -> 0번 인덱스
			
			
			sql = "select * from question_list "
					+ "order by Qnum asc"
					+ " limit ?,?";
			

			//
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			while (rs.next()) {
				// 데이터 있을 때 bb 객체 생성
				qdto = new QuestionDTO();

				// DB정보를 Bean에 저장하기
				qdto.setQnum(rs.getInt("Qnum"));
				qdto.setQsub(rs.getString("Qsub"));
				

				
				// Bean -> ArrayList 한칸에 저장
				QueList.add(qdto);

			} // while
			
			System.out.println(" 게시판 모든 정보 저장완료 ");
			System.out.println(" 총 " + QueList.size() + " 개");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return QueList;
	}
	// getBoardList(int startRow, int pageSize) 끝
		
		
	// deleteQue(int Qnum) 시작
	public int deleteQue(int faqNum) {
		int check = -1;
		
		try {
			conn = getConnection();
			sql = "select * from question_list where Qnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "delete from question_list where Qnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, faqNum);
				
				pstmt.executeUpdate();

				check = 0;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}	
	// deleteFaq(faqNum) 끝
	
	// queWrite(String Qsub) 시작
	public void queWrite(String Qsub){
		int num = 0;
		try {
			conn = getConnection();
			// 1. 상품 번호 계산
			sql="select max(Qnum) from question_list";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//select max(num) from itwill_goods;
			// => 값이 없을 경우 null표시,
			//    내장함수 호출하는경우 항상 커서가 존재함 (rs.next()==true)
			//select num from itwill_goods;
			// => 값이 없을 경우 null표시, 커서는 X(rs.next()==false)
			if(rs.next()){
				num = rs.getInt(1)+1;
				//num = rs.getInt("max(num)")+1;
			}	
			System.out.println("DAO : 질문번호 - "+num);
			
			// 2. 상품등록
			sql = "insert into question_list values(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, Qsub);
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 질문 등록 완료!");			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}	
	// faqWrite(faqdto) 끝
	
	// reviseQue(Qnum) 시작
	public String reviseQue(int Qnum) {
		
		String Qsub = "";
		
		try {
			conn = getConnection();
			sql = "select * from question_list where Qnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Qnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				Qsub = rs.getString("Qsub");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return Qsub;
	}	
	// reviseFaq(faqNum) 끝
	
	// queRevisePro 시작
	public void queRevisePro(int Qnum, String Qsub){
		try {
			conn = getConnection();
			// 1. 상품 번호 계산
			sql="select * from question_list where Qnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Qnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				sql = "update question_list set Qsub=? where Qnum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, Qsub);
				pstmt.setInt(2, Qnum);
				
				pstmt.executeUpdate();
				
				System.out.println("DAO : 질문 글 수정 완료!");	
			}
			
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}	
	// faqRevisePro 끝
	
	
	// CustomizedList()
	public ArrayList CustomizedList(String userSkinType){

		// 상품 정보를 모두 저장하는 가변길이 배열
		ArrayList CustomizedList = new ArrayList();
		
		// 상품 1개의 정보를 저장하는 객체 
		GoodsDTO dto = null;
		
		try {
			conn = getConnection();
			sql = "select * from cos_list where cosSkinType = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userSkinType);
			
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
				
				CustomizedList.add(dto);
				
			}//while
			System.out.println("DAO : 맞춤 화장 저장 완료");
			System.out.println(" 총 "+CustomizedList.size()+"개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return CustomizedList;
		
	}
	// getGoodsList()	
	
	
	
	
}
