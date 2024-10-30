package com.shopping.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.AddressDao;
import com.shopping.dao.MemberDao;
import com.shopping.model.Address;
import com.shopping.model.Member;

@WebServlet("/member/info")
public class MemberInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInfoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}

		String id = (String)request.getSession().getAttribute("id");
		MemberDao dao = new MemberDao();
		Member member = dao.getMemberById(id);
		// 개인정보
		request.setAttribute("member", member);

		// 주문내역
		
		// 배송지
		AddressDao aDao = new AddressDao();
		List<Address> addressList = aDao.getAddressList(member.getMember_id());
		
		request.setAttribute("addressList", addressList);
		
		request.getRequestDispatcher("/WEB-INF/views/member/info.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
