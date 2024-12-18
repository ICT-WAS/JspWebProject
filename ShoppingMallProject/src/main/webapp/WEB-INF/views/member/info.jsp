<%@page import="com.shopping.model.Order"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.shopping.model.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	<style>
	.account-btn{
	    background: #ffc400;
	    color: #ffffff;
	    display: block;
	    float: left;
	    height: 50px;
	    line-height: 50px;
	    width: 145px;
	    text-align: center;
	    border-radius: 3px;
	    -webkit-transition: all 0.3s ease-in-out;
	    -o-transition: all 0.3s ease-in-out;
	    transition: all 0.3s ease-in-out;
	}
	</style>
	<!-- 스크립트 -->
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	    $(document).ready(function() {
	    	var urlParams = new URLSearchParams(window.location.search);
	    	var message = urlParams.get('message');  // 'msg' 파라미터 값

	        if (message) {
	            alert(message);  // 'msg' 파라미터 값을 알림으로 표시
	            
	            // 현재 URL에서 'msg' 파라미터를 제거
	            urlParams.delete('message');
	            
	            // 파라미터가 제거된 새로운 URL 생성
	            var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?' + urlParams.toString();
	            
	            // 수정된 URL로 리디렉션
	            window.location.href = newUrl;
	        }
	    
	    	var message2 = "${message}"; 
        	if (message2) {
            	alert(message2);
            	window.location.href = "/ShoppingMallProject/member/info";
        	}
	        $('.openModal2').click(function(e) {
	        	var addressId = $(this).data('address-id');
	        	console.log(addressId);
	            e.preventDefault();
	            $('#modalIframe2').attr('src', '/ShoppingMallProject/address/update?id=' + addressId);
	            $('#addressModal2').modal('show');
	            
	        });
	    	
	        $('#openModal').click(function(e) {
	            e.preventDefault();
	            $('#modalIframe').attr('src', '/ShoppingMallProject/address/insert');
	            $('#addressModal').modal('show');
	        });
	
	        // 모달 내의 iframe에서 데이터 처리가 완료되면 호출되는 함수
	        window.onMessageReceived = function(success) {
	            if (success) {
	                // 모달 닫기
	                $('#addressModal').modal('hide');
	                location.reload();
	                alert('배송지가 정상적으로 저장되었습니다.');
	            }
	        }
	    });
	</script>
</head>

<%! 
Member member ; 
List<Address> addressList;
%>
<% 
member = (Member)request.getAttribute("member"); 
addressList = (List<Address>)request.getAttribute("addressList"); 
List<Order> orderList = (List<Order>)request.getAttribute("orderList"); 
%>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="account-page-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3">
                            <ul class="nav myaccount-tab-trigger" id="account-page-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="account-info-tab" data-toggle="tab" href="#account-info" role="tab" aria-controls="account-dashboard" aria-selected="true">내 개인정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="account-orders-tab" data-toggle="tab" href="#account-orders" role="tab" aria-controls="account-orders" aria-selected="false">주문내역</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="account-address-tab" data-toggle="tab" href="#account-address" role="tab" aria-controls="account-address" aria-selected="false">배송지 관리</a>
                                </li>
                            </ul>
                        </div>
                        
                        <div class="col-lg-9">
                            <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
                                <div class="tab-pane fade show active" id="account-info" role="tabpanel" aria-labelledby="account-dashboard-tab">
                                    <div class="myaccount-dashboard">
                                    	<h4 class="small-title">내 정보</h4>
                                    	<br><br>
			                            <form method="post">
		                      <div class="login-form">
		                          <div class="row">
		                              <div class="col-md-6 col-12 mb--20">
		                                  <label>아이디</label>
		                                  	<input id="id" name="id" type="text" value="${member.id}" disabled>
		                              </div>
		                              <div class="col-md-6 col-12 mb--20">
		                                  <label>전화번호</label>
		                                  <input id="phoneNumber" name="phoneNumber" type="text" value="${member.phoneNumber}" maxlength="11" disabled>
		                              </div>
		                              <div class="col-md-6">
		                                  <label>닉네임</label>
		                                  <input id="nickname" name="nickname" type="text" value="${member.nickname}" maxlength="10" disabled>
		                              </div>
		                              <div class="col-md-6">
		                                  <label>이름</label>
		                                  <input id="name" name="name" type="text" value="${member.name}" disabled>
		                              </div>
		                              <div class="col-md-12">
		                                  <label>생년월일</label>
		                                  <%
		                                  String _birth = member.getBirthday();
		                                  String birth = _birth.substring(0, 10);
		                                  %>
		                                  <input id="birth" name="birth" type="text" value="<%=birth%>" disabled>
		                              </div>
		                              <div class="col-md-12">
		                                  <label>이메일</label>
		                                  <input id="email" name="email" type="email" value="${member.email}" disabled>
		                              </div>
		                          </div>
		                      </div>
		                  </form>
		                  <br><br>
						<a class="btn btn-secondary" href="/ShoppingMallProject/member/update">수정하기</a>
                       	<a class="btn btn-secondary" href="/ShoppingMallProject/changePassword">비밀번호 변경</a>
                       	<a class="btn btn-secondary" href="#" onclick="if(confirm('정말 회원 탈퇴하시겠습니까?')) { window.location.href='/ShoppingMallProject/deleteMember?memberId=${member.member_id}'; } return false;">탈퇴하기</a>
                       	
                                        
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="account-orders" role="tabpanel" aria-labelledby="account-orders-tab">
                                    <div class="myaccount-orders">
                                        <h4 class="small-title">주문내역</h4>
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover">
                                                <tbody>
                                                    <tr>
                                                        <th>주문번호</th>
                                                        <th>주문날짜</th>
                                                        <th>상태</th>
                                                        <th>결제금액</th>
                                                        <th></th>
                                                    </tr>
                                                   <c:forEach var="order" items="${orderList}">
								                    <tr>
								                        <td>${order.orderNumber}</td>
								                        <td>${order.orderDate}</td>
								                        <td>${order.orderStatus.description}</td>
								                        <td>${order.finalPaymentAmount} 원</td>
								                        <td><a href="/ShoppingMallProject/order/completed?orderNo=${order.orderNumber}" class="uren-btn uren-btn_dark uren-btn_sm"><span>자세히</span></a></td>
								                    </tr>
								                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="account-address" role="tabpanel" aria-labelledby="account-address-tab">
                                    <div class="myaccount-orders">
                                    	<div class="row">
	                                    	<div class="col-sm-9">
		                                    	<h4 class="small-title">배송지</h4>
		                                    </div> 
		                                    <div class="col-sm-3 mb-3" style="padding-bottom: 1000">
		                                    	<a href="#" id="openModal" class="uren-btn uren-btn_dark uren-btn_sm">  
												   <span>추가하기</span>
												</a>
												
												<!-- 모달 구조 -->
												<div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
												    <div class="modal-dialog" role="document">
												        <div class="modal-content">
												            <div class="modal-header">
												                <h5 class="modal-title" id="modalLabel">주소 추가</h5>
												                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#addressModal').modal('hide');">
												                    <span aria-hidden="true">&times;</span>
												                </button>
												            </div>
												            <div class="modal-body">
												                <!-- 여기서 서블릿을 포함한 내용을 불러옵니다 -->
												                <iframe id="modalIframe" src="" style="width: 100%; height: 500px; border: none;"></iframe>
												            </div>
												            <div class="modal-footer">
												                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="$('#addressModal').modal('hide');">닫기</button>
												            </div> 
												        </div>
												    </div>
												</div>
		                                    </div>
	                                   	</div>
	                                   	<br>
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover">
                                                <tbody>
                                                    <tr>
                                                        <th>배송지 이름</th>
                                                        <th>주소</th>
                                                        <th>수령자</th>
                                                        <th>전화번호</th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                    <c:forEach var="address" items="${addressList}">
									                    <tr>
									                        <td> 
									                        <c:if test="${address.isDefault eq 1}">
									                        <span class="badge rounded-pill bg-secondary" id="default-address-badge">기본배송지</span>
									                        <br>
									                        ${address.alias}
									                        </c:if>
									                        <c:if test="${address.isDefault eq 0}">
									                        <a href="#" onclick="if(confirm('${address.alias} 배송지를 기본 배송지로 변경하시겠습니까?')) { window.location.href='/ShoppingMallProject/address/default?id=${address.addressId}'; } return false;">${address.alias}</a>
									                        </c:if> 
									                        </td>
									                        <td>${address.roadNameAddress}<br>${address.detailAddress}</td>
									                        <td>${address.recipientName}</td>
									                        <td id="phone-${address.addressId}">${address.phoneNumber}</td>
						 			                        <td><a href="javascript:void(0)" data-address-id="${address.addressId}" class="uren-btn uren-btn_dark uren-btn_sm openModal2"><span>수정</span></a></td>
									                        <td><a href="#" onclick="if(confirm('정말 삭제하시겠습니까?')) { window.location.href='/ShoppingMallProject/address/delete?addressId=${address.addressId}'; } return false;" class="uren-btn uren-btn_dark uren-btn_sm"><span>삭제</span></a></td>
									                    </tr>
									                </c:forEach>
									                <!-- 모달 구조 -->
															<div class="modal fade" id="addressModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
															    <div class="modal-dialog" role="document">
															        <div class="modal-content">
															            <div class="modal-header">
															                <h5 class="modal-title" id="modalLabel">배송지 수정</h5>
															                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#addressModal2').modal('hide');">
															                    <span aria-hidden="true">&times;</span>
															                </button>
															            </div>
															            <div class="modal-body">
															                <!-- 여기서 서블릿을 포함한 내용을 불러옵니다 -->
															                <iframe id="modalIframe2" src="" style="width: 100%; height: 500px; border: none;"></iframe>
															            </div>
															            <div class="modal-footer">
															                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="$('#addressModal2').modal('hide');">닫기</button>
															            </div> 
															        </div>
															    </div>
															</div>
									                <script>
													    // 전화번호를 ###-####-#### 형식으로 변환하는 함수
													    function formatPhoneNumber(phoneNumber) {
													        const phoneNumberStr = phoneNumber.toString();
													        if (phoneNumberStr.length === 11) {
													            return phoneNumberStr.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
													        }
													        return phoneNumberStr; // 유효하지 않으면 그대로 반환
													    }
													
													    // 페이지 로드 후 전화번호 포맷 적용
													    window.onload = function() {
													        const phoneElements = document.querySelectorAll('[id^="phone-"]');
													        phoneElements.forEach(function(element) {
													            const phoneNumber = element.textContent.trim(); // 전화번호 텍스트 가져오기
													            const formattedPhoneNumber = formatPhoneNumber(phoneNumber);
													            element.textContent = formattedPhoneNumber; // 포맷팅된 전화번호로 텍스트 변경
													        });
													    };
													</script>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
                                    <div class="myaccount-details">
                                        <form action="#" class="uren-form">
                                            <div class="uren-form-inner">
                                                <div class="single-input single-input-half">
                                                    <label for="account-details-firstname">First Name*</label>
                                                    <input type="text" id="account-details-firstname">
                                                </div>
                                                <div class="single-input single-input-half">
                                                    <label for="account-details-lastname">Last Name*</label>
                                                    <input type="text" id="account-details-lastname">
                                                </div>
                                                <div class="single-input">
                                                    <label for="account-details-email">Email*</label>
                                                    <input type="email" id="account-details-email">
                                                </div>
                                                <div class="single-input">
                                                    <label for="account-details-oldpass">Current Password(leave blank to leave
                                                        unchanged)</label>
                                                    <input type="password" id="account-details-oldpass">
                                                </div>
                                                <div class="single-input">
                                                    <label for="account-details-newpass">New Password (leave blank to leave
                                                        unchanged)</label>
                                                    <input type="password" id="account-details-newpass">
                                                </div>
                                                <div class="single-input">
                                                    <label for="account-details-confpass">Confirm New Password</label>
                                                    <input type="password" id="account-details-confpass">
                                                </div>
                                                <div class="single-input">
                                                    <button class="uren-btn uren-btn_dark" type="submit"><span>SAVE
                                                    CHANGES</span></button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>
