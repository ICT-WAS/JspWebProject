package com.shopping.controller.member;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.MemberDao;
import com.shopping.dao.OrderDao;
import com.shopping.dao.OrderDetailDao;
import com.shopping.enums.OrderStatus;
import com.shopping.model.Member;
import com.shopping.model.Order;
import com.shopping.model.OrderDetail;

@WebServlet("/admin/usermanagement")
public class AdminUserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminUserManagementController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao memberDao = new MemberDao();
		OrderDao orderdao = new OrderDao();
		OrderDetailDao orderDetailDao = new OrderDetailDao();
		
		if(request.getSession().getAttribute("id") == null) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}else if(!request.getSession().getAttribute("id").equals("admin")) {
			response.sendRedirect("/ShoppingMallProject/main");
			return;
		}

		// 총 회원 수
		int UserCount = memberDao.memberCount();
		request.setAttribute("UserCount", UserCount); 
		
		// 오더 정보 + 멤버 이름
		List<Map<String, Object>> memberNameByOrderList = orderdao.MemberNameByOrderList();
		DecimalFormat df = new DecimalFormat("#,###");
		int COMPLETEDCount = 0; // 결제 완료
		int SHIPPINGCount = 0; // 배송중
		int DELIVEREDCount = 0; // 배송완료
		int PURCHASE_CONFIRMEDCount = 0; //구매확정
		
        for (Map<String, Object> map : memberNameByOrderList) {
        	
            Order order2 = (Order)map.get("order");
            
            // 영어 주문 상태 한글상태로 변환
            String statusDescription = order2.getOrderStatus().getDescription();
            
            // 위에 알려줄 건수
            if (order2.getOrderStatus() == OrderStatus.COMPLETED) {
            	COMPLETEDCount++;     
            }
            if (order2.getOrderStatus() == OrderStatus.SHIPPING) {
            	SHIPPINGCount++;    
            }
            if (order2.getOrderStatus() == OrderStatus.DELIVERED) {
            	DELIVEREDCount++;    
            }
            if (order2.getOrderStatus() == OrderStatus.PURCHASE_CONFIRMED) {
            	PURCHASE_CONFIRMEDCount++;    
            }

            
            // 가격 , 찍는거
        	int total = order2.getTotalAmount();
        	String formattedTotal =  df.format(total);
            
            // 날짜 형식 바꾸기 (날짜 db에서 날짜만 수정 하면 second 에서 오류뜸)
            if (order2 != null) {
            String dates = order2.getOrderDate().toString().split("T")[0];
            String times = order2.getOrderDate().toString().split("T")[1];

            String[] date = dates.split("-");
            String year = date[0];
            String month = date[1];
            String day = date[2];
            
            String[] time = times.split(":");
            String hour = time[0];
            String minute = time[1];
            String second = time[2];
            
            // 날짜 변수 하나로 합치기
            String finalOrderDate = String.format("%s년 %s월 %s일 %s시 %s분 %s초", year, month, day, hour, minute, second);

            map.put("statusDescription", statusDescription); 
            map.put("formattedTotal", formattedTotal);
            map.put("OrderDatetime", finalOrderDate);
            }          
        }
        
        request.setAttribute("COMPLETEDCount", COMPLETEDCount); // 결제중
        request.setAttribute("SHIPPINGCount", SHIPPINGCount); // 배송중
        request.setAttribute("DELIVEREDCount", DELIVEREDCount); // 배송완료
        request.setAttribute("PURCHASE_CONFIRMEDCount", PURCHASE_CONFIRMEDCount); // 구매확정
		request.setAttribute("orderList", memberNameByOrderList);


		// 오더 디테일 정보
		List<OrderDetail> orderDetailLists = orderDetailDao.orderDetailList();
		request.setAttribute("orderDetailLists", orderDetailLists);
		
		// 개인정보
		List<Member> allMembers = memberDao.memberList();
		
		List<Member> memberlist = allMembers.stream()
				.map(member -> {
					 String phoneNumber = member.getPhoneNumber();
			            if (phoneNumber != null && phoneNumber.length() == 11) {
			                phoneNumber = phoneNumber.substring(0, 3) + "-" +
			                              phoneNumber.substring(3, 7) + "-" +
			                              phoneNumber.substring(7);
			                member.setPhoneNumber(phoneNumber);
			                System.out.println(phoneNumber);
			            }
			            return member;
				})
				.collect(Collectors.toList());
		
		request.setAttribute("memberlist", memberlist);
		
		request.getRequestDispatcher("/WEB-INF/views/member/admininfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/admininfo.jsp").forward(request, response);
	}
	


}
