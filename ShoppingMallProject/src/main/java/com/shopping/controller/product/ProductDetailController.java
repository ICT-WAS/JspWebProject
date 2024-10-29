package com.shopping.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.ProductDao;
import com.shopping.model.ProductOption;
import com.shopping.model.ProductOptionDTO;

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
	
		String productId = request.getParameter("id");
		
		if(productId == null || productId.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 상품ID");
			return;
		}
		
		ProductOptionDTO productDTO = null;
		Map<String, Set<String>> optionTree = new HashMap<>();
		try {
			
			Long id = Long.parseLong(productId);
			
			ProductDao dao = new ProductDao();
			productDTO = dao.getProductById(id);
			
			//옵션 정보가 있을 때만 옵션을 맵에 세팅하기
			
			
			
			if (productDTO.getOptionList() != null) {
				List<ProductOption> optionList = productDTO.getOptionList();
				for (ProductOption option : optionList) {
					String type = option.getOptionType();
					String name = option.getOptionName();
					
					optionTree.computeIfAbsent(type, k -> new HashSet<>()).add(name);
		        }
			}
			
			for (Map.Entry<String, Set<String>> entry : optionTree.entrySet()) {
			    System.out.println("Type: " + entry.getKey() + ", Names: " + entry.getValue());
			}

			
			//상품 정보 없을 때 에러 처리 분기
			if (productDTO == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "상품을 찾을 수 없습니다.");
	            return;
	        }
			
		}catch(NumberFormatException e){
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 상품ID 형식입니다.");
	        return;
		}
		
		
        
        // 조회된 상품을 request 속성에 저장하여 JSP에 전달
		request.setAttribute("optionTree", optionTree);  //옵션을 담은 맵 전달
        request.setAttribute("productDTO", productDTO);

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(request, response);
	
	}
}
