package com.shopping.service;

import java.util.ArrayList;
import java.util.List;

import com.shopping.dao.CartDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.CartProduct;
import com.shopping.model.CartProductDto;
import com.shopping.model.Product;
import com.shopping.model.ProductOption;

public class CartService {
	
	CartDao cartDao = new CartDao();
	ProductDao productDao = new ProductDao();

	// 장바구니 추가
	public boolean addToCart(CartProduct cartProduct) {
		int result = cartDao.addCartProduct(cartProduct);
		
		return result == 1;
	}
	
	// 장바구니 삭제
	public boolean removeFromCart(List<Long> cartProductIdList) {
		int result = 0;
		
		for(Long cartProductId : cartProductIdList) {
			result += cartDao.removeCartProduct(cartProductId);
		}
		
		return result == cartProductIdList.size();
	}
	
	// 장바구니에 추가된 모든 아이템 반환
	public List<CartProductDto> getCartProductList(Long cartId) {
		
		List<CartProduct> cartProductList = cartDao.getCartProducts(cartId);
		List<CartProductDto> cartProductDtoList = new ArrayList<CartProductDto>();
		
		for(CartProduct cartProduct : cartProductList) {
			cartProductDtoList.add(cartProductToCartProductDto(cartProduct));
		}
		
		return cartProductDtoList;
	}
	
	// 장바구니에 저장된 상품 개수 수정
	public boolean updateCartQuantity(CartProduct cartProduct) {
		
		int result = cartDao.updateCartProduct(cartProduct.getCartProductId(), cartProduct);
		
		return result == 1;
	}
	
	// 장바구니고유ID로 아이템 반환
	public CartProductDto getCartProductById(Long cartProductID) {
		CartProduct cartProduct = cartDao.getCartProductById(cartProductID);
		
		return cartProductToCartProductDto(cartProduct);
	}
	
	// cartProduct => CartProductDto
	private CartProductDto cartProductToCartProductDto(CartProduct cartProduct) {
	      CartProductDto dto = new CartProductDto();
	      
	      Long productId = cartProduct.getProductId();
	      Long optionId = cartProduct.getOptionId();
	      
	      ProductOption productOption = productDao.getOption(optionId);
	      Product product = productDao.getProduct(productId);
	      
	      dto.setCartProductId(cartProduct.getCartProductId());
	      dto.setProductId(productId);
	      dto.setImage(product.getImg1());
	      dto.setName(product.getName());
	      dto.setProductPrice((int)product.getPrice());
	      
	      dto.setOptionId(productOption.getOptionId());
	      dto.setOptionName(productOption.getOptionName());
	      dto.setOptionPrice((int)productOption.getAdditionalPrice());
	      dto.setQuantity(cartProduct.getQuantity());
	      
	      return dto;
	}
}
