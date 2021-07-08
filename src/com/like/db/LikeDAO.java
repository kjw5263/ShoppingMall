package com.like.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.goods.db.GoodsDTO;
import com.member.db.MemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class LikeDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = "";

    private Connection getConnection() {
        try {
            // Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
            Context initCTX = new InitialContext();
            // DB연동 정보를 불러오기(context.xml)
            DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/cosShopping");

            conn = ds.getConnection();

            System.out.println(" 드라이버 로드, 디비연결 성공! ");
            System.out.println(conn);

        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }// getConnection() - 디비연결 끝

    // 자원해제코드 - finally 구문에서 사용
    public void closeDB() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public List getLikeList(String userId){
    	
    	List LikeList = new ArrayList();

		try {
			conn = getConnection();
			sql = "select * from cos_list c join like_list l on l.likeCosNum = c.cosNum where l.likeUserId = ? order by likeNum desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs =pstmt.executeQuery();
			
			while(rs.next()){
				GoodsDTO gdto = new GoodsDTO();
				
				gdto.setCosNum(rs.getInt("cosNum"));
				gdto.setCosImage(rs.getString("cosImage"));
				gdto.setCosName(rs.getString("cosName"));
				gdto.setCosBrand(rs.getString("cosBrand"));
				gdto.setCosPrice(rs.getInt("cosPrice"));
				
				LikeList.add(gdto);
			}
			System.out.println("DAO :찜목록 저장완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
    	
    	return LikeList;
    }
	
    
    //deleteLike(userId,cosnum)
    public int deleteLike(String userId,int cosnum){
    	int check = 0;
    	try {
    		conn = getConnection();
    		sql = "delete from like_list where likeCosNum=? and likeUserId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cosnum);
			pstmt.setString(2, userId);
			
			pstmt.executeUpdate();
			
			check = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
    	return check;
    }
    
    //deleteLike(userId,cosnum)
    
	//getlistCount()
	public int getlistCount(String userId){
		int cnt = 0;
		
		try {
			conn = getConnection();
			sql = "select count(*) from like_list where likeUserId=?";
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
	//getlistCount()
	
	//getLikeList(userId,startRow,pageSize)
	public List getLikeList(String userId, int startRow,int pageSize){
		List LikeList2 = new ArrayList();
		try {
			conn = getConnection();
			sql = "select * from cos_list c join like_list l on l.likeCosNum = c.cosNum "
					+ "where l.likeUserId = ? order by likeNum desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			rs =pstmt.executeQuery();
			
			while(rs.next()){
				GoodsDTO gdto = new GoodsDTO();
				
				gdto.setCosNum(rs.getInt("cosNum"));
				gdto.setCosImage(rs.getString("cosImage"));
				gdto.setCosName(rs.getString("cosName"));
				gdto.setCosBrand(rs.getString("cosBrand"));
				gdto.setCosPrice(rs.getInt("cosPrice"));
				
				LikeList2.add(gdto);
			}
			System.out.println("DAO :찜목록 저장완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
    	
    	return LikeList2;
		
	}
	//getLikeList(userId,startRow,pageSize)
    
	
	// insertLike 시작
	public int insertLike(String id, int cosNum){
		int check = 0;
		int num = 0;

		try {
			// 1 드라이버 로드
			// 2 디비 연결
			// => 한번에 처리하는 메소드로 변경
			conn = getConnection();
			
			sql = "select * from like_list where likeUserId=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
							
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				
				// 현재 캠핑지 이름이 DB안의 캠핑지 이름중에 존재할 때
				if(rs.getInt("likeCosNum") == cosNum){
					// 이미 존재하는 즐겨찾기 목록이다.
					System.out.println("디비에 있는 화장품 번호는 @@@@@@@@@@ : " + rs.getString("likeCosNum"));			
					System.out.println("현재 게시글 화장품 번호는 ########## : " + cosNum);
					check = -1;
				}else{
					// 겹치는 목록 없음
					System.out.println("디비에 있는 화장품 번호는 @@@@@@@@@@ : " + rs.getString("likeCosNum"));			
					System.out.println("현재 게시글 화장품 번호는 ########## : " + cosNum);						
					// 3 sql (글 번호를 계산하는 구문)
					}
				}
			
				if(check == 0){
					sql = "select max(likeNum) from like_list";

					pstmt = conn.prepareStatement(sql);

					// 4 sql 실행
					rs = pstmt.executeQuery();

					// 5 데이터 처리
					if (rs.next()) {
						num = rs.getInt(1) + 1;
					}

					System.out.println(" 글 번호 : " + num);
					
					// 3 sql 작성 (insert) & pstmt 객체 생성
					sql = "insert into like_list values(?, ?, ?)";

					pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, num);
					pstmt.setString(2, id);
					pstmt.setInt(3, cosNum);

					// 4 sql 실행

					pstmt.executeUpdate();

					System.out.println("sql구문 실행 완료 : 찜 추가 완료");
					
					
					// camp_camp 테이블의 count 1올리는 sql
					
//					sql = "update camp_camp set count = count + 1 where name= ?";
//					
//					pstmt = conn.prepareStatement(sql);
//					
//					pstmt.setString(1, lb.getBname());						
//										
//					pstmt.execute();
//
//					System.out.println("즐겨찾기 cout증가 완료 !!!!!!!!!!!");
				}
	         
	   } catch (SQLException e) {
	      
	      e.printStackTrace();
	   } finally{
	      closeDB();
	   }
		return check;
	
	}
	// insertLike 끝
	
	
   
}//DAO
