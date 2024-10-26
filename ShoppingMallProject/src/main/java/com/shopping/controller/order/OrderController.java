package com.shopping.controller.order;

import java.io.IOException;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;

=======
>>>>>>> bc5306b8daf57ce438ef379915e71d4a0ed97397
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import com.shopping.model.CartProductDto;

@WebServlet("/order/checkout")
=======
@WebServlet("/order")
>>>>>>> bc5306b8daf57ce438ef379915e71d4a0ed97397
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<CartProductDto> cartItems;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
	
		// List<CartProductDto> cartItems = new ArrayList<CartProductDto>();
		cartItems = new ArrayList<CartProductDto>();
		
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
		
		request.getRequestDispatcher("/WEB-INF/views/order/checkout.jsp").forward(request, response);
=======
		response.getWriter().append("Served at: ").append(request.getContextPath());
>>>>>>> bc5306b8daf57ce438ef379915e71d4a0ed97397
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// OrderService 객체를 통해 주문 진행
		
		String orderNo = "";
		
		request.getSession().setAttribute("cartItems", cartItems);
		
		// 주문 확인 페이지로 이동
		response.sendRedirect("/ShoppingMallProject/order/completed");
	}

}
