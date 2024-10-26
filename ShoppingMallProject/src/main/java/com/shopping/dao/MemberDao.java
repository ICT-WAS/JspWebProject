package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.model.Member;

public class MemberDao extends SuperDao{

	public MemberDao() {
		super();
	}
	
	public boolean checkId(String id) {
		boolean bool = false;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from members " ;
		sql += " where id = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bool = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bool;
	}

	public int signUp(Member bean) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO members (SIGNUP_ID, MEMBER_NAME, MEMBER_NICKNAME, PASSWORD, MEMBER_EMAIL, PHONE_NUMBER, CREATED_AT, UPDATED_AT, LAST_LOGIN, STATUS, BIRTHDAY, POINTS) VALUES ";
			sql += "(?, ?, ?, ?, ?, ?, default, default, default, 1, ?, 0.00)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getNickname());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getPhoneNumber());
			pstmt.setString(7, bean.getBirthday());
			
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
