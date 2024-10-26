package com.shopping.controller.order;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.CartProduct;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Map<Long, CartProduct> map = new HashMap<Long, CartProduct>();
		
		// 테스트 데이터 생성
		CartProduct cartProduct = new CartProduct();
		
		cartProduct.setCartId(1L);
		cartProduct.setProductId(1L);
		cartProduct.setQuantity(3);
		cartProduct.setAddedDate(LocalDateTime.now());
		
		map.put(1L, cartProduct);
		
		CartProduct cartProduct2 = new CartProduct();
		
		cartProduct2.setCartId(1L);
		cartProduct2.setProductId(3L);
		cartProduct2.setQuantity(1);
		cartProduct2.setAddedDate(LocalDateTime.now());
		
		map.put(3L, cartProduct2);
		
		CartProduct cartProduct3 = new CartProduct();
		
		cartProduct3.setCartId(1L);
		cartProduct3.setProductId(2L);
		cartProduct3.setQuantity(5);
		cartProduct3.setAddedDate(LocalDateTime.now());
		
		map.put(2L, cartProduct3);
		
		request.setAttribute("cartItems", map.keySet());
		
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
