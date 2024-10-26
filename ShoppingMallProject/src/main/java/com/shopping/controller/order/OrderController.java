package com.shopping.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.CartProductDto;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<CartProductDto> cartItems = new ArrayList<CartProductDto>();
		
		// 테스트 데이터 생성
		CartProductDto cartProduct = new CartProductDto();
		
		cartProduct.setCartId(1L);
		cartProduct.setProductId(1L);
		cartProduct.setPrice(100);
		cartProduct.setName("상품A");
		cartProduct.setQuantity(3);
		
		cartItems.add(cartProduct);
		
		CartProductDto cartProduct2 = new CartProductDto();
		
		cartProduct2.setCartId(1L);
		cartProduct2.setProductId(3L);
		cartProduct2.setPrice(1000);
		cartProduct2.setName("상품2");
		cartProduct2.setQuantity(1);
		
		cartItems.add(cartProduct2);
		
		CartProductDto cartProduct3 = new CartProductDto();
		
		cartProduct3.setCartId(1L);
		cartProduct3.setProductId(2L);
		cartProduct3.setPrice(2400);
		cartProduct3.setName("상품3");
		cartProduct3.setQuantity(5);
		
		cartItems.add(cartProduct3);
		
		
		// ==== 실제 로직 ====
		
		request.setAttribute("cartItems", cartItems);
		
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
