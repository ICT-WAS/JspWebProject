package com.shopping.controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CartDao;

@WebServlet("/cart/delete")
public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		Long cartProductId = Long.parseLong(request.getParameter("cartProductId"));
		CartDao dao = new CartDao();
		int cnt = dao.delete(cartProductId);
		if(cnt == 1) {
			response.sendRedirect("/ShoppingMallProject/cart");
		}else {
			// 실패
			response.sendRedirect("/ShoppingMallProject/cart");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
