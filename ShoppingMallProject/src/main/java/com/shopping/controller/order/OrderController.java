package com.shopping.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.model.CartProductDto;
import com.shopping.model.Member;
import com.shopping.model.Order;
import com.shopping.service.OrderService;

@WebServlet("/order/checkout")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<CartProductDto> cartItems;
	private OrderService orderService = new OrderService();
	private MemberDao memberDao = new MemberDao();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// List<CartProductDto> cartItems = new ArrayList<CartProductDto>();
		cartItems = new ArrayList<CartProductDto>();
		
		// 테스트 데이터 생성
		CartProductDto cartProduct = new CartProductDto();
		
		cartProduct.setProductId(1L);
		cartProduct.setPrice(100);
		cartProduct.setName("상품A");
		cartProduct.setQuantity(3);
		
		cartItems.add(cartProduct);
		
		CartProductDto cartProduct2 = new CartProductDto();
		
		cartProduct2.setProductId(3L);
		cartProduct2.setPrice(1000);
		cartProduct2.setName("상품2");
		cartProduct2.setQuantity(1);
		
		cartItems.add(cartProduct2);
		
		CartProductDto cartProduct3 = new CartProductDto();
		
		cartProduct3.setProductId(2L);
		cartProduct3.setPrice(2400);
		cartProduct3.setName("상품3");
		cartProduct3.setQuantity(5);
		
		cartItems.add(cartProduct3);
		
		Member member = memberDao.getMemberById("회원가입_001");
		//memberDao.getMemberById(request.getSession(false).getAttribute("id"));
		
		// ==== 실제 로직 ====
		
		request.setAttribute("cartItems", cartItems);
		request.setAttribute("member", member);
		//request.setAttribute("memberAddr", memberAddr);
		
		request.getRequestDispatcher("/WEB-INF/views/order/checkout.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// MemberDao memberDao = new MemberDao();
		// Long id = memberDao.getMemberById((String)request.getSession().getAttribute("id")).getMember_id();
		
		// OrderService 객체를 통해 주문 진행
		String orderNo = orderService.generateOrderNumber(10);
		
		Order order = new Order();
		order.setMemberId(1L);
		order.setOrderNumber(orderNo);
		order.setTotalAmount(Integer.parseInt((String)request.getParameter("total")));
		order.setUsedPoints(Integer.parseInt((String)request.getParameter("usedPoint")));
		order.setPaymentMethod("결제안했지롱");
		order.setExpectedRewardAmount(10);
		order.setFinalPaymentAmount(Integer.parseInt((String)request.getParameter("totalAmount")));
		
		
		// 여기서부터가 진짜.
		boolean success = orderService.processOrder(order, null);
		
		// 실패요
		if(!success) {
			// 메인 페이지로 이동(에러 페이지 보여줘야 함)
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}
		
		request.getSession().setAttribute("cartItems", cartItems);
		

		// 주문 확인 페이지로 이동
		response.sendRedirect("/ShoppingMallProject/order/completed?orderNo=" + orderNo);
	}

}
