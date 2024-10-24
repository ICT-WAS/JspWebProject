package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Product;


public class ProductDao extends SuperDao{
	
	//전체 상품 목록 가져오기
	public List<Product> getProductList(){
		List<Product> productList = new ArrayList<>();
		
		String sql = " SELECT * FROM PRODUCTS";
		
		try(Connection conn = super.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()) {
			
			while (rs.next()) {
				productList.add(getBeanData(rs));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return productList;
	}

	
	
	//productId에 매칭되는 상품 한 개 가져오기
	public Product getProductById(long productId) {
		Product product = null;
		String sql = " SELECT * FROM PRODUCT WHERE PRODUCT_ID = ?";
		
		try(Connection conn = super.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setLong(0, productId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = getBeanData(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return product;  //조회된 상품 반환, 찾지 못하면 null
	}
	
	
	
	//예외처리 받아서 처리하는 곳
	private Product getBeanData(ResultSet rs) throws SQLException{
		Product product = new Product();
		return product;
	}

}
