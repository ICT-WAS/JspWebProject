package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Category;

public class CategoryDao extends SuperDao{
	
	//최상위 카테고리 아이디 가져오기
	public List<Long> getCategoryIDList(){
		List<Long> categoryIdList = new ArrayList<>();
		
		String sql = " SELECT CATEGORY_ID FROM PARENTS_CATEGORY_ID ";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		
		try{
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				 categoryIdList.add(rs.getLong("CATEGORY_ID"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			closeResources(conn, pstmt, rs);
		}
		
		return categoryIdList;
	}
	
	//카테고리 전체 bean 리스트 가져오기
	public List<Category> getCategoryList(){
		List<Category> categoryList = new ArrayList<>();
		
		String sql = " SELECT * FROM PRODUCT_CATEGORY ";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		
		try{
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				categoryList.add(getBeanData(rs));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			closeResources(conn, pstmt, rs);
		}
		
		return categoryList;
	}
	

	
	//받아온 rs를 이용해 bean(한 줄 데이터) 세팅, SQL에러 던지기
	private Category getBeanData(ResultSet rs) throws SQLException{
		Category category = null;
		 
		 try {
			 category = new Category();
			 category.setCategoryId(rs.getLong("CATEGORY_ID"));
			 category.setParentCategoryId(rs.getLong("PARENTS_CATEGORY_ID"));
			 category.setName(rs.getString("CATEGORY_NAME"));
			 category.setLevel(rs.getInt("CATEGORY_LEVEL"));
			
		 }catch (Exception e) {
			 e.printStackTrace();
			 return null;
		 }
		 return category;
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

		public List<Category> getRootCategoryList() {
			List<Category> categoryList = new ArrayList<Category>();
			
			String sql = " SELECT * FROM PRODUCT_CATEGORY WHERE PARENTS_CATEGORY_ID IS NULL";
			
			PreparedStatement pstmt = null ;
			ResultSet rs = null;
			
			try{
				conn = super.getConnection();
				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					categoryList.add(getBeanData(rs));
				}
				
			}catch (Exception e) {
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
			
			return categoryList;
		}

		public List<Category> getCategoryListByParentId(long parentCategoryId) {
			List<Category> categoryList = new ArrayList<Category>();
			
			String sql = " SELECT * FROM PRODUCT_CATEGORY WHERE PARENTS_CATEGORY_ID = ?";
			
			PreparedStatement pstmt = null ;
			ResultSet rs = null;
			
			try{
				conn = super.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setLong(1, parentCategoryId);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					categoryList.add(getBeanData(rs));
				}
				
			}catch (Exception e) {
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
			
			return categoryList;
		}
<<<<<<< HEAD

		public int addCategory(Long parentCategoryId, String categoryName, int categoryLevel) {
			
			int result = 0;
			
			String sql = " INSERT INTO PRODUCT_CATEGORY(CATEGORY_NAME, CATEGORY_LEVEL";
			
			if(parentCategoryId != null) {
				sql += ", PARENTS_CATEGORY_ID";
			} 
			
			sql += ")";
			sql += " VALUES(?, ?";
			
			if(parentCategoryId != null) {
				sql += ", ?";
			} 
			
			sql += ")";
			
			PreparedStatement pstmt = null ;
			
			try{
				conn = super.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, categoryName);
				pstmt.setInt(2, categoryLevel);
				
				if(parentCategoryId != null) {
					pstmt.setLong(3, parentCategoryId);
				} 

				result = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				try {
					if(pstmt!=null) {pstmt.close();}
					if(conn!=null) {conn.close();}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return result;
		}
=======
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
}
