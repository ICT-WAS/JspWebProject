package com.shopping.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CategoryDao;
import com.shopping.model.Category;

@WebFilter("/*")
public class EncoderFilter extends HttpFilter implements Filter {
       
    
    public EncoderFilter() {
        super();
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
		List<Category> categoryList = new ArrayList<>();

	    try {
	        CategoryDao categoryDao = new CategoryDao();
	        categoryList = categoryDao.getCategoryList();

	        //카테고리 정보 없을 때 에러 처리 분기
	        if (categoryList == null || categoryList.isEmpty()) {
	        	((HttpServletResponse) response).sendError(HttpServletResponse.SC_NOT_FOUND, "카테고리 리스트가 없습니다.");
	            return;
	        }

	        request.setAttribute("categoryList", categoryList);

	    } catch (Exception e) {
	    	((HttpServletResponse) response).sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 접근입니다.");
	        return;
	    }
	  
		chain.doFilter(request, response);
	}
	
	
	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
