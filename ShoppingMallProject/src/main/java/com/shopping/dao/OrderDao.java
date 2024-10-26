package com.shopping.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.shopping.model.Order;

public class OrderDao extends SuperDao{
	
	public int saveOrder(Order order) throws SQLException {
		
		int result = 0;
		
		conn = getConnection();
		conn.setAutoCommit(false);
		
		String sql = "INSERT INTO ORDERS (MEMBER_ID, ORDER_NUMBER, ORDER_DATE, TOTAL_AMOUNT, USED_POINTS, ORDER_STATUS, PAYMENT_METHOD, EXPECTED_REWARD_AMOUNT, FINAL_PAYMENT_AMOUNT, CREATED_AT, UPDATED_AT)";
		sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, order.getMemberId());			
			pstmt.setString(2, order.getOrderNumber());
			pstmt.setDate(3, Date.valueOf(LocalDate.now()));
			pstmt.setDouble(4, order.getTotalAmount());
			pstmt.setDouble(5, order.getUsedPoints());
			pstmt.setString(6, order.getOrderStatus().toString());
			pstmt.setString(7, order.getPaymentMethod());
			pstmt.setDouble(8, order.getExpectedRewardAmount());
			pstmt.setDouble(9, order.getFinalPaymentAmount());
			pstmt.setDate(10, Date.valueOf(LocalDate.now()));
			pstmt.setDate(11, Date.valueOf(LocalDate.now()));
			
		
			result = pstmt.executeUpdate();
			
			conn.commit();
		
		}catch(SQLException e) {
			e.printStackTrace();
			conn.rollback();
			
		}finally {
			try {
				if (rs != null) {rs.close();}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null) {pstmt.close();}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (conn != null) {conn.close();}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	private Order getBeanData(ResultSet rs) throws SQLException{
		 Order order = null;
//		 
//		 try {
//			 order = new Order();
//			 order.setProductId(rs.getLong("PRODUCT_ID"));
//			 order.setCategoryId(rs.getLong("CATEGORY_ID"));
//			 order.setName(rs.getString("PRODUCT_NAME"));
//			 order.setImg1(rs.getString("IMG1"));
//			 order.setImg2(rs.getString("IMG2"));
//			 order.setImg3(rs.getString("IMG3"));
//			 order.setDescription(rs.getString("PRODUCT_DESCRIPTION"));
//			 order.setPrice(rs.getDouble("PRICE"));
//			 order.setQuantity(rs.getDouble("STOCK_QUANTITY"));
//			 order.setRegistrationDate(rs.getTimestamp("REGISTRATION_DATE").toLocalDateTime());
//			 order.setBrand(rs.getString("BRAND"));
//			 order.setStatus(rs.getString("STATUS"));
//		 }catch (Exception e) {
//			 e.printStackTrace();
//			 return null;
//		 }
		 return order;
	}
}
