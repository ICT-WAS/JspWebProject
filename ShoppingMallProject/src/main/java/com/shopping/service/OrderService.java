package com.shopping.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

//import com.shopping.dao.CartDao;
import com.shopping.dao.MemberDao;
import com.shopping.dao.OrderDao;
import com.shopping.dao.ProductDao;
import com.shopping.enums.OrderStatus;
import com.shopping.model.CartProduct;
import com.shopping.model.Member;
import com.shopping.model.Order;
import com.shopping.model.Product;

public class OrderService {
	
	private MemberDao memberDao;
	//private CartDao cartDao;
	private OrderDao orderDao;
	private ProductDao productDao;
	
	private Connection conn;
	
	public OrderService() {
		memberDao = new MemberDao();
		orderDao = new OrderDao();
	}
	
	public static String generateOrderNumber(int length) {
        // 0-9 숫자만 포함
        StringBuilder orderNumber = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // 0부터 9까지의 숫자 생성
            orderNumber.append(digit);
        }

        return orderNumber.toString();
    }
	
	// Long 은 상품id
	public boolean processOrder(Order orderData, Map<Long, CartProduct> cartItems) {
		
		//  =========== 주문 데이터 저장  ===========
		orderData.setOrderStatus(OrderStatus.PENDING);
		int result = orderDao.saveOrder(orderData);
		
		if(result != 1) {
			System.out.println("주문 저장 실패");
			return false;
		}
				
		// ========= 결제 진행중 ===========
		
		// 회원 정보 불러오기
		// Member member = memberDao.findById(orderData.getMemberId());

		// 주문 성공 상품 맵
		Map<Long, CartProduct> orderedItems = new HashMap<Long, CartProduct>();
		System.out.println(orderedItems.size());
		
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
//		orderData.setOrderStatus(OrderStatus.COMPLETED);
//		orderDao.updateOrder(orderData.getOrderId(), orderData);
//		
//		// 주문 아이템 데이터 저장
//		for (Long orderItemId : cartItems.keySet()) {
//			orderDao.saveOrderItem(new OrderProduct());
//		}
//
//		// 배송지 정보 저장
//		orderDao.addShipping(memberDao.findByMemberId(memberId));
//		
//		// 카트에서 주문한 아이템 삭제
//		for (Long orderItemId : cartItems.keySet()) {
//			cartDao.deleteByCartProductId(orderItemId);
//		}
		
		return true;
	}
}
