<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shopping.model.Order"%>
<%@page import="com.shopping.model.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="zxx">

<%


%>

<head>
    <ui:css />
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#openModal').click(function(e) {
                e.preventDefault();
                $('#modalIframe').attr('src', '/ShoppingMallProject/address/insert');
                $('#addressModal').modal('show');
            });

            window.onMessageReceived = function(success) {
                if (success) {
                    $('#addressModal').modal('hide');
                    location.reload();
                }
            }
        });
    </script>
</head>

<%! 
Member member; 
List<Address> addressList;
int cnt = 0;
%>
<% 
member = (Member)request.getAttribute("member"); 
addressList = (List<Address>)request.getAttribute("addressList"); 
%>

<body class="template-color-1">
    <ui:header />
    <div class="main-wrapper">
        <div class="account-page-area">
            <div class="container-fluid">
                <div class="row">
				    <div class="col-lg-3">
				        <ul class="nav myaccount-tab-trigger" id="account-page-tab" role="tablist">
				            <li class="nav-item">
				                <a class="nav-link active" id="account-info-tab" data-toggle="tab" href="#account-user-management" role="tab" aria-controls="account-dashboard" aria-selected="true">회원 관리</a>
				            </li>
				            <li class="nav-item">
				                <a class="nav-link" id="account-orders-tab" data-toggle="tab" href="#account-order-details" role="tab" aria-controls="account-order-details" aria-selected="false">주문내역 조회</a>
				            </li>
				            <li class="nav-item">
				                <a class="nav-link" id="account-product-tab" data-toggle="tab" href="#account-product-management" role="tab" aria-controls="account-product-management" aria-selected="false">상품 관리</a>
				            </li>
				            <li class="nav-item">
				                <a class="nav-link" id="account-product-insert-tab" data-toggle="tab" href="#account-product-insert" role="tab" aria-controls="account-product-insert" aria-selected="false">상품 등록</a>
				            </li>
				            <li class="nav-item">
				                <a class="nav-link" id="account-product-delete-tab" data-toggle="tab" href="#account-product-delete" role="tab" aria-controls="account-product-delete" aria-selected="false">상품 삭제</a>
				            </li>
				        </ul>
				    </div>
				
				    <!-- 우측 탭 콘텐츠 -->
				    <div class="col-lg-9">
				        <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
				        
							<!-- 대쉬보드겸 회원관리 창 -->
							<div class="tab-pane fade show active"
								id="account-user-management" role="tabpanel"
								aria-labelledby="account-dashboard-tab">
								<div class="myaccount-dashboard">
									<p>쇼핑몰 가입한 유저: ${UserCount}</p>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>회원 이름</th>
												<th>닉네임</th>
												<th>이메일</th>
												<th>전화번호</th>
												<th>회원상태</th>
												<th>마지막 로그인</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="memberDate" items="${memberlist}">
												<tr>
													<td>${memberDate.name}</td>
													<td>${memberDate.nickname}</td>
													<td>${memberDate.email}</td>
													<td>${memberDate.phoneNumber}</td>
													<td><c:choose>
															<c:when test="${memberDate.status == 1}">활성화</c:when>
															<c:otherwise>비활성화</c:otherwise>
														</c:choose></td>
													<td>${memberDate.lastLogin}</td>
													<td><button
															onclick="window.location.href='update?memberId=${memberDate.id}'"
															class="uren-btn uren-btn_dark uren-btn_sm">회원 수정</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 회원 관리 끝 -->
					        <!-- 주문 내역 조회 시작 -->
					        <div class="tab-pane fade" id="account-order-details" role="tabpanel">
					            <div class="myaccount-orders">
					            <p>결제완료 : ${PENDINGCount}건, 배송중 : ${SHIPPINGCount}건, 배송완료 : ${DELIVEREDCount}건 , 구매확정 : ${PURCHASE_CONFIRMEDCount}건</p>
							        <table class="table table-bordered table-hover">
							            <tbody>
							                <tr>
							                    <th>주문 번호</th>
							                    <th>이름</th>
							                    <th>주문 날짜</th>
							                    <th>결제금액(결제방법)</th>
							                    <th>주문 상태</th>
							                    <th></th>
							                </tr>
											<c:forEach var="map" items="${orderList}">
											    <tr>
											        <td>${map.order.orderNumber}</td>
											        <td>${map.memberName}</td>
											        <td>${map.OrderDatetime}</td>
											        <td>${map.formattedTotal }원, (${map.order.paymentMethod})</td>
											        <td>${map.statusDescription}</td>
											        <td><a href="javascript:void(0)" class="uren-btn uren-btn_dark uren-btn_sm"><span>자세히 보기</span></a></td>
											    </tr>
											</c:forEach>
							                <!-- 주문 내역 반복 -->
							            </tbody>
							        </table>
							    </div>
					        </div>
					        <!-- 주문 내역 조회 끝 -->
					        <!-- 상품 관리 시작 -->
					        <div class="tab-pane fade" id="account-product-management" role="tabpanel">
					            
					        </div>
					        <!-- 상품 등록 시작 -->
					        <div class="tab-pane fade" id="account-product-insert" role="tabpanel">
					            
					        </div>
					        <!-- 상품 삭제 시작 -->
					        <div class="tab-pane fade" id="account-product-delete" role="tabpanel">
					            
					        </div>
                            <!-- 상품 삭제 끝 -->
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
