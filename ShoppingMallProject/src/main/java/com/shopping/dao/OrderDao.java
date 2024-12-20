package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shopping.enums.OrderStatus;
import com.shopping.enums.ShippingStatus;
import com.shopping.model.Order;
import com.shopping.model.OrderDetail;
import com.shopping.model.Shipping;

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
	
	public int updateOrderStatus(Order order) {
		
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			String sql = "UPDATE ORDERS";
			sql += " SET ORDER_STATUS = ?";
			sql += " WHERE ORDER_NUMBER = ?";
			
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setString(1, order.getOrderStatus().toString());            
            pstmt.setString(2, order.getOrderNumber());
			
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
	
	public int saveShipping(Shipping shipping) {
		
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO SHIPPING (ORDER_ID, RECIPIENT_NAME, ROAD_NAME_ADDRESS, DETAIL_ADDRESS, POSTAL_CODE, PHONE_NUMBER, SHIPPING_STATUS, TRACKING_NUMBER, COURIER_NAME, CREATED_AT, UPDATED_AT, MESSAGE)";
			sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setLong(1, shipping.getOrderId());            
            pstmt.setString(2, shipping.getRecipientName());
            pstmt.setString(3, shipping.getRoadNameAddress());
            pstmt.setString(4, shipping.getDetailAddress());
            pstmt.setString(5, shipping.getPostalCode());
            pstmt.setString(6, shipping.getPhoneNumber());
            pstmt.setString(7, shipping.getShippingStatus().toString());
            pstmt.setString(8, shipping.getTrackingNumber());
            pstmt.setString(9, shipping.getCourierName());
            pstmt.setTimestamp(10, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setString(12, shipping.getMessage());
			
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
	
	public int saveOrderDetail(OrderDetail orderDetail) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO ORDER_DETAIL (ORDER_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, TOTAL_PRICE";
			
			Long optionId = orderDetail.getOptionId();
			
			if(optionId != null) {
				sql += ", OPTION_ID";
			}
			
			sql += ")";
			sql += " VALUES (?, ?, ?, ?, ?";
			
			if(optionId != null) {
				sql += ", ?";
			}
			sql += ")";
			
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setLong(1, orderDetail.getOrderId());            
            pstmt.setLong(2, orderDetail.getProductId());
            pstmt.setDouble(3, orderDetail.getQuantity());
            pstmt.setDouble(4, orderDetail.getUnitPrice());
            pstmt.setDouble(5, orderDetail.getTotalPrice());
            
            if(optionId != null) {
            	pstmt.setLong(6, orderDetail.getOptionId());
            }
			
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
	
	public Shipping findShippingByOrderId(Long orderId) {
		Shipping shipping = new Shipping();

		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from SHIPPING " ;
		sql += " where ORDER_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, orderId);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				shipping = makeShippingBean(rs);
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
		
		
		return shipping;
	}
	
	private Shipping makeShippingBean(ResultSet rs){
		Shipping shipping = null;
		try {
			shipping = new Shipping();
			shipping.setShippingId(rs.getLong("SHIPPING_ID"));
			shipping.setOrderId(rs.getLong("ORDER_ID"));
			shipping.setRecipientName(rs.getString("RECIPIENT_NAME"));
			shipping.setRoadNameAddress(rs.getString("ROAD_NAME_ADDRESS"));
			shipping.setDetailAddress(rs.getString("DETAIL_ADDRESS"));
			shipping.setPostalCode(rs.getString("POSTAL_CODE"));
			shipping.setPhoneNumber(rs.getString("PHONE_NUMBER"));
			shipping.setShippingStatus(ShippingStatus.valueOf(rs.getString("SHIPPING_STATUS")));
			shipping.setTrackingNumber(rs.getString("TRACKING_NUMBER"));
			shipping.setCreatedAt(rs.getTimestamp("CREATED_AT").toLocalDateTime());
			shipping.setUpdatedAt(rs.getTimestamp("UPDATED_AT").toLocalDateTime());
			shipping.setMessage(rs.getString("MESSAGE"));
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return shipping;
	}
	
	private OrderDetail makeOrderDetail(ResultSet rs){
		OrderDetail orderDetail = null;
		try {
			orderDetail = new OrderDetail();
			orderDetail.setOrderDetilId(rs.getLong("ORDER_DETAIL_ID"));
			orderDetail.setOrderId(rs.getLong("ORDER_ID"));
			orderDetail.setProductId(rs.getLong("PRODUCT_ID"));
			orderDetail.setQuantity((int)rs.getDouble("QUANTITY"));
			orderDetail.setUnitPrice((int)rs.getDouble("UNIT_PRICE"));
			orderDetail.setCreatedAt(rs.getTimestamp("CREATED_AT").toLocalDateTime());
			orderDetail.setUpdatedAt(rs.getTimestamp("UPDATED_AT").toLocalDateTime());
			orderDetail.setOptionId(rs.getLong("OPTION_ID"));
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return orderDetail;
	}

	
	public List<OrderDetail> findOrderDetails(Long orderId) {
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM ORDER_DETAIL ";
		sql += " WHERE ORDER_ID = ?  ";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDetail orderDetail = makeOrderDetail(rs);
				if (orderDetail != null) {
					orderDetails.add(orderDetail);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return orderDetails;
	}

	public int updateOrderStatus(Connection conn, Order orderData) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE ORDERS";
			sql += " SET ORDER_STATUS = ?";
			sql += " WHERE ORDER_NUMBER = ?";
			
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setString(1, orderData.getOrderStatus().toString());            
            pstmt.setString(2, orderData.getOrderNumber());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			try {
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public List<Order> OrderList() {
		List<Order> OrderList = new ArrayList<>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;	
		
	    String sql = " select * from orders " ;

	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Order order = getBeanData(rs);
	            if (order != null) {
	            	OrderList.add(order);
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
		
		return OrderList;
	}
	
	
	public List<Map<String, Object>> MemberNameByOrderList() {
		List<Map<String, Object>> MemberNameByOrderLists = new ArrayList<>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;	
		
	    String sql = " SELECT o.*, m.MEMBER_NAME " + 
                " FROM orders o  " + 
                " JOIN members m ON o.MEMBER_ID = m.MEMBER_ID " ;
	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Order order = getBeanData(rs);
	            String memberName = rs.getString("MEMBER_NAME");
	            
	            if (order != null) {
	            	Map<String, Object> map = new HashMap<>();
	            	map.put("order", order);
	            	map.put("memberName", memberName);
	            	MemberNameByOrderLists.add(map);
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
		
		return MemberNameByOrderLists;
	}

	public List<Order> getOrder(Long memberId){
		List<Order> list = new ArrayList<Order>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;	
		
	    String sql = " select * from orders where MEMBER_ID = ?" ;

	    
	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setLong(1, memberId);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Order order = getBeanData(rs);
	            if (order != null) {
	            	list.add(order);
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
}
