package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CartDao extends SuperDao{
	
	public int createCart(Long memberId) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "insert into cart (MEMBER_ID) values ";
			sql += " (?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, memberId);
			
			cnt = pstmt.executeUpdate();
			conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
}
