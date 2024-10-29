package com.shopping.controller.product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CategoryDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.Product;
import com.shopping.model.Category;
import com.shopping.model.ProductPage;

@WebServlet("/product/list")
public class ProductListController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //요청 파라미터 가져오기
    	Integer categoryId = null;
    	Integer pageSize = 15;
    	Integer pageNumber = 1;
    	String name = null;
    	String brand = null;
    	Double minPrice = null;
    	Double maxPrice = null;
    	
        //파라미터 가져오기
    	try {
    	    categoryId = request.getParameter("category") != null ?
    	            Integer.valueOf(request.getParameter("category")) : null;
    	    pageSize = request.getParameter("pageSize") != null ?
    	            Integer.valueOf(request.getParameter("pageSize")) : 15;
    	    pageNumber = request.getParameter("page") != null ?
    	            Integer.valueOf(request.getParameter("page")) : 1;
    	    name = request.getParameter("name");
    	    brand = request.getParameter("brand");
    	    minPrice = request.getParameter("minPrice") != null ?
    	            Double.valueOf(request.getParameter("minPrice")) : null;
    	    maxPrice = request.getParameter("maxPrice") != null ?
    	            Double.valueOf(request.getParameter("maxPrice")) : null;

            //페이지 유효성검사
            if (pageSize < 1 || pageSize > 100) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "한 페이지에 볼 수 있는 상품의 개수는 1개부터 100개까지 입니다.");
                return;
            }

            if (pageNumber < 1) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 페이지 번호입니다.");
                return;
            }
            
            System.out.println(pageNumber + " " + pageSize + " " + categoryId);
            request.setAttribute("pageNumber", pageNumber);  //현재 페이지
            request.setAttribute("pageSize", pageSize);  //한 페이지당 게시글 수

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 파라미터 형식입니다.");
        }

        //productList 가져오기
        List<Product> productList = new ArrayList<>();
        try {
            ProductDao productDao = new ProductDao();
            ProductPage productPage = productDao.getFilteredProductPage(categoryId, name, minPrice, maxPrice, brand, pageNumber, pageSize);
            int totalCount = productPage.getTotalCount();  //전체 상품 갯수
            productList = productPage.getproductList();  //가져온 상품(pageSize)

            //상품 정보 없을 때 에러 처리 분기
            if (productList == null || productList.isEmpty() || totalCount == 0) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "상품 리스트가 없습니다.");
                return;
            }
            
            
            int totalPage = (int)Math.ceil((double) totalCount / pageSize);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("totalCount", totalCount);
            request.setAttribute("productList", productList);
            

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 접근입니다.");
            return;
        }


        //categoryList 가져오기
        List<Category> categoryList = new ArrayList<>();

        try {
            CategoryDao categoryDao = new CategoryDao();
            categoryList = categoryDao.getCategoryList();

            //카테고리 정보 없을 때 에러 처리 분기
            if (categoryList == null || categoryList.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "카테고리 리스트가 없습니다.");
                return;
            }

            request.setAttribute("categoryList", categoryList);

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 접근입니다.");
            return;
        }
        
     
        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/product/productList.jsp")
                .forward(request, response);
    }
}
