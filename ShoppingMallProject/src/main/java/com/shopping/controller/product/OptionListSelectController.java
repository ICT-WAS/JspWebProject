package com.shopping.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.shopping.dao.ProductDao;
import com.shopping.model.ProductOption;

@WebServlet("/get-optionList")
public class OptionListSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao = new ProductDao();
       
    public OptionListSelectController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        
        List<ProductOption> optionList = new ArrayList<>();
        
        // JSON 배열 생성
        JSONArray jsonArray = new JSONArray();
        
        String id = request.getParameter("productId");
        System.out.println(id);

        Long productId = Long.valueOf(id);
        optionList = productDao.getOptionList(productId);
        
        System.out.println(optionList);
        response.setCharacterEncoding("UTF-8");
        // 리스트의 각 항목을 JSON 배열에 추가
        for (ProductOption option : optionList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("optionId", option.getOptionId());
            jsonObject.put("optionName", option.getOptionName());
            jsonObject.put("additionalPrice", option.getAdditionalPrice());
            jsonObject.put("optionStockquantity", option.getOptionStockquantity());
            jsonArray.put(jsonObject);
        }

        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();
	}
}
