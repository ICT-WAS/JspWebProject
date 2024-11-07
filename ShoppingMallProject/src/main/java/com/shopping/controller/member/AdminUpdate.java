package com.shopping.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

@WebServlet("/admin/update")
public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUpdate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}else if(!request.getSession().getAttribute("id").equals("admin")) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}
		String memberId = request.getParameter("memberId");
		MemberDao dao = new MemberDao();
		Member member = dao.getMemberById(memberId);

		request.setAttribute("member", member);

		request.getRequestDispatcher("/WEB-INF/views/member/adminupdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
	    // HttpServletRequest로부터 파라미터 값 받기
		long memberId = Long.parseLong(request.getParameter("memberId"));
	    String memberNickname = request.getParameter("memberNickname");
	    String memberEmail = request.getParameter("memberEmail");
	    String memberPhoneNumber = request.getParameter("memberPhoneNumber");
	    int status = Integer.parseInt(request.getParameter("status"));
	    
	    System.out.println("값 확인해보기 아이디 : " + memberId + " 닉네임 : " + memberNickname + " 이메일 : " + memberEmail + " 전화번호 : " + memberPhoneNumber + " 회원상태 : " + status);
	    
	    if(status == 0) { // 회원 탈퇴 ( 비활성화 )
	    	int cnt = dao.memberDeactivate(memberId);
	    	System.out.println("다오 값 확인 해보기 : " + cnt);
	    }
	    
	    if(status == 1) { // 회원 수정
	    	int cnt = dao.memberUpdate(memberNickname, memberEmail, memberPhoneNumber, memberId);
	    	System.out.println("업데이트 다오값 확인 " + cnt);
	    	
	    }
	    
	    response.sendRedirect("/ShoppingMallProject/admin/usermanagement");
	}

}
