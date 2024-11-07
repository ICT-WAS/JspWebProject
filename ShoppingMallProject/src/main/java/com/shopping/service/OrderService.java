package com.shopping.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.naming.CannotProceedException;

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
		
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		try {
			Class.forName(driver) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection getConnection() {
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
			String id = "projectV2" ;
			String password = "oracle" ;
			
			this.conn = DriverManager.getConnection(url, id, password) ;
			if(conn == null) {System.out.println("접속 실패");} 			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return conn ;
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
	public boolean processOrder(Long memberId, Order orderData, List<OrderDetail> orderDetails, Shipping shipping) throws CannotProceedException, SQLException {
		// ========= 결제 진행중 ===========
		
		conn = getConnection();
		
		// 회원 정보 불러오기
		Member member = memberDao.getMemberByPk(orderData.getMemberId());
		
		try {
			conn.setAutoCommit(false);
			
			// 옵션별 업데이트될 재고
			Map<Long, Integer> optionIdAndQuantity = new HashMap<Long, Integer>();
			// 옵션 없는 상품 업데이트될 재고
			Map<Long, Integer> productIdAndQuantity = new HashMap<Long, Integer>();
			boolean success = true;
			// 주문 상품 재고 확인
			for (OrderDetail orderDetail : orderDetails) {
				
				// 재고
				int stock = (int)productDao.getProduct(orderDetail.getProductId()).getQuantity();
				// 옵션 있는 상품
				if(orderDetail.getOptionId() != null) {
					ProductOption option = productDao.getOption(orderDetail.getOptionId());
					stock = (int)option.getOptionStockquantity();
				}

				int afterPaymentStock = stock - orderDetail.getQuantity();
				// 재고 부족
				if(afterPaymentStock < 0) {
					success &= false;
				}
				
				if(orderDetail.getOptionId() != null) { // 옵션 있는 상품
					optionIdAndQuantity.put(orderDetail.getOptionId(), afterPaymentStock);
				} else { // 옵션 없는 상품
					productIdAndQuantity.put(orderDetail.getProductId(), afterPaymentStock);
				}
			}
			
			if(!success) {
				orderData.setOrderStatus(OrderStatus.PAYMENT_FAILED);
				System.out.println("재고없음");
				throw new CannotProceedException();
			}
			
			// 상품 재고 변경
			productDao.updateQuantity(conn, optionIdAndQuantity);
			
			// 회원 적립금 차감
			int point = (int)(member.getPoint() - orderData.getUsedPoints());
			memberDao.updatePoint(conn, memberId, point);
			
			// ========= 결제 완료 ===========
			
			// 주문 데이터 저장
			orderData.setOrderStatus(OrderStatus.COMPLETED);
			orderDao.updateOrderStatus(conn, orderData);
			
			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				throw new SQLException();
			}
			return false;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

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

		Product product = productDao.getProduct(productId);

		dto.setProductId(productId);
		dto.setImage(product.getImg1());
		dto.setName(product.getName());
		dto.setProductPrice((int) product.getPrice());
		dto.setQuantity(quantity);
		
		if(optionId == null) {
			return dto;
		}
		
		ProductOption productOption = productDao.getOption(optionId);
		if(productOption == null) {
			return dto;
		}

		dto.setOptionId(productOption.getOptionId());
		dto.setOptionName(productOption.getOptionName());
		dto.setOptionPrice((int) productOption.getAdditionalPrice());
		
		return dto;
	}

	public boolean saveOrderDetails(List<OrderDetail> orderDetails) {
		int result = 0;
		for (OrderDetail orderDetail : orderDetails) {
			result += orderDao.saveOrderDetail(orderDetail);
		}
		return result == orderDetails.size();
	}

	public boolean saveShipping(Shipping shipping) {
		return orderDao.saveShipping(shipping) == 1;
	}
}
