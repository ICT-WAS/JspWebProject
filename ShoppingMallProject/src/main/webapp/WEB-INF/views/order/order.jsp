<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	
	<!-- 스크립트 -->
	
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
        <div class="checkout-area">
            <div class="container-fluid">
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
		                            
		                            <!-- 배송 정보(배송지, 배송 요청 사항) -->
		                            <div class="col-md-12 mt-3">
		                                배송 정보<hr>
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
                                    
                                    <!-- 주문 상품 정보 -->
                                    <div class="col-md-12 mt-3">
		                                주문 상품 정보<hr>
		                            </div>
                                    
                                    <!-- 적립금 할인 적용 -->
                                    <div class="col-md-12 mt-3">
		                                적립금<hr>
		                            </div>
	                    
				                    <!-- 결제 수단 선택 -->
				                    <div class="col-md-12 mt-3">
		                                결제 수단<hr>
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
                    <div class="col-6 col-lg-4">
                    <!-- 결제 정보 요약 -->
                        <div class="your-order">
                            <h3>결제 금액</h3>
                            
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
        <!-- 메인 컨텐츠 끝 -->
    	
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>