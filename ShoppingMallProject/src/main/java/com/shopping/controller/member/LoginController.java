package com.shopping.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") != null) {
			response.sendRedirect("main");
			return;
		}
		request.getRequestDispatcher("WEB-INF/views/member/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDao dao = new MemberDao();
		
		Member member = dao.login(id, pw);
		if(member==null) {
			// 로그인 실패
			request.setAttribute("fail", "아이디 또는 비밀번호가 틀렸습니다.");
			doGet(request, response);
		}else {
			request.getSession().setAttribute("id", id);
			response.sendRedirect("main");
		}
	}

}
