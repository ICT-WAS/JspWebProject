package com.shopping.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

@WebServlet("/changePassword")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePasswordController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		request.getRequestDispatcher("WEB-INF/views/member/changePassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
		String before = request.getParameter("before");
		String after = request.getParameter("after2");
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		System.out.println(before);
		System.out.println(after);
		Member member = dao.getMemberById(id);
		if(member.getPassword().equals(before)) {
			int cnt = dao.changePassword(id, after);
			if(cnt == 1) {
				response.sendRedirect("/ShoppingMallProject/member/info?changepw=success");
			}else {
				request.setAttribute("fail", "비밀번호 변경에 실패했습니다.");
				doGet(request, response);
			}
		}else {
			request.setAttribute("fail", "현재 비밀번호가 일치하지 않습니다.");
			doGet(request, response);
		}
	}

}
