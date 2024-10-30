package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.shopping.enums.OrderStatus;
import com.shopping.model.Order;

public class OrderDao extends SuperDao{
	
	public boolean canUseOrderNo(String orderNo) {
		boolean result = false;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from orders " ;
		sql += " where ORDER_NUMBER = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, orderNo);
			rs = pstmt.executeQuery() ;
			
			if(!rs.next()) {
				result = true;
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
		
		return result;
	}
	
	public int saveOrder(Order order) {
		
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO ORDERS (MEMBER_ID, ORDER_NUMBER, ORDER_DATE, TOTAL_AMOUNT, USED_POINTS, ORDER_STATUS, PAYMENT_METHOD, EXPECTED_REWARD_AMOUNT, FINAL_PAYMENT_AMOUNT, CREATED_AT, UPDATED_AT)";
			sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setLong(1, order.getMemberId());            
            pstmt.setString(2, order.getOrderNumber());
            pstmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setDouble(4, order.getTotalAmount());
            pstmt.setDouble(5, order.getUsedPoints());
            pstmt.setString(6, order.getOrderStatus().toString());
            pstmt.setString(7, order.getPaymentMethod());
            pstmt.setDouble(8, order.getExpectedRewardAmount());
            pstmt.setDouble(9, order.getFinalPaymentAmount());
            pstmt.setTimestamp(10, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));
			
			result = pstmt.executeUpdate();
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
		
		
		return result;
	}
	
	public Order findOrderByOrderNo(String orderNo) {
		Order order = null;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from orders " ;
		sql += " where ORDER_NUMBER = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, orderNo);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				order = getBeanData(rs);
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
		
		return order;
	}
	
	private Order getBeanData(ResultSet rs){
		 Order order = null;
		 
		 try {
			 order = new Order();
			 order.setOrderId(rs.getLong("ORDER_ID"));
			 order.setMemberId(rs.getLong("MEMBER_ID"));
			 order.setOrderNumber(rs.getString("ORDER_NUMBER"));
			 order.setOrderDate(rs.getTimestamp("ORDER_DATE").toLocalDateTime());
			 order.setTotalAmount(rs.getInt("TOTAL_AMOUNT"));
			 order.setUsedPoints(rs.getInt("USED_POINTS"));
			 order.setOrderStatus(OrderStatus.valueOf(rs.getString("ORDER_STATUS")));
			 order.setPaymentMethod(rs.getString("PAYMENT_METHOD"));
			 order.setExpectedRewardAmount(rs.getInt("EXPECTED_REWARD_AMOUNT"));
			 order.setFinalPaymentAmount(rs.getInt("FINAL_PAYMENT_AMOUNT"));
			 order.setCreatedAt(rs.getTimestamp("CREATED_AT").toLocalDateTime());
			 order.setUpdatedAt(rs.getTimestamp("UPDATED_AT").toLocalDateTime());
			 
		 }catch (Exception e) {
			 e.printStackTrace();
			 return null;
		 }
		 return order;
	}
}
