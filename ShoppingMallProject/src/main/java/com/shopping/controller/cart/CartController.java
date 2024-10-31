package com.shopping.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CartDao;
import com.shopping.dao.MemberDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.Cart;
import com.shopping.model.CartProduct;
import com.shopping.model.CartProductDto;
import com.shopping.model.Member;
import com.shopping.model.Product;
import com.shopping.model.ProductOption;

@WebServlet("/cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		String id = (String) request.getSession().getAttribute("id");
		Member member = new MemberDao().getMemberById(id);
		Long memberId = member.getMember_id();
		CartDao cDao = new CartDao();
		Cart cart = cDao.getCart(memberId);
		Long cartId = cart.getCartId();
		
		List<CartProduct> _cartProducts = cDao.getCartProducts(cartId);
		List<CartProductDto> cartProducts = new ArrayList<CartProductDto>();
		// 여기서 상품, 옵션 정보를 나눠서 리퀘스트로 넘겨주기,
		for(CartProduct product : _cartProducts) {
			CartProductDto dto = cartProductToCartProductDto(product);
			
			cartProducts.add(dto);
		}
		
		request.setAttribute("cartProducts", cartProducts);
		
		request.getRequestDispatcher("WEB-INF/views/cart/cart.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
 
	private CartProductDto cartProductToCartProductDto(CartProduct cartProduct) {
		CartProductDto dto = new CartProductDto();
		
		Long productId = cartProduct.getProductId();
		Long optionId = cartProduct.getOptionId();
		ProductDao pDao = new ProductDao();
		ProductOption productOption = pDao.getOption(optionId);
		Product product = pDao.getProduct(productId);
		
		return dto;
	}
}
