package com.notice.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.goods.db.GoodsDTO;

public class setnoticetool {
	public noticeDTO setdata(noticeDTO noti, ResultSet rs) {

		try {
			noti.setNoticeNum(rs.getInt("noticeNum"));
			noti.setNoticeTitle(rs.getString("noticeTitle"));
			noti.setNoticeContent(rs.getString("noticeContent"));
			noti.setNoticeFile(rs.getString("noticeFile"));
			noti.setNoticeType(rs.getInt("noticeType"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 리스트 한칸에 상품 1개를 저장

		return noti;
	}
}
