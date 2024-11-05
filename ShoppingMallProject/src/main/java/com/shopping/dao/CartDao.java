package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public int addCartProduct(CartProduct cartProduct) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "insert into cart_product (CART_ID, PRODUCT_ID, OPTION_ID, QUANTITY)";
					sql += " values ";
					sql += " (?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, cartProduct.getCartId());
			pstmt.setLong(2, cartProduct.getProductId());
			pstmt.setLong(3, cartProduct.getOptionId());
			pstmt.setDouble(4, cartProduct.getQuantity());
			
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
	
	public int removeCartProduct(Long cartProductId) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "delete from cart_product";
					sql += " where CART_PRODUCT_ID = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, cartProductId);
			
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
	
	public int updateCartProduct(Long cartProductId, CartProduct cartProduct) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			String sql = "update cart_product";
					sql += " set QUANTITY = ?, OPTION_ID = ?";
					sql += " where CART_PRODUCT_ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, cartProduct.getQuantity());
			pstmt.setLong(2, cartProduct.getOptionId());
			pstmt.setDouble(3, cartProduct.getProductId());
			
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
	
	public CartProduct getCartProductById(Long cartProductId) {
		CartProduct cartProduct = new CartProduct();
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " SELECT * FROM CART_PRODUCT " ;
		sql += " WHERE CART_PRODUCT_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, cartProductId);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				cartProduct = makeCartProduct(rs);
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
		
		return cartProduct;
	}

	public boolean updateQuantity(Long cartProductId, int quantity) {
		PreparedStatement pstmt = null ;	
		String sql = " update cart_product set quantity = ? where cart_product_id = ? " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, quantity);
			pstmt.setLong(2, cartProductId);
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public boolean check(Long cartId, Long productId, Long optionId) {
		boolean bool = false;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from cart_product where cart_id = ? and product_id = ? ";
		if(optionId != null) {
			sql += " and option_id = ? " ;
		}
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, cartId);
			pstmt.setLong(2, productId);
			if(optionId != null) {
				pstmt.setLong(3, optionId);
			}
			
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

	public int delete(Long cartProductId) {
		int cnt = 0;
		
		PreparedStatement pstmt = null ;	
		String sql = " delete cart_product where cart_product_id = ? " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, cartProductId);
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
}
