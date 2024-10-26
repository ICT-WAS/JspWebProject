package com.shopping.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") != null) {
			response.sendRedirect("/main");
		}
		
	    String m = request.getParameter("m");
	    
	    if("checkId".equals(m)) {
	    	MemberDao dao = new MemberDao();
	    	
	    	String id = request.getParameter("id");
		    
		    response.setContentType("text/plain");
	        PrintWriter out = response.getWriter();
	        
	    	if (id == null || id.isEmpty()) {
                out.print("ERR: No ID provided");
                return;
            }
	    	
	    	// 아이디가 이미 존재하는지 확인
            boolean idExists = false;
            
            try {
                idExists = dao.checkId(id);
            } catch (Exception e) {
                out.print("ERR: Database error");
                e.printStackTrace(); // 로그에 기록
                return;
            }
            
            if (idExists) {
                out.print("ERR: ID already exists"); // 사용할 수 없는 경우
            } else {
                out.print("RES:Y"); // 사용할 수 있는 경우
            }
	    }else{
	    	request.getRequestDispatcher("WEB-INF/views/member/signup.jsp").forward(request, response);
        }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		Member bean = new Member();
		String id = request.getParameter("id");
		bean.setId(id);
		String phoneNumber = request.getParameter("phoneNumber");
		bean.setPhoneNumber(phoneNumber);
		String password = request.getParameter("password1");
		bean.setPassword(password);
		String nickname = request.getParameter("nickname");
		bean.setNickname(nickname);
		String name = request.getParameter("name");
		bean.setName(name);
		String birth = request.getParameter("birth");
		bean.setBirthday(birth);
		String email = request.getParameter("email");
		bean.setEmail(email);
		
		int cnt = dao.signUp(bean);
		
		if(cnt==-1) {
			// 실패 시 처리 방안
			// 1. 다시 회원가입으로 돌려보내고 alert 띄운다.
			// 2. 메인으로 보낸다.
			doGet(request, response);
		}else {
			request.getSession().setAttribute("id", id);
			response.sendRedirect("/main");
		}
	}

}