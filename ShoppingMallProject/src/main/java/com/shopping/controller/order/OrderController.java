package com.shopping.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		// List<CartProductDto> cartItems = new ArrayList<CartProductDto>();
		cartItems = new ArrayList<CartProductDto>();
		
		Long memberId = 1L;
		Cart cart = cartDao.getCart(memberId);
		Long cartId = cart.getCartId();
		
		System.out.println("cartId : " + cartId);
		
		// 테스트 데이터 생성
		CartProduct cartProduct = new CartProduct();
		cartProduct.setCartId(cartId);
		cartProduct.setProductId(203L);
		cartProduct.setOptionId(3216L);
		cartProduct.setQuantity(11);
		
		cartService.addToCart(cartProduct);
		
		CartProduct cartProduct2 = new CartProduct();
		cartProduct2.setCartId(cartId);
		cartProduct2.setProductId(203L);
		cartProduct2.setOptionId(3217L);
		cartProduct2.setQuantity(4);
		
		cartService.addToCart(cartProduct2);
		
		CartProduct cartProduct3 = new CartProduct();
		cartProduct3.setCartId(cartId);
		cartProduct3.setProductId(259L);
		cartProduct3.setOptionId(3372L);
		cartProduct3.setQuantity(6);
		
		cartService.addToCart(cartProduct3);
		
		cartItems = cartService.getCartProductList(cartId);
		
		// 회원 정보 찾기
		Member member = memberDao.getMemberById("회원가입_001");
		//memberDao.getMemberById(request.getSession(false).getAttribute("id"));
		
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
		
		// ==== 실제 로직 ====
		
		request.setAttribute("cartItems", cartItems);
		request.setAttribute("member", member);
		request.setAttribute("shipping", shipping);
		request.setAttribute("memberAddrs", memberAddrs);
		
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
		
		// ==================================================================================
		// OrderService 객체를 통해 주문 진행
		boolean success = orderService.processOrder(order, orderDetails, shipping);
		
		// 실패요
		if(!success) {
			// 메인 페이지로 이동(에러 페이지 보여줘야 함)
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}

		// 주문 확인 페이지로 이동
		response.sendRedirect("/ShoppingMallProject/order/completed?orderNo=" + orderNo);
	}

}
