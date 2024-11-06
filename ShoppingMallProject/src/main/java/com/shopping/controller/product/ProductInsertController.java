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
import com.shopping.model.Category;

@WebServlet("/product/add")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDao categoryDao = new CategoryDao();
       
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
		
		
		
		
		response.sendRedirect("/ShoppingMallProject/product/manage");
	}

}
