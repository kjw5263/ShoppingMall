package com.like.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.goods.db.GoodsDTO;

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
    
    
   
}//DAO
