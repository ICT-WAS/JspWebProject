package com.shopping.controller.address;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.member.MemberInfoController;
import com.shopping.dao.AddressDao;

@WebServlet("/address/delete")
public class AddressDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddressDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}
		
		Long addressId = Long.parseLong(request.getParameter("addressId"));
		AddressDao dao = new AddressDao();
		int cnt = dao.delete(addressId);
		
		if(cnt == 1) {
			response.sendRedirect("/ShoppingMallProject/member/info");
		}else {
			// 삭제 실패 시 (실패할 일이 없어서 그냥 똑같이 처리함)
			response.sendRedirect("/ShoppingMallProject/member/info");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
