package com.shopping.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.dao.CategoryDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.Category;
import com.shopping.model.ProductOptionDTO;

@WebServlet("/product/manage")
public class ProductManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductDao productDao = new ProductDao();
	private CategoryDao categoryDao = new CategoryDao();
       
    public ProductManagementController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session == null) {
			response.sendRedirect("/ShoppingMallProject/main");
		}

		String id = (String) session.getAttribute("id");
		if(!id.equals("admin")) {
			response.sendRedirect("/ShoppingMallProject/main");
		}
		
		List<ProductOptionDTO> productDtoList = productDao.getAllProductDto();
		List<Category> rootCategoryList = categoryDao.getRootCategoryList();
		
		request.setAttribute("rootCategoryList", rootCategoryList);
		request.setAttribute("productDtoList", productDtoList);
		
		request.getRequestDispatcher("/WEB-INF/views/product/productManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
