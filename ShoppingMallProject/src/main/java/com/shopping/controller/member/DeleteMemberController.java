package com.shopping.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;

@WebServlet("/deleteMember")
public class DeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		Long memberId = Long.parseLong(request.getParameter("memberId"));
		MemberDao dao = new MemberDao();
		int cnt = dao.inactive(memberId);
		if(cnt == 1) {
			request.getSession().invalidate();
			response.sendRedirect("/ShoppingMallProject/main");
		}else {
			response.sendRedirect("/ShoppingMallProject/member/info?delete=fail");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
