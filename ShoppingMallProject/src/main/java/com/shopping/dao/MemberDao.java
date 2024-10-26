package com.shopping.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


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
	
	
}
