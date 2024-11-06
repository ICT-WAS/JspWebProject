package com.shopping.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

@WebServlet("/member/update")
public class UpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/login");
			return;
		}
		String id = (String)request.getSession().getAttribute("id");
		MemberDao dao = new MemberDao();
		Member member = dao.getMemberById(id);
		List<String> emailList = dao.getEmailList();
		request.setAttribute("emailList", emailList);
		request.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/views/member/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long memberId = Long.parseLong(request.getParameter("memberId"));
		String phoneNumber = request.getParameter("phoneNumber");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		MemberDao dao = new MemberDao();
		int cnt = dao.update(memberId, phoneNumber, nickname, email);
		if(cnt==1) {
			response.sendRedirect("/ShoppingMallProject/member/info?change=success");
		}else {
			request.setAttribute("fail", "회원 정보 수정에 실패했습니다.");
			doGet(request, response);
		}
	}

}
