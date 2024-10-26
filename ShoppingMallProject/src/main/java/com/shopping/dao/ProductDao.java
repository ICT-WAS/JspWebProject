package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Product;


public class ProductDao extends SuperDao{
	
	//(수정중)전체 상품 리스트
	public List<Product> getProductList(){
		List<Product> productList = new ArrayList<>();
		
		String sql = " SELECT * FROM PRODUCTS";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		
		
		try{
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				productList.add(getBeanData(rs));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			closeResources(conn, pstmt, rs);
		}
			
		
		return productList;
	}

	//(수정중)상품등록
			public Product addProduct(Product product) {
				String sql = "INSERT INTO product (product_name, brand, img1, img2, img3, stock_quantity, price, category_id, product_description, points, registration_date)";
				sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				PreparedStatement pstmt = null;		
				ResultSet rs = null;
				
				try{
					conn = super.getConnection();
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, product.getName());					
				
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						product = getBeanData(rs);
					}
				
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					closeResources(conn, pstmt, rs);
				}
				
				return product;  //조회된 상품 반환, 찾지 못하면 null
			}
	
	//(수정중)productId에 매칭되는 상품 한 개 가져오기
	public Product getProductById(long productId) {
		Product product = null;
		String sql = " SELECT * FROM PRODUCT WHERE PRODUCT_ID = ?";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		
		try{
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, productId);
			
			System.out.println("pstmt="+ pstmt);
			
			rs = pstmt.executeQuery();
			
			if (rs.isBeforeFirst()) {
			    System.out.println("ResultSet has data.");
			} else {
			    System.out.println("No data found in ResultSet.");
			}
			
			if(rs.next()) {
				product = getBeanData(rs);
			}
			
		}catch(SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
			
		}finally {
			closeResources(conn, pstmt, rs);
		}
		
		
		System.out.println("productID="+ productId);
		return product;  //조회된 상품 반환, 찾지 못하면 null
	}
	
	
	//예외처리 받아서 처리하는 곳
	private Product getBeanData(ResultSet rs) throws SQLException{
		 Product product = null;
		 
		 try {
			 product = new Product();
			 product.setProductId(rs.getLong("PRODUCT_ID"));
		     product.setCategoryId(rs.getLong("CATEGORY_ID"));
		     product.setName(rs.getString("PRODUCT_NAME"));
		     product.setImg1(rs.getString("IMG1"));
		     product.setImg2(rs.getString("IMG2"));
		     product.setImg3(rs.getString("IMG3"));
		     product.setDescription(rs.getString("PRODUCT_DESCRIPTION"));
		     product.setPrice(rs.getDouble("PRICE"));
		     product.setQuantity(rs.getDouble("STOCK_QUANTITY"));
		     product.setRegistrationDate(rs.getTimestamp("REGISTRATION_DATE").toLocalDateTime());
		     product.setBrand(rs.getString("BRAND"));
		     product.setStatus(rs.getString("STATUS"));
		 }catch (Exception e) {
			 System.out.println("product="+product);
			 e.printStackTrace();
			 return null;
		 }
		 System.out.println("product="+product);
		 return product;
	}
	
	//리소스 닫기
	private void closeResources(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {rs.close();}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		closeResources(conn, pstmt);
	}
	
	private void closeResources(Connection conn, PreparedStatement pstmt) {
		try {
			if (pstmt != null) {pstmt.close();}
			if (conn != null) {conn.close();}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
