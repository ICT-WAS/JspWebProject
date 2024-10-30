package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Address;
import com.shopping.model.Member;

public class AddressDao extends SuperDao{
	
	public List<Address> getAddressList(Long memberId){
		List<Address> list = new ArrayList<Address>();

		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from MEMBER_ADDRESS " ;
		sql += " where MEMBER_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, memberId);
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				Address address; 
				address = makeBean(rs);
				if(address!=null) {
					list.add(address);
				}
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
		
		
		return list;
	}

	private Address makeBean(ResultSet rs){
		Address address = null;
		try {
			address = new Address();
			address.setAddressId(rs.getLong("ADDRESS_ID"));
			address.setMemberId(rs.getLong("MEMBER_ID"));
			address.setRecipientName(rs.getString("RECIPIENT_NAME"));
			address.setRoadNameAddress(rs.getString("ROAD_NAME_ADDRESS"));
			address.setDetailAddress(rs.getString("DETAIL_ADDRESS"));
			address.setPostalCode(rs.getString("POSTAL_CODE"));
			address.setPhoneNumber(rs.getString("PHONE_NUMBER"));
			address.setAlias(rs.getString("ADDRESS_ALIAS"));
			address.setIsDefault(rs.getInt("IS_DEFAULT"));
			address.setCreatedAt(rs.getString("CREATED_AT"));
			address.setUpdatedAt(rs.getString("UPDATED_AT"));
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return address;
	}

	public int delete(Long addressId) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "DELETE MEMBER_ADDRESS WHERE ADDRESS_ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, addressId);
			
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

	public int insert(Address address) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO MEMBER_ADDRESS (MEMBER_ID, RECIPIENT_NAME, ROAD_NAME_ADDRESS, DETAIL_ADDRESS, POSTAL_CODE, PHONE_NUMBER, ADDRESS_ALIAS, IS_DEFAULT, CREATED_AT, UPDATED_AT) VALUES  ";
			sql += "(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, address.getMemberId());
			pstmt.setString(2, address.getRecipientName());
			pstmt.setString(3, address.getRoadNameAddress());
			pstmt.setString(4, address.getDetailAddress());
			pstmt.setString(5, address.getPostalCode());
			pstmt.setString(6, address.getPhoneNumber());
			pstmt.setString(7, address.getAlias());
			
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
