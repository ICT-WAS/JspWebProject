package com.shopping.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;

@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	    }else {
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/member/signup.jsp");
			dispatcher.forward(request, response);
        }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
