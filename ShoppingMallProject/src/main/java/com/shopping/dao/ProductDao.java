package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.shopping.model.Product;
import com.shopping.model.ProductOption;
import com.shopping.model.ProductOptionDTO;
import com.shopping.model.ProductPage;


public class ProductDao extends SuperDao{
	
	//전체 상품 리스트
	public List<Product> getProductList(){
		List<Product> productList = new ArrayList<>();
		
		String sql = " SELECT * FROM PRODUCT";
		
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
	
	//productDao 카테고리 상품 별 수량 가져오기
	public int getProductCountByCategoryId(long categoryId) {
		int count = 0;
		
		String sql = " SELECT COUNT(*) FROM PRODUCT WHERE CATEGORY_ID = ?";
		
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		
		try{
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, categoryId);					
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			closeResources(conn, pstmt, rs);
		}
		
		return count;
	}
	
	//productId에 매칭되는 상품 한 개 가져오기 - 옵션 포함
	public ProductOptionDTO getProductById(long productId) {
		Product product = new Product();
		String sql = " SELECT * FROM PRODUCT WHERE PRODUCT_ID = ?";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		
		try{
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, productId);
			
			rs = pstmt.executeQuery();
			
			if (rs.isBeforeFirst()) {
			    System.out.println("resultSet에 데이터가 없습니다.");
			} else {
			    System.out.println("resultSet을 찾을 수 없습니다.");
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
		
		// 상품에 맞는 옵션 가져오기
		
		sql = " SELECT * FROM PRODUCT_OPTION WHERE PRODUCT_ID = ?";
		
		pstmt = null ;  //초기화
		rs = null;  //초기화
		List<ProductOption> OptionList= new ArrayList<>();
		
		try{
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, productId);
			
			rs = pstmt.executeQuery();
			
		while (rs.next()) {
			OptionList.add(getOptionBeanData(rs));
		}
		
		
		
		}catch(SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
			
		}finally {
			closeResources(conn, pstmt, rs);
		}

		return new ProductOptionDTO(product, OptionList);  //조회된 상품 반환, 찾지 못하면 null
	}
	
	//필터링된 리스트 + 총 카운트 가져오기
    public ProductPage getFilteredProductPage(Integer categoryId, String name, Double minPrice, Double maxPrice, String brand, int page, int pageSize) {
        System.out.println(categoryId);
    	int totalCount = 0;
        Product product = new Product();
        List<Product> productList = new ArrayList<>();

        String countSql = "SELECT COUNT(*) FROM PRODUCT WHERE 1=1";

        //필터링 조건 추가
        countSql += setConditionSql(categoryId, name, minPrice, maxPrice, brand);

        PreparedStatement countPstmt = null;
        ResultSet countRs = null;
        try {
            conn = super.getConnection();
            countPstmt = conn.prepareStatement(countSql);

            int paramIndex = 1;
            //플레이스 홀더 세팅
            setConditionPlaceHolder(countPstmt, paramIndex, categoryId, name, minPrice, maxPrice, brand);

            countRs = countPstmt.executeQuery();
            if (countRs.next()) {
                totalCount = countRs.getInt(1);  //첫번째 칼럼의 값을 가져올 수 있음, sql 문 실행 시 count 숫자 단독 반환함
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, countPstmt, countRs);
        }

        //----- 리스트 가져오기 -------
        String sql = "SELECT * FROM ( " +
                " SELECT p.*, ROWNUM rnum " +
                " FROM ( " +
                " SELECT * FROM PRODUCT WHERE 1=1 ";

        // 필터링 조건 추가
        sql += setConditionSql(categoryId, name, minPrice, maxPrice, brand);

        sql += " ORDER BY PRODUCT_ID DESC"+
        		" ) p " +
                " WHERE ROWNUM <= ? " +  //endRow
                ") " +
                " WHERE rnum >= ?";  //startRow

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);

            int paramIndex = 1;
            //플레이스 홀더 세팅 및 paramIndex 가져오기
            paramIndex= setConditionPlaceHolder(pstmt, paramIndex, categoryId, name, minPrice, maxPrice, brand);

            // 페이지 크기 및 행 설정
            int endRow = (page * pageSize) ;
            int startRow = endRow - pageSize + 1;

            pstmt.setInt(paramIndex++, endRow);
            pstmt.setInt(paramIndex++, startRow);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                product = getBeanData(rs);
                productList.add(product);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }

        return new ProductPage(productList, totalCount);
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
			 e.printStackTrace();
			 return null;
		 }
		 return product;
	}
	
	private ProductOption getOptionBeanData(ResultSet rs) throws SQLException{
		ProductOption productOption = new ProductOption();
		try {
			productOption.setOptionId(rs.getLong("OPTION_ID"));
			productOption.setProductId(rs.getLong("PRODUCT_ID"));
			productOption.setOptionType(rs.getString("OPTION_TYPE"));
			productOption.setOptionName(rs.getString("OPTION_NAME"));
			productOption.setAdditionalPrice(rs.getDouble("ADDITIONAL_PRICE"));
			productOption.setOptionStockquantity(rs.getDouble("OPTION_STOCK_QUANTITY"));
		}catch (Exception e) {
			 e.printStackTrace();
			 return null;
		 }
		return productOption;
		
	}
	
	//조건에 맞는 sql 문장 설정
    private String setConditionSql(Integer categoryId, String name, Double minPrice, Double maxPrice, String brand) {
        String sql = "";
        if (name != null && !name.isEmpty()) {
            sql += " AND PRODUCT_NAME LIKE ?";
        }
        if (categoryId != null) {
            sql += " AND CATEGORY_ID = ?";
        }
        if (minPrice != null && maxPrice != null) {
            sql += " AND PRICE BETWEEN ? AND ?";
        } else if (minPrice != null) {
            sql += " AND PRICE >= ?";
        } else if (maxPrice != null) {
            sql += " AND PRICE <= ?";
        }
        if (brand != null && !brand.isEmpty()) {
            sql += " AND BRAND = ?";
        }
        return sql;
    }

    //조건에 맞는 place holder 설정
    private int setConditionPlaceHolder(PreparedStatement pstmt, int index, Integer categoryId, String name, Double minPrice, Double maxPrice, String brand) throws SQLException {
        int paramIndex = index;
        if (name != null && !name.isEmpty()) {
            pstmt.setString(paramIndex++, "%" + name + "%");
        }
        if (categoryId != null) {
            pstmt.setInt(paramIndex++, categoryId);
        }
        if (minPrice != null) {
            pstmt.setDouble(paramIndex++, minPrice);
        }
        if (maxPrice != null) {
            pstmt.setDouble(paramIndex++, maxPrice);
        }
        if (brand != null && !brand.isEmpty()) {
            pstmt.setString(paramIndex++, brand);
        }
        return paramIndex;
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

	public ProductOption getOption(Long optionId) {
		ProductOption option = null;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from PRODUCT_OPTION " ;
		sql += " where OPTION_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, optionId);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				option = getOptionBeanData(rs);
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
		
		return option;
	}

	public Product getProduct(Long productId) {
		Product product = null;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from PRODUCT " ;
		sql += " where PRODUCT_ID = ?  " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setLong(1, productId);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				product = getBeanData(rs);
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
		
		return product;
	}

	public int updateQuantity(Connection conn, Map<Long, Integer> optionIdAndQuantity) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		for(Long optionId : optionIdAndQuantity.keySet()) {
			try {
				String sql = "UPDATE PRODUCT_OPTION";
				sql += " SET OPTION_STOCK_QUANTITY = ?";
				sql += " WHERE OPTION_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				
	            pstmt.setDouble(1, optionIdAndQuantity.get(optionId));            
	            pstmt.setLong(2, optionId);
				
				result = pstmt.executeUpdate();
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
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
		
	}
}
