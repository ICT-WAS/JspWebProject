package com.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

//import com.shopping.dao.CartDao;
import com.shopping.dao.MemberDao;
import com.shopping.dao.OrderDao;
import com.shopping.dao.ProductDao;
import com.shopping.enums.OrderStatus;
import com.shopping.model.CartProduct;
import com.shopping.model.CartProductDto;
import com.shopping.model.Member;
import com.shopping.model.Order;
import com.shopping.model.OrderDetail;
import com.shopping.model.Product;
import com.shopping.model.ProductOption;
import com.shopping.model.Shipping;

public class OrderService {
	
	private MemberDao memberDao;
	//private CartDao cartDao;
	private OrderDao orderDao;
	private ProductDao productDao;
	
	private Connection conn;
	
	public OrderService() {
		memberDao = new MemberDao();
		orderDao = new OrderDao();
		productDao = new ProductDao();
	}
	
	public Order findOrderByOrderNo(String orderNo) {
		return orderDao.findOrderByOrderNo(orderNo);
	}
	
	public Shipping findShippingByOrderId(Long orderId) {
		return orderDao.findShippingByOrderId(orderId);
	}
	
	public Shipping findShippingByOrderNo(String orderNo) {
		return orderDao.findShippingByOrderId(orderDao.findOrderByOrderNo(orderNo).getOrderId());
	}
	
	public String generateOrderNumber(int length) {
		
		 Random random = new Random();
        // 0-9 숫자만 포함
        StringBuilder orderNumber = new StringBuilder();
        while(orderNumber.isEmpty() || !orderDao.canUseOrderNo(orderNumber.toString())) {
        	orderNumber = new StringBuilder();

            for (int i = 0; i < length; i++) {
                int digit = random.nextInt(10); // 0부터 9까지의 숫자 생성
                orderNumber.append(digit);
            }
        }

        return orderNumber.toString();
    }
	
	// Long 은 상품id
	// Order 또는 OrderId를 반환..?
	public boolean processOrder(Order orderData, List<OrderDetail> orderDetails, Shipping shipping) {
		
		// ========= 결제 진행중 ===========
		
		// 회원 정보 불러오기
		Member member = memberDao.getMemberByPk(orderData.getMemberId());

		// 주문 성공 상품 맵
		Map<Long, CartProduct> orderedItems = new HashMap<Long, CartProduct>();
		
//		// 주문 상품 재고 확인
//		for (Long orderItemId : cartItems.keySet()) {
//			CartProduct cartItem = cartItems.get(orderItemId);
//			Product product = productDao.getProductById(cartItem.getProductId());
//			int quantity = cartItem.getQuantity();
//			
//			// 재고 부족
//			if(product.getQuantity() < quantity) {
//				// 상품의 재고가 없습니다.
//				orderData.setOrderStatus(OrderStatus.PAYMENT_FAILED);
//				
//				// 주문 데이터 삭제
//				// orderedItems 의 모든 아이템들 재고 원래대로 변경
//				
//			}
//			
//			orderedItems.put(orderItemId, cartItem);
//			// 상품 재고 변경
//		}
		

// 		conn.setAutoCommit(false);
//		// 회원 적립금 차감
//		int point = member.getPoint() - orderData.getUsedPoints();
//		member.updatePoint(point);
//		
//		// ========= 결제 완료 ===========
//		
//		// 주문 데이터 저장
		orderData.setOrderStatus(OrderStatus.COMPLETED);
		orderDao.updateOrderStatus(orderData);
		
		// 주문 아이템 데이터 저장
		for (OrderDetail orderDetail : orderDetails) {
			orderDao.saveOrderDetail(orderDetail);
		}

		// 배송지 정보 저장
		Shipping savedShipping = orderDao.saveShipping(shipping);
//		
//		// 카트에서 주문한 아이템 삭제
//		for (Long orderItemId : cartItems.keySet()) {
//			cartDao.deleteByCartProductId(orderItemId);
//		}
		
		return true;
	}

	// 
	public Order saveOrder(Order orderData, Map<Long, CartProduct> cartItems) {
		orderData.setOrderStatus(OrderStatus.PENDING);
		int result = orderDao.saveOrder(orderData);
		
		if(result != 1) {
			System.out.println("주문 저장 실패");
			return null;
		}
		
		return orderDao.findOrderByOrderNo(orderData.getOrderNumber());
	}
	
	public List<OrderDetail> findOrderDetails(Long orderId) {
		
		List<OrderDetail> orderDetails = orderDao.findOrderDetails(orderId);
		return orderDetails;
	}

	public List<CartProductDto> findOrderDetailsToDto(Long orderId) {
		
		List<OrderDetail> orderDetails = findOrderDetails(orderId);
		
		List<CartProductDto> orderProducts = new ArrayList<CartProductDto>();
		for(OrderDetail orderDetail : orderDetails) {
			orderProducts.add(createCartProductDto(orderDetail.getProductId(), orderDetail.getOptionId(), orderDetail.getQuantity()));
		}
		
		return orderProducts;
	}
	
	// 카트 없이 cartProductDto 형식으로 만들어주는 메서드(주문내역에서 확인할 때 사용)
	public CartProductDto createCartProductDto(Long productId, Long optionId, Integer quantity) {
		CartProductDto dto = new CartProductDto();

		ProductOption productOption = productDao.getOption(optionId);
		Product product = productDao.getProduct(productId);

		dto.setProductId(productId);
		dto.setImage(product.getImg1());
		dto.setName(product.getName());
		dto.setProductPrice((int) product.getPrice());

		dto.setOptionId(productOption.getOptionId());
		dto.setOptionName(productOption.getOptionName());
		dto.setOptionPrice((int) productOption.getAdditionalPrice());
		dto.setQuantity(quantity);

		return dto;
	}
}
