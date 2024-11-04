<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.shopping.model.Order"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="zxx">


<%
	Order orderData = (Order)request.getAttribute("orderData");

	DecimalFormat df = new DecimalFormat("#,###");

	//orderData 객체에서 가져옴
	int usedPoint = orderData.getUsedPoints();
	int totalPayment = orderData.getFinalPaymentAmount();
	int total = orderData.getTotalAmount();
	
	// 적립금할인금액 값 변경
	String formattedPoint = df.format(usedPoint);
	
	// 최종 결제 금액 변경
	String formattedTotal =  df.format(total);
	String formattedTotalPayment = df.format(totalPayment);
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String orderDate = orderData.getOrderDate().format(formatter);
%>

<head>
    <ui:css />
    <meta charset="UTF-8">
	<style>
		.button {
		    background: #ffffff;
		    display: block;
		    font-size: 14px;
		    font-weight: 600;
		    height: 40px;
		    margin: 0;
		    padding: 0;
		    width: 100%;
		    border: 1px solid transparent;
		    
		    border: 1px solid #ffc400;
		    cursor: pointer;
		}

		.button-fill {
		    background: #ffc400;
		    color: #ffffff;
		    display: block;
		    font-size: 14px;
		    font-weight: 600;
		    height: 40px;
		    margin: 0;
		    padding: 0;
		    width: 100%;
		    border: 1px solid transparent;
		    
		    border: 1px solid #ffc400;
		    cursor: pointer;
		}
		table {
	            border-collapse: collapse; /* 테두리 겹침 방지 */
	            width: 100%; /* 테이블 너비 조정 (선택 사항) */
	        }
	        th, td {
	            border: none; /* 기본 테두리 제거 */
	            padding: 8px; /* 셀 내부 여백 */s
	        }
	        
	        .img-thumbnail {
			    width: 60px; /* 원하는 너비 */
			    height: auto; /* 비율 유지 */
			}
			.right-align {
			    text-align: right;
			}
	</style>
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    
    	<!-- 메인 컨텐츠 -->
    	<div class="checkout-area">
            <div class="container-fluid">
            	<div class="container-xxl">
            		<div class="row">
            		<div class="col-6 col-lg-2"></div>
                    <div class="col-6 col-lg-8">
                        <form action="javascript:void(0)">
                            <div class="checkbox-form">
                                <h3>주문 완료</h3>
                                <div class="row">
                                	<div class="col-md-12">
                                	<h6><%=orderDate %></h6>
                                	<h6>주문이 완료되었습니다.</h6><br>
                                	주문번호 : ${orderData.orderNumber}
                                	</div>
                                	
                                	<div class="col-md-12 mt-3"></div>
		                            <!-- 결제 정보 -->
		                            <div class="col-md-12 mt-3">
		                                결제 정보<hr>
		                            </div>
                                	<div class="col-md-4">
                                		<h6>결제 금액</h6>
                                	</div>
                                	<div class="col-md-8 right-align">
                                		<h6>총 <%=formattedTotalPayment %>원</h6>
                                	</div>
                                	<div class="col-md-4">
                                		상품 금액
                                	</div>
                                	<div class="col-md-8 right-align">
                                		<%=formattedTotal %>원
                                	</div>
                                	<div class="col-md-4">
                                		적립금 할인
                                	</div>
                                	<div class="col-md-8 right-align">
                                		-<%=formattedPoint %>원
                                	</div>
                                	<div class="col-md-4 mt-3">
                                		결제수단명
                                	</div>
                                	<div class="col-md-8 right-align mt-3">
                                		테스트
                                	</div>
                                	<div class="col-md-4">
                                		적립 예정 금액
                                	</div>
                                	<div class="col-md-8 right-align">
                                		0원
                                	</div>
                                	
                                	
                                	<div class="col-md-12 mt-3"></div>
		                            <!-- 배송 정보(배송지, 배송 요청 사항) -->
		                            <div class="col-md-12 mt-3">
		                                배송 정보<hr>
		                            </div>
		                            <div class="col-md-4">
		                                <label>배송지</label>
		                            </div>
		                            <div class="col-md-8 right-align">
		                                <label>
		                                	${shippingData.recipientName}&nbsp;&middot;&nbsp;${shippingData.phoneNumber}<br>
		                                	(${shippingData.postalCode})&nbsp;${shippingData.roadNameAddress}&nbsp;${shippingData.detailAddress}
		                                </label>
		                            </div>
		                            <div class="col-md-4">
		                                <label>배송 요청 사항</label>
		                            </div>
                                    <div class="col-md-8 right-align">
		                                <label>${shippingData.message}</label>
		                            </div>
		                            
		                            <div class="col-md-12 mb-3">
		                            </div>
                                    <div class="col-md-12 mt-3">
		                                주문 상품 정보<hr>
		                                <!-- 주문 상품 정보 -->
		                                
		                                <table class="table">
		                                	<c:forEach var="cartItem" items="${cartItems}">
		                                		<tr>
		                                            <td><img class="img-thumbnail" src="${cartItem.image}" alt="${cartItem.name}"></td>
		                                            <td class="uren-product-name">
		                                            	<span class="amount">${cartItem.name}</span>
		                                            	<c:if test="${cartItem.optionId != null}">
			                                            	<p>${cartItem.optionName}
			                                            	<c:if test="${cartItem.optionPrice != 0}">
			                                            		(${cartItem.formattedOptionPrice})
			                                            	</c:if>
			                                            	</p>
		                                            	</c:if>
		                                            </td>
		                                            <td class="uren-product-price right-align"><span class="amount">${cartItem.formattedPrice}원</span></td>
		                                            <td class="quantity right-align"><span class="amount">x${cartItem.quantity}</span></td>
		                                            <td class="product-subtotal right-align"><span class="amount">${cartItem.formattedTotalPrice}원</span></td>
		                                        </tr>
		                                	</c:forEach>
                                		</table>
				                    </div>
		                            
		                            <div class="col-md-12 mt-3"></div>
		                            <div class="col-md-1"></div>
		                            <div class="col-md-5">
		                            	<input type="submit" value="주문 상세" class="button-fill">
		                            </div>
		                            <div class="col-md-5">
		                            	<input type="submit" value="주문 내역" class="button">
		                            </div>
		                            <div class="col-md-1"></div>
                                </div>
                             </div>
                         </form>
                     </div>
                   	<div class="col-6 col-lg2"></div>
                   </div>
               </div>
           </div>
       </div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>