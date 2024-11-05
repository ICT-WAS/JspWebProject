package com.shopping.controller.address;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.AddressDao;
import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

@WebServlet("/address/default")
public class AddressDefaultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddressDefaultController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		Long addressId = Long.parseLong(request.getParameter("id"));
		String _memberId = (String)request.getSession().getAttribute("id");
		MemberDao mDao = new MemberDao();
		Member member = mDao.getMemberById(_memberId);
		Long memberId = member.getMember_id();
		AddressDao dao = new AddressDao();
		boolean bool = dao.setDefault(memberId, addressId);
		
		if(bool) {
			response.sendRedirect("/ShoppingMallProject/member/info");
		}else {
			// 실패
			response.sendRedirect("/ShoppingMallProject/member/info");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
