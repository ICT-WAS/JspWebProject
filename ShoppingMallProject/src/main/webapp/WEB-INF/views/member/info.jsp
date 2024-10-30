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
	
	<!-- 스크립트 -->
</head>

<%! 
Member member ; 
List<Address> addressList;
%>
<% 
member = (Member)request.getAttribute("member"); 
addressList = (List<Address>)request.getAttribute("addressList"); 
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
                                        <p>Hello <b>${member.name }</b> </p>
                                        <p>안녕방구방구~</p>
                                        <p>네놈의 정보를 읊어주마~</p>
                                        <p>니 고유 키 : ${member.member_id }</p>
                                        <p>니 아이디 : ${member.id }</p>
                                        <p>니 이름 : ${member.name }</p>
                                        <p>니 닉네임 : ${member.nickname }</p>
                                        <p>니 비밀번호 ㅋㅋ : ${member.password }</p>
                                        <p>니 이메일 : ${member.email }</p>
                                        <p>니 폰번호 : ${member.phoneNumber }</p>
                                        <p>니 가입일 : ${member.createdAt }</p>
                                        <p>니 수정날짜 : ${member.updatedAt }</p>
                                        <p>니 마지막로그인 : ${member.lastLogin }</p>
                                        <p>니 상태 : ${member.status }</p>
                                        <p>니 생일 : ${member.birthday }</p>
                                        <p>니 포인트 : ${member.point }</p>
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
                                                    <tr>
                                                        <td><a class="account-order-id" href="javascript:void(0)">#5364</a></td>
                                                        <td>Mar 27, 2019</td>
                                                        <td>On Hold</td>
                                                        <td>£162.00 for 2 items</td>
                                                        <td><a href="javascript:void(0)" class="uren-btn uren-btn_dark uren-btn_sm"><span>View</span></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><a class="account-order-id" href="javascript:void(0)">#5356</a></td>
                                                        <td>Mar 27, 2019</td>
                                                        <td>On Hold</td>
                                                        <td>£162.00 for 2 items</td>
                                                        <td><a href="javascript:void(0)" class="uren-btn uren-btn_dark uren-btn_sm"><span>View</span></a>
                                                        </td>
                                                    </tr>
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
		                                    	<a href="javascript:void(0)" class="uren-btn uren-btn_dark uren-btn_sm"><span>추가하기</span></a>
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
									                        <td>${address.alias}</td>
									                        <td>${address.roadNameAddress}<br>${address.detailAddress}</td>
									                        <td>${address.recipientName}</td>
									                        <td>${address.phoneNumber}</td>
						 			                        <td><a href="javascript:void(0)" class="uren-btn uren-btn_dark uren-btn_sm"><span>수정</span></a></td>
									                        <td><a href="#" onclick="if(confirm('정말 삭제하시겠습니까?')) { window.location.href='/ShoppingMallProject/address/delete?addressId=${address.addressId}'; } return false;" class="uren-btn uren-btn_dark uren-btn_sm"><span>삭제</span></a></td>
									                    </tr>
									                </c:forEach>
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
