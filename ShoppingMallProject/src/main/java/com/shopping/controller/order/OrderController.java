package com.shopping.controller.order;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.CannotProceedException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.AddressDao;
import com.shopping.dao.CartDao;
import com.shopping.dao.MemberDao;
import com.shopping.enums.ShippingStatus;
import com.shopping.model.Address;
import com.shopping.model.Cart;
import com.shopping.model.CartProduct;
import com.shopping.model.CartProductDto;
import com.shopping.model.Member;
import com.shopping.model.Order;
import com.shopping.model.OrderDetail;
import com.shopping.model.Shipping;
import com.shopping.service.CartService;
import com.shopping.service.OrderService;

@WebServlet("/order/checkout")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<CartProductDto> cartItems;
	private OrderService orderService = new OrderService();
	private MemberDao memberDao = new MemberDao();
	private AddressDao addressDao = new AddressDao();
	CartDao cartDao = new CartDao();
	
	CartService cartService = new CartService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 회원 정보 찾기
		String id = (String) request.getSession().getAttribute("id");
		Member member = memberDao.getMemberById(id);
		Long memberId = member.getMember_id();
		
		cartItems = new ArrayList<CartProductDto>();
		
		Cart cart = cartDao.getCart(memberId);
		Long cartId = cart.getCartId();
		
		cartItems = cartService.getCartProductList(cartId);
		
		// 배송지 목록 찾기
		List<Address> memberAddrs = addressDao.getAddressList(member.getMember_id());
		
		Shipping shipping = new Shipping();
		// 기본배송지 찾기
		for(Address addr : memberAddrs) {
			if(addr.getIsDefault() == 1) {
				shipping.setRecipientName(addr.getRecipientName());
				shipping.setPhoneNumber(addr.getPhoneNumber());
				shipping.setPostalCode(addr.getPostalCode());
				shipping.setRoadNameAddress(addr.getRoadNameAddress());
				shipping.setDetailAddress(addr.getDetailAddress());
			}
		}
		
		
		request.setAttribute("cartItems", cartItems);
		request.setAttribute("member", member);
		request.setAttribute("shipping", shipping);
		request.setAttribute("memberAddrs", memberAddrs);
		
		request.getRequestDispatcher("/WEB-INF/views/order/checkout.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 정보 찾기
		String id = (String) request.getSession().getAttribute("id");
		Member member = memberDao.getMemberById(id);
		Long memberId = member.getMember_id();
		
		// OrderService 객체를 통해 주문 진행
		String orderNo = orderService.generateOrderNumber(10);
		
		Order order = new Order();
		order.setMemberId(memberId);
		order.setOrderNumber(orderNo);
		order.setTotalAmount(Integer.parseInt(request.getParameter("total")));
		order.setUsedPoints(Integer.parseInt(request.getParameter("usedPoint")));
		order.setPaymentMethod("테스트");
		order.setExpectedRewardAmount(10);
		order.setFinalPaymentAmount(Integer.parseInt(request.getParameter("totalAmount")));

		Order savedOrder = orderService.saveOrder(order, null);
		if(savedOrder == null) {
			return;
		}
		
		// 주문 상품 정보 저장
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		for (CartProductDto cartItem : cartItems) {
			OrderDetail orderDetail = new OrderDetail();
			
			orderDetail.setOrderId(savedOrder.getOrderId());
			orderDetail.setProductId(cartItem.getProductId());
			orderDetail.setQuantity(cartItem.getQuantity());
			orderDetail.setUnitPrice(cartItem.getPrice());
			orderDetail.setOptionId(cartItem.getOptionId());
			
			orderDetails.add(orderDetail);
		}
		
		// 배송 주소 정보 저장
		Shipping shipping = new Shipping();
		shipping.setOrderId(savedOrder.getOrderId());
		shipping.setRecipientName(request.getParameter("recipient-name"));
		shipping.setPhoneNumber(request.getParameter("phone-number"));
		shipping.setPostalCode(request.getParameter("postal-code"));
		shipping.setRoadNameAddress(request.getParameter("road-name-address"));
		shipping.setDetailAddress(request.getParameter("detail-address"));
		shipping.setShippingStatus(ShippingStatus.PREPARING_FOR_SHIPMENT);
		shipping.setCourierName("대한통운");
		
		String selectedOption = request.getParameter("message");
		if(selectedOption.equals("aus")) {
			selectedOption = request.getParameter("customMessage");
		}
		
		shipping.setMessage(selectedOption);
		
		// 주문 아이템 데이터 저장 (실패하든 안하든 데이터 남기기?)
		if(!orderService.saveOrderDetails(orderDetails)) {
			System.out.println("주문 아이템 저장 실패");
			return;
		}

		// 배송지 정보 저장
		if(!orderService.saveShipping(shipping)) {
			System.out.println("배송지 저장 실패");
			return;
		}
		
		// ==================================================================================
		// OrderService 객체를 통해 주문 진행
		try {
			boolean success = orderService.processOrder(memberId, order, orderDetails, shipping);
			
			// 실패요
			if(!success) {
				// 메인 페이지로 이동(에러 페이지 보여줘야 함)
				response.sendRedirect("/ShoppingMallProject/main");
				return;
			}
			
			// 장바구니에서 아이템 삭제
			for (CartProductDto cartItem : cartItems) {
				cartService.removeFromCart(cartItem.getCartProductId());
			}

			// 주문 확인 페이지로 이동
			response.sendRedirect("/ShoppingMallProject/order/completed?orderNo=" + orderNo);
			
		} catch (CannotProceedException e) { // 결제 실패
			response.sendRedirect("/ShoppingMallProject/order/checkout?msg=proceed-error");
		} catch (SQLException e) { // db 업데이트 실패
			response.sendRedirect("/ShoppingMallProject/order/checkout?msg=sql-error");
		}
		
	}

}
