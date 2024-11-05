package com.shopping.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.OrderDetail;

public class OrderDetailDao extends SuperDao {
	
	public List<OrderDetail> orderDetailList(){
		 List<OrderDetail> orderDetailList = new ArrayList<>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from order_detail " ;
		
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            OrderDetail orderdetail = getBeanData(rs);
	            if (orderdetail != null) {
	            	orderDetailList.add(orderdetail); 
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
		
		return orderDetailList;
	}
	
	private OrderDetail getBeanData(ResultSet rs) {
		OrderDetail orderDetail = null;
		
		try {
			orderDetail = new OrderDetail();
			
			orderDetail.setOrderDetilId(rs.getLong("ORDER_DETAIL_ID"));
			orderDetail.setOrderId(rs.getLong("ORDER_ID"));
			orderDetail.setProductId(rs.getLong("PRODUCT_ID"));
			orderDetail.setOptionId(rs.getLong("OPTION_ID"));
			orderDetail.setQuantity(rs.getInt("QUANTITY"));
			orderDetail.setUnitPrice(rs.getInt("UNIT_PRICE"));
			orderDetail.setCreatedAt(rs.getTimestamp("CREATED_AT").toLocalDateTime());
			orderDetail.setUpdatedAt(rs.getTimestamp("UPDATED_AT").toLocalDateTime());
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
		
		return orderDetail;
	}
	
}
