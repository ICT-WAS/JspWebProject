//package com.shopping.service;
//
//import java.sql.Connection;
//import java.util.HashMap;
//import java.util.Map;
//
//import com.shopping.dao.CartDao;
//import com.shopping.dao.MemberDao;
//import com.shopping.dao.OrderDao;
//import com.shopping.enums.OrderStatus;
//import com.shopping.model.CartProduct;
//import com.shopping.model.Member;
//import com.shopping.model.Order;
//
//public class OrderService {
//	
//	private MemberDao memberDao;
//	private CartDao cartDao;
//	private OrderDao orderDao;
//	
//	private Connection conn;
//	
//	// Long 은 상품id
//	public boolean processOrder(Order orderData, Map<Long, CartProduct> cartItems) {
//		
//		conn.setAutoCommit(false);
//		
//		//  =========== 주문 데이터 저장  ===========
//		orderData.setOrderStatus(OrderStatus.PENDING);
//		orderDao.saveOrder(orderData);
//				
//		// ========= 결제 진행중 ===========
//		
//		// 회원 정보 불러오기
//		Member member = memberDao.findById(orderData.getMemberId());
//
//		// 주문 성공 상품 맵
//		Map<Long, CartProduct> orderedItems = new HashMap<Long, CartProduct>();
//		System.out.println(orderedItems.size());
//		
//		// 주문 상품 재고 확인
//		for (Long orderItemId : cartItems.keySet()) {
//			CartProduct cartItem = cartItems.get(orderItemId);
//			Product product = productDao.findById(cartItem.getProductId());
//			int quantity = cartItem.getQuantity();
//			
//			// 재고 부족
//			if(product.getStock() < quantity) {
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
//		
//		
//		// 회원 적립금 차감
//		int point = member.getPoint() - orderData.getUsedPoints();
//		member.updatePoint(point);
//		
//		// ========= 결제 완료 ===========
//		
//		// 주문 데이터 저장
//		orderData.setOrderStatus(OrderStatus.COMPLETED);
//		orderDao.updateOrder(orderData.getOrderId(), orderData);
//		
//		// 주문 아이템 데이터 저장
//		for (Long orderItemId : cartItems.keySet()) {
//			orderDao.saveOrderItem(new OrderItem());
//		}
//
//		// 배송지 정보 저장
//		MemberAddress memberAddress = membeDao.findByMemberId(memberId);
//		
//		// 카트에서 주문한 아이템 삭제
//		for (Long orderItemId : cartItems.keySet()) {
//			cartDao.deleteByCartProductId(orderItemId);
//		}
//		
//		return true;
//	}
//}
