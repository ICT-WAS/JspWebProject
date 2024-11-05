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

@WebServlet("/address/update")
public class AddressUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddressUpdateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		Long addressId = Long.parseLong(request.getParameter("id"));
		AddressDao dao = new AddressDao();
		Address address = dao.getAddressById(addressId);
		request.setAttribute("address", address);
		
		request.getRequestDispatcher("/WEB-INF/views/address/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long addressId = Long.parseLong(request.getParameter("addressId"));
		AddressDao dao = new AddressDao();
		Address address = dao.getAddressById(addressId);
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
		
		int cnt = dao.update(address);
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    if (cnt == 1) {
	        out.println("<script>window.parent.onMessageReceived(true);</script>");
	    } else {
	        out.println("<script>window.parent.onMessageReceived(false);</script>");
	    }
	}

}
