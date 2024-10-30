package com.shopping.controller.address;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.AddressDao;
import com.shopping.dao.MemberDao;
import com.shopping.model.Address;
import com.shopping.model.Member;

@WebServlet("/address/insert")
public class AddressInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddressInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/address/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String)request.getSession().getAttribute("id");
		MemberDao mDao = new MemberDao();
		Member member = mDao.getMemberById(id);
		Long memberId = member.getMember_id();
		
		AddressDao aDao = new AddressDao();
		Address address = new Address();
		String alias = request.getParameter("alias");
		String recipientName = request.getParameter("recipientName");
		String phoneNumber = request.getParameter("phoneNumber");
		String postalCode = request.getParameter("postalCode");
		String roadNameAddress = request.getParameter("roadNameAddress");
		String detailAddress = request.getParameter("detailAddress");
		address.setAlias(alias);
		address.setRecipientName(recipientName);
		address.setPhoneNumber(phoneNumber);
		address.setPostalCode(postalCode);
		address.setRoadNameAddress(roadNameAddress);
		address.setDetailAddress(detailAddress);
		address.setMemberId(memberId);
		
		int cnt = aDao.insert(address);
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    if (cnt == 1) {
	        out.println("<script>window.parent.onMessageReceived(true);</script>");
	    } else {
	        out.println("<script>window.parent.onMessageReceived(false);</script>");
	    }
	}

}
