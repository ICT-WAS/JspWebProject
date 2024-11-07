package com.shopping.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.ProductDao;
import com.shopping.model.ProductOptionDTO;

@WebServlet("/product/manage")
public class ProductManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductDao productDao = new ProductDao();
       
    public ProductManagementController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<ProductOptionDTO> productDtoList = productDao.getAllProductDto();
		
		request.setAttribute("productDtoList", productDtoList);
		
		request.getRequestDispatcher("/WEB-INF/views/product/productManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
