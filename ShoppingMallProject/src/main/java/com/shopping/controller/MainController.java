package com.shopping.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.dao.ProductDao;

@WebServlet(urlPatterns = {"/main"})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao pDao = new ProductDao();
		Long productCount = pDao.getProductCount();
		MemberDao mDao = new MemberDao();
		Long memberCount = (long)(mDao.memberCount());
		
		request.setAttribute("productCount", productCount);
		request.setAttribute("memberCount", memberCount);
		
		request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
