package com.shopping.controller.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.shopping.dao.CategoryDao;

@WebServlet("/add-category")
public class CategoryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDao categoryDao = new CategoryDao();
       
    public CategoryInsertController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 클라이언트로부터 받은 JSON 데이터를 읽기
		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder jsonBuilder  = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
        	jsonBuilder .append(line);
        }
        
        String jsonString = jsonBuilder.toString();
        JSONObject jsonObject = new JSONObject(jsonString);
        
        Object parentCategoryIdObj = jsonObject.opt("parentCategoryId");

        Long parentCategoryId = null;

        if (parentCategoryIdObj != null && parentCategoryIdObj instanceof Number) {
                parentCategoryId = ((Number) parentCategoryIdObj).longValue();
            }
        
        String categoryName = jsonObject.getString("categoryName");
        int categoryLevel = jsonObject.getInt("categoryLevel");
        
        int result = categoryDao.addCategory(parentCategoryId, categoryName, categoryLevel);
        
        if(result != 1) {
        	System.out.println("저장 실패");
        	return;
        }
        
        // 응답
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("status", "success");
        jsonResponse.put("message", "Data received successfully");
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(jsonResponse.toString());
	}

}
