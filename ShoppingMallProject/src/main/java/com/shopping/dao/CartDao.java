package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Address;
import com.shopping.model.Cart;
import com.shopping.model.CartProduct;

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
	
	public List<CartProduct> getCartProducts(Long cartId){
		List<CartProduct> list = new ArrayList<CartProduct>();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " SELECT * FROM CART_PRODUCT " ;
		sql += " WHERE CART_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, cartId);
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				CartProduct cartProduct = makeCartProduct(rs);
				if(cartProduct!=null) {
					list.add(cartProduct);
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
	


	public Cart getCart(Long memberId) {
		Cart cart = null;

		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " SELECT * FROM CART " ;
		sql += " WHERE MEMBER_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, memberId);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				cart = makeCart(rs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return cart;
	}

	
	private CartProduct makeCartProduct(ResultSet rs) {
		CartProduct cartProduct = new CartProduct();
		try {
			cartProduct.setCartProductId(rs.getLong("CART_PRODUCT_ID"));
			cartProduct.setCartId(rs.getLong("CART_ID"));
			cartProduct.setProductId(rs.getLong("PRODUCT_ID"));
			cartProduct.setQuantity(rs.getInt("QUANTITY"));
			cartProduct.setAddedDate(rs.getTimestamp("ADDED_DATE").toLocalDateTime());
			cartProduct.setNote(rs.getString("NOTE"));
			cartProduct.setOptionId(rs.getLong("OPTION_ID"));
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return cartProduct;
	}
	
	private Cart makeCart(ResultSet rs) {
		Cart cart = new Cart();
		try {
			cart.setCartId(rs.getLong("CART_ID"));
			cart.setMemberId(rs.getLong("MEMBER_ID"));
			cart.setCreatedAt(rs.getString("CREATED_AT"));
			cart.setUpdatedAt(rs.getString("UPDATED_AT"));
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return cart;
	}
}
