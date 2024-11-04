package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		sql += " where signup_id = ?  " ;
		
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
	
	public Member getMemberById(String id) {
		Member member = null;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from members " ;
		sql += " where signup_id = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				member = makeBean(rs);
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
		
		return member;
	}
	
	public Member getMemberByPk(Long id) {
		Member member = null;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from members " ;
		sql += " where member_id = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				member = makeBean(rs);
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
		
		return member;
	}

	public Member login(String id, String pw) {
		Member member = null;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from members " ;
		sql += " where signup_id = ? and password = ?" ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				member = makeBean(rs);
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
		if(member!=null && member.getStatus()==0) {
			// 비활성일 때 처리
		}
		
		return member;
	}
	
	private Member makeBean(ResultSet rs) {
		Member member = new Member();
		
		try {
			member.setMember_id(rs.getLong("MEMBER_ID"));
			member.setId(rs.getString("SIGNUP_ID"));
			member.setName(rs.getString("MEMBER_NAME"));
			member.setNickname(rs.getString("MEMBER_NICKNAME"));
			member.setPassword(rs.getString("PASSWORD"));
			member.setEmail(rs.getString("MEMBER_EMAIL"));
			member.setPhoneNumber(rs.getString("PHONE_NUMBER"));
			member.setCreatedAt(rs.getString("CREATED_AT"));
			member.setUpdatedAt(rs.getString("UPDATED_AT"));
			member.setLastLogin(rs.getString("LAST_LOGIN"));
			member.setStatus(rs.getInt("STATUS"));
			member.setBirthday(rs.getString("BIRTHDAY"));
			member.setPoint(rs.getLong("POINTS")); 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
		
		return member;
	}

	public boolean checkEmail(String email) {
		boolean bool = false;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from members " ;
		sql += " where member_email = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, email);
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

	public int delete(Long memberId) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "DELETE members ";
			sql += " WHERE MEMBER_ID = ? ";
			
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

	public int updatePoint(Connection conn, Long memberId, int point) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE members ";
			sql += " SET POINTS = ? ";
			sql += " WHERE MEMBER_ID = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setDouble(1, point);
			pstmt.setLong(2, memberId);
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
}
