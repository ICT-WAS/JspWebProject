package com.shopping.controller.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.shopping.dao.ProductDao;
import com.shopping.model.ProductOption;

@WebServlet("/add-option")
public class OptionInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao = new ProductDao();
       
    public OptionInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 클라이언트로부터 받은 JSON 데이터를 읽기
		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder jsonBuilder  = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
        	jsonBuilder .append(line);
        }
        
        String jsonString = jsonBuilder.toString();
        JSONObject jsonObject = new JSONObject(jsonString);
        
        Long productId = jsonObject.getLong("productId");
        String optionName = jsonObject.getString("optionName");
        int additionalPrice = jsonObject.getInt("additionalPrice");
        int optionStockquantity = jsonObject.getInt("optionStockquantity");
        
        ProductOption option = new ProductOption();
        option.setProductId(productId);
        option.setOptionName(optionName);
        option.setAdditionalPrice(additionalPrice);
        option.setOptionStockquantity(optionStockquantity);
        
        if(!productDao.insertOption(option)) {
        	System.out.println("저장 실패");
        	return;
        }
        
        // 응답
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("status", "success");
        jsonResponse.put("message", "Data received successfully");
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(jsonResponse.toString());
	}

}
