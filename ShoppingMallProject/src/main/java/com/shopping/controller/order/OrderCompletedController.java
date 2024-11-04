package com.shopping.controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.CartProductDto;
import com.shopping.model.Order;
import com.shopping.model.Shipping;
import com.shopping.service.OrderService;

@WebServlet("/order/completed")
public class OrderCompletedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
       
    public OrderCompletedController() {
        super();
        orderService = new OrderService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String orderNo = request.getParameter("orderNo");
		
		Order order = orderService.findOrderByOrderNo(orderNo);
		Shipping shipping = orderService.findShippingByOrderNo(orderNo);
		
		request.setAttribute("orderData", order);
		request.setAttribute("shippingData", shipping);
		
		List<CartProductDto> cartItems = (List<CartProductDto>)request.getSession().getAttribute("cartItems");
		request.setAttribute("cartItems", cartItems);
		request.getRequestDispatcher("/WEB-INF/views/order/orderCompleted.jsp").forward(request, response);
		
		// 세션에서 객체 삭제
		// request.getSession().removeAttribute("cartItems");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
