<%@page import="com.shopping.model.CartProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<!-- 
	background: #999999;
	color: #999999; -->
    <ui:css />
    <meta charset="UTF-8">
	
	<!-- 스크립트 -->
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
	
		.order-button-payment input {
	    background: #ffc400;
	    color: #ffffff;
	    font-size: 17px;
	    font-weight: 600;
	    height: 50px;
	    margin: 20px 0 0;
	    padding: 0;
	    width: 100%;
	    border: 1px solid transparent;
	    cursor: pointer;
	}
	
	input[type="number"], input[type="text"] {
	    background: #ffffff;
	    border: 1px solid #e5e5e5;
	    border-radius: 0;
	    height: 42px;
	    width: 100%;
	    padding: 0 0 0 10px;
		}
	
	 table {
            border-collapse: collapse; /* 테두리 겹침 방지 */
            width: 100%; /* 테이블 너비 조정 (선택 사항) */
        }
        th, td {
            border: none; /* 기본 테두리 제거 */
            padding: 8px; /* 셀 내부 여백 */s
        }
	
	</style>
	
	<!-- 적립금 blur 될 때, 사용 가능한 적립금액인지 확인 -->
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
        <div class="checkout-area">
            <div class="container-fluid">
            	<div class="container-xxl">
            		<div class="row">
                    <div class="col-6 col-lg-8">
                        <form action="javascript:void(0)">
                            <div class="checkbox-form">
                                <h3>주문서</h3>
                                <div class="row">
                                	<!-- 주문자 정보(이름, 휴대폰, 이메일) -->
                                	<div class="col-md-12 mt-3">
		                                주문자 정보<hr>
		                            </div>
                                	<div class="col-md-4">
		                                <label>주문자</label>
		                            </div>
		                            <div class="col-md-8">
		                                <label>이현지</label>
		                            </div>
		                            <div class="col-md-4">
		                                <label>휴대폰</label>
		                            </div>
		                            <div class="col-md-8">
		                                <label>010-0000-0000</label>
		                            </div>
		                            <div class="col-md-4">
		                                <label>이메일</label>
		                            </div>
		                            <div class="col-md-8">
		                                <label>padul1210@gmail.com</label>
		                            </div>
		                            
		                            
		                            <div class="col-md-12 mb-3">
		                            </div>
		                            <!-- 배송 정보(배송지, 배송 요청 사항) -->
		                            <div class="col-md-12 mt-3">
		                                배송 정보<hr>
		                            </div>
		                            <div class="col-md-4">
		                                <label>배송지</label>
		                            </div>
		                            <div class="col-md-8">
		                                <span class="badge rounded-pill bg-secondary">기본배송지</span><br>
		                                <label>경기 광명시 하안동 650 어쩌고 저쩌고</label>
		                            </div>
                                    <div class="col-md-12">
                                        <div class="country-select clearfix">
                                            <label>배송 요청 사항</label>
                                            <select class="myniceselect nice-select wide">
                                                <option value="none">배송 기사에게 전달되는 메시지 입니다. 선택해 주세요.</option>
                                                <option value="uk">부재 시 경비실에 맡겨주세요</option>
                                                <option value="rou">부재 시 문앞에 놓아주세요</option>
                                                <option value="fr">직접 받겠습니다</option>
                                                <option value="de">배송 전에 연락주세요</option>
                                                <option value="aus">직접 입력</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-md-12 mb-3">
		                            </div>
                                    <div class="col-md-12 mt-3">
		                                주문 상품 정보<hr>
		                                <!-- 주문 상품 정보 -->
		                                
		                                <table class="table">
		                                	<c:forEach var="cartItem" items="${cartItems}">
		                                		<tr>
		                                            <td><img class="img-thumbnail" src="static/template_assets/images/product/small-size/1.jpg" alt="Uren's Cart Thumbnail"></td>
		                                            <td class="uren-product-name"><a href="javascript:void(0)">${cartItem.name}</a></td>
		                                            <td class="uren-product-price"><span class="amount">${cartItem.price}</span></td>
		                                            <td class="quantity"><span class="amount">${cartItem.quantity}</span></td>
		                                            <td class="product-subtotal"><span class="amount">
		                                            <c:set var="total" value="${cartItem.price * cartItem.quantity}" />
		                                            ${total}
		                                            </span></td>
		                                        </tr>
		                                	</c:forEach>
                                    	<tr>
                                            <td><img class="img-thumbnail" src="static/template_assets/images/product/small-size/1.jpg" alt="Uren's Cart Thumbnail"></td>
                                            <td class="uren-product-name"><a href="javascript:void(0)">Juma rema pola</a></td>
                                            <td class="uren-product-price"><span class="amount">$46.80</span></td>
                                            <td class="quantity"><span class="amount">1</span></td>
                                            <td class="product-subtotal"><span class="amount">$46.80</span></td>
                                        </tr>
                                        	
                                        <tr>
                                            <td class="uren-product-thumbnail"><img class="img-thumbnail" src="static/template_assets/images/product/small-size/2.jpg" alt="Uren's Cart Thumbnail"></td>
                                            <td class="uren-product-name"><a href="javascript:void(0)">Bag Goodscol model</a></td>
                                            <td class="uren-product-price"><span class="amount">$71.80</span></td>
                                            <td class="quantity"><span class="amount">1</span></td>
                                            <td class="product-subtotal"><span class="amount">$71.80</span></td>
                                        </tr>
                                </table>
                                
				                    </div>
                                    
                                    <div class="col-md-12 mb-3">
		                            </div>
                                    <div class="col-md-12 mt-3">
		                                적립금<hr>
		                            </div>
	                    			<!-- 적립금 할인 적용 -->
	                    			<div class="col-md-4">
		                                <label>사용 적립금</label>
		                            </div>
		                            <div class="col-md-3">
		                                <div class="checkout-form-list">
                                            <input placeholder="" type="number">
                                        </div>
		                            </div>
		                            <div class="col-md-2">
		                            	<input type="submit" value="전액 사용" class="button">
		                            </div>
		                            <div class="col-md-3 mt-3">
		                                보유 적립금 : 0원
		                            </div>
	                    			
	                    			<div class="col-md-12 mb-3">
		                            </div>
				                    <!-- 결제 수단 선택 -->
				                    <div class="col-md-12 mt-3">
		                                결제 수단<hr>
		                            </div>
				                    
				                    <div class="col-md-12 mb-3">
		                            </div>
				                    <!-- 결제하기 버튼 -->
				                    <div class="col-md-12 mt-3">
		                                <div class="order-button-payment">
                                        <input value="${payment_total}원 결제하기" type="submit">
                                    </div>
		                            </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- 결제 정보 요약 -->
                    <div class="col-6 col-lg-4">
                    	<h3>결제 금액</h3>
                        <div class="your-order">
                            <div class="payment-method">
                                <div class="payment-accordion">
                                    <div id="accordion">
                                        <div class="card">
                                            <div class="card-header" id="#payment-1">
                                                주문 금액
                                            </div>
                                            <div class="card-header" id="#payment-1">
                                                할인 금액
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                                <div class="card-body">
                                                    <p>
                                                    └ 상품 할인 금액<br>
                                                    └ 적립금 할인 금액
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header" id="#payment-2">
                                            	<div class="row">
                                            		<div class="col-6 col-lg-8">
		                                                <h5 class="panel-title">
		                                                    최종 결제 금액
		                                                </h5>
	                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order-button-payment">
                                        <input value="${payment_total}원 결제하기" type="submit">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!-- 메인 컨텐츠 끝 -->
    	
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>