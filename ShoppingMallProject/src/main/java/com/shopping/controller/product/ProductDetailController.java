package com.shopping.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.ProductDao;
import com.shopping.model.Product;

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
	
		String productId = request.getParameter("id");
		
		if(productId == null || productId.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 상품ID");
			return;
		}
		
		Product product = null;
		
		try {
			
			Long id = Long.parseLong(productId);
			
			ProductDao dao = new ProductDao();
			product = dao.getProductById(id);
			
			//상품 정보 없을 때 에러 처리 분기
			if (product == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "상품을 찾을 수 없습니다.");
	            return;
	        }
			
		}catch(NumberFormatException e){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 상품ID 형식입니다.");
	        return;
		}
		
        
        // 조회된 상품을 request 속성에 저장하여 JSP에 전달
        request.setAttribute("product", product);

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(request, response);
	
	}
}
