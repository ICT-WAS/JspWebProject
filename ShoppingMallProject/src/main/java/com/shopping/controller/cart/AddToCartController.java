package com.shopping.controller.cart;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CartDao;
import com.shopping.dao.MemberDao;
import com.shopping.model.Cart;
import com.shopping.model.CartProduct;
import com.shopping.model.Member;

@WebServlet("/addtocart")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToCartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		Long productId = Long.parseLong(request.getParameter("productId"));
		Long optionId;
		if("null".equals(request.getParameter("optionId")) || request.getParameter("optionId")==null || "undefined".equals(request.getParameter("optionId"))) {
			optionId = null;
		}else {
			optionId = Long.parseLong(request.getParameter("optionId"));
		}
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String id = (String)request.getSession().getAttribute("id");
		MemberDao mDao = new MemberDao();
		Member member = mDao.getMemberById(id);
		Long memberId = member.getMember_id();
		CartDao dao = new CartDao();
		Cart cart = dao.getCart(memberId); 
		Long cartId = cart.getCartId();
		CartProduct cartProduct = new CartProduct();
		cartProduct.setCartId(cartId);
		cartProduct.setProductId(productId);
		cartProduct.setOptionId(optionId);
		cartProduct.setQuantity(quantity);
		boolean bool = dao.check(cartId, productId, optionId);
		String message = "";
		if(bool) {
			message = "이미 장바구니에 존재하는 상품입니다.";
		}else {
			int cnt = dao.addCartProduct(cartProduct);
			message = (cnt == 1) ? "상품이 장바구니에 추가되었습니다." : "장바구니 추가에 실패했습니다.";
		}
	    
	    response.sendRedirect("/ShoppingMallProject/product/detail?id=" + productId + "&msg=" + URLEncoder.encode(message, "UTF-8"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
