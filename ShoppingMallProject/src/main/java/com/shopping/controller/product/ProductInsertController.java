package com.shopping.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CategoryDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.Category;
import com.shopping.model.Product;

@WebServlet("/product/add")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDao categoryDao = new CategoryDao();
	private ProductDao productDao = new ProductDao();
       
    public ProductInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        List<Category> rootCategoryList = categoryDao.getRootCategoryList();
        Map<Long, List<Category>> categoryMap = new HashMap<Long, List<Category>>(); // <rootCategoryId, childCategoryList>
        
        for(Category rootCategory : rootCategoryList) {
        	List<Category> categoryList = categoryDao.getCategoryListByParentId(rootCategory.getCategoryId());
        	categoryMap.put(rootCategory.getCategoryId(), categoryList);
        }
        
        request.setAttribute("rootCategoryList", rootCategoryList);
        request.setAttribute("categoryMap", categoryMap);
		
		request.getRequestDispatcher("/WEB-INF/views/product/productInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long categoryId = Long.parseLong(request.getParameter("categoryId"));
		String productName = request.getParameter("productName");
		String img = request.getParameter("img");
		String img2 = request.getParameter("img2");
		String img3 = request.getParameter("img3");
		double price = Double.valueOf(request.getParameter("price"));
		double quantity = Double.valueOf(request.getParameter("quantity"));
		String brand = request.getParameter("brand");
		String status = request.getParameter("status");
		String description = request.getParameter("description");
		
		System.out.println(img);
		
		Product product = new Product();
		product.setCategoryId(categoryId);
		product.setName(productName);
		product.setImg1(img);
		product.setImg2(img2);
		product.setImg3(img3);
		product.setPrice(price);
		product.setQuantity(quantity);
		product.setBrand(brand);
		product.setStatus(status);
		product.setDescription(description);
		
		System.out.println(product);
		
		boolean success = productDao.insertProduct(product);
		
		if(!success) {
			// 실패
			response.sendRedirect("/ShoppingMallProject/main");
		}
		
		response.sendRedirect("/ShoppingMallProject/product/manage");
	}

}
