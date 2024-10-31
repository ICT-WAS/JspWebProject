<%@page import="com.shopping.model.Member"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.enums.DeliveryRequest" %>
<%@page import="com.shopping.model.CartProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Integer total = 0;
	
	List<CartProductDto> cartItems = (List<CartProductDto>)request.getAttribute("cartItems");
	
	for(CartProductDto cartItem : cartItems) {
		total += cartItem.getTotal();
	}
	
	DecimalFormat df = new DecimalFormat("#,###");
	String payment_total = df.format(total);
	
	Long point = (Long)((Member)request.getAttribute("member")).getPoint();
%>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<!-- 
	background: #999999;
	color: #999999; -->
    <ui:css />
    <meta charset="UTF-8">
	
	<!-- 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
    $(document).ready(function() {
    	
    	$('#customMessage').hide();
    	
    	setFormattedPhoneNumber();
    	
    	const input = $('#point');
	    const useAllPoint = $('#use-all-point');
	    
	    var memberPoint = Number("<%=point%>");
	    $('#memberPoint').text('보유 적립금 : ' + getFormattedPrice(memberPoint) + '원');

	    // 사용 적립금 필드 변경시 이벤트 바인딩
	    input.on('change', function(e) {
	    	var point = Number(input.val()) || 0;
	    	
	    	// 적립금 1원 단위로 사용 시도
	    	if (point % 10 != 0) {
	    		$('.modal-body').text('적립금은 10원 단위로만 사용 가능합니다.');
	    		$('#myModal').modal('show');
	            point = point - point % 10;
	        }
	    	
	    	setFormattedPrice(point);
	    });
	    
	 	// 전액 사용 버튼 클릭 이벤트 바인딩
	    useAllPoint.on('click', function(e) {
	    	var usedPoints = memberPoint - memberPoint % 10;
	    	setFormattedPrice(usedPoints);
	    });
	    
	    // 결제하기 버튼 클릭시 이벤트 바인딩
	    $('.process-payment').on('click', function(e) {
	    	$('#total-hidden').val("<%=total %>");
	    	$('#usedPoint-hidden').val(parseFormattedPrice($('#used-point').text()));
	    	$('#totalAmount-hidden').val(parseFormattedPrice($('#total-payment').text()));
	    });
	    
	    // 배송메시지 
	    $('#deliveryRequest').change(function() {
	    	console.log($(this).val() );
	        if ($(this).val() === 'aus') { // '직접 입력' 옵션 선택 시
	            $('#customMessage').show(); // 입력 필드 보여주기
	        } else {
	            $('#customMessage').hide(); // 입력 필드 숨기기
	        }
	    });
    });
    
    // 적립금 사용시 금액 관련 필드의 통화 형식을 #,### 로 업데이트
	function setFormattedPrice(point) {
		var total = Number("<%=total%>");
		var memberPoint = Number("<%=point%>");
		
		// 최대 사용 적립금 clamp
    	var maxPoint = Math.min(memberPoint, total);
		
    	point = Math.min(maxPoint, point);
		
		// 적립금할인금액, 할인금액, 적립금 input 태그 값 변경
    	var formattedPoint = getFormattedPrice(point);
    	$('#point').val(formattedPoint);
    	$('#used-point').text(formattedPoint + `원`);
    	$('#discounted-total').text('-' + formattedPoint + `원`);
    	
    	// 최종 결제 금액 변경
    	var total_payment = total - point;
    	var formattedTotal = getFormattedPrice(total_payment);
    	
    	$('#total-payment').text(formattedTotal + '원');
    	$('.total-payment-button').val(formattedTotal + '원 결제하기');
	}
	 
    // 한국 통화 형태로 숫자->문자 변환
    function getFormattedPrice(value) {
    	return new Intl.NumberFormat('ko-KR').format(value);
    }
    
    function parseFormattedPrice(formattedPrice) {
    	return parseInt(formattedPrice.replace(',', ''));
    }
    
    function setFormattedPhoneNumber() {
    	// 주문자 폰 번호 형식 변경
    	$('.member-phoneNumber').text(getFormattedPhoneNumber($('.member-phoneNumber').text()));
    	
    	// 배송 수령자 폰 번호 형식 변경
    	$('.selected-phoneNumber').text(getFormattedPhoneNumber($('.selected-phoneNumber').text()));
    	
    	// 배송지 목록에서 폰 번호 형식 변경
    	$('.phoneNumber').each(function() {
            const rawPhoneNumber = $(this).text(); // 원래 전화번호 가져오기
            const formattedPhoneNumber = getFormattedPhoneNumber(rawPhoneNumber); // 형식 변환
            $(this).text(formattedPhoneNumber); // 형식이 변경된 전화번호로 업데이트
        });
    }
    
    // 배송지 목록 행 클릭시 호출
    function setShipping(recipientName, phoneNumber, postalCode, roadNameAddress, detailAddress, isDefault) {
    	$('.recipient-name').text(recipientName);
    	$('.postal-code').text('(' + postalCode + ')');
    	$('.road-name-address').text(roadNameAddress);
    	$('.detail-address').text(detailAddress);
    	$('.selected-phoneNumber').text(getFormattedPhoneNumber(phoneNumber));
    	
    	$('.recipient-name').val(recipientName);
    	$('.phone-number').val(phoneNumber);
    	$('.postal-code').val(postalCode);
    	$('.road-name-address').val(roadNameAddress);
    	$('.detail-address').val(detailAddress);
    	
    	// 기본 배송지 뱃지
    	if(isDefault == 1) {
    		$('#default-address-badge').show();
    	} else {
    		$('#default-address-badge').hide();
    	}
    	
    	$('.close').trigger('click');
	}
    
    // 폰 번호 형식을 000-0000-0000 으로 변환
    function getFormattedPhoneNumber(phoneNumber) {
    	return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }
    
    </script>
	
	
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
		
		.point-input {
		    background: #ffffff;
		    border: 1px solid #e5e5e5;
		    border-radius: 0;
		    height: 42px;
		    width: 100%;
		    padding: 0 0 0 10px;
			}
			
			#customInput {
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
	        
	        .img-thumbnail {
			    width: 60px; /* 원하는 너비 */
			    height: auto; /* 비율 유지 */
			}
			.right-align {
			    text-align: right;
			}
			
			.discount-price {
			    color: #999999;
			    font-size: 14px;
			}
			
			.order-rightside {
			    position: -webkit-sticky; /* Safari 지원 */
			    position: sticky;
			    top: 120px; /* 상단에서 얼마나 떨어진 위치에 고정할지 설정 */
			    z-index: 10; /* 다른 요소 위에 표시되도록 설정 */
			}
			
			.change-shipping-button {
		    background: #ffffff;
		    display: block;
		    font-size: 11px;
		    font-weight: 600;
		    height: 30px;
		    margin: 0;
		    padding: 0;
		    width: 40%;
		    border: 1px solid transparent;
		    
		    border: 1px solid #999999;
		    cursor: pointer;
		    float: right;
		}
		
		td.member-address-list:hover {
            background-color: #f0f0f0;
            cursor: pointer;
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
            	<form method="post">
            		<div class="row">
                    <div class="col-6 col-lg-8">
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
		                                <label>${member.name}</label>
		                            </div>
		                            <div class="col-md-4">
		                                <label>휴대폰</label>
		                            </div>
		                            <div class="col-md-8">
		                                <label class="phoneNumber member-phoneNumber">${member.phoneNumber}</label>
		                            </div>
		                            <div class="col-md-4">
		                                <label>이메일</label>
		                            </div>
		                            <div class="col-md-8">
		                                <label>${member.email}</label>
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
		                            <div class="col-md-4">
		                            	<span class="badge rounded-pill bg-secondary" id="default-address-badge">기본배송지</span><br>
		                            </div>
		                            <div class="col-md-4">
		                            	<input type="button" value="배송지 목록" class="change-shipping-button" id="change-shipping" data-toggle="modal" data-target="#addressModal">
		                            </div>
		                            <div class="col-md-4"></div>
		                            <div class="col-md-8">
		                                <label>
		                                	<span class="recipient-name">${shipping.recipientName}</span>&nbsp;&middot;&nbsp;
										    <span class="phone-number selected-phoneNumber">${shipping.phoneNumber}</span><br>
										    <span class="postal-code">(${shipping.postalCode})</span>&nbsp;
										    <span class="road-name-address">${shipping.roadNameAddress}</span>&nbsp;
										    <span class="detail-address">${shipping.detailAddress}</span>
		                                </label>
		                                <input type="hidden" value="${shipping.recipientName}" name="recipient-name" class="recipient-name"/>
		                                <input type="hidden" value="${shipping.phoneNumber}" name="phone-number" class="phone-number"/>
		                                <input type="hidden" value="${shipping.postalCode}" name="postal-code" class="postal-code"/>
		                                <input type="hidden" value="${shipping.roadNameAddress}" name="road-name-address" class="road-name-address"/>
		                            	<input type="hidden" value="${shipping.detailAddress}" name="detail-address" class="detail-address"/>
		                            </div>
                                    <div class="col-md-12">
                                        <div class="country-select clearfix" id="selectMessage">
                                            <label>배송 요청 사항</label>
                                            <select name="message" class="myniceselect nice-select wide" id="deliveryRequest">
                                                <option value="">배송 기사에게 전달되는 메시지 입니다. 선택해 주세요.</option>
                                                <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                                                <option value="부재 시 문앞에 놓아주세요">부재 시 문앞에 놓아주세요</option>
                                                <option value="직접 받겠습니다">직접 받겠습니다</option>
                                                <option value="배송 전에 연락주세요">배송 전에 연락주세요</option>
                                                <option value="aus">직접 입력</option>
                                            </select>
                                        </div>
                                        <div id="customMessage">
										    <input type="text" id="customInput" placeholder="요청 사항을 입력하세요" name="customMessage"/>
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
		                                            <td><img class="img-thumbnail" src="${pageContext.request.contextPath}/static/template_assets/images/product/small-size/1.jpg" alt="Uren's Cart Thumbnail"></td>
		                                            <td class="uren-product-name">
		                                            	<span class="amount">${cartItem.name}</span>
		                                            	<p>옵션이름</p>
		                                            </td>
		                                            <td class="uren-product-price right-align"><span class="amount">${cartItem.formattedPrice}원</span></td>
		                                            <td class="quantity right-align"><span class="amount">x${cartItem.quantity}</span></td>
		                                            <td class="product-subtotal right-align"><span class="amount">${cartItem.formattedTotal}원</span></td>
		                                        </tr>
		                                	</c:forEach>
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
                                            <input id="point" type="text" class="point-input" value="0">
                                        </div>
		                            </div>
		                            <div class="col-md-2">
		                            	<input type="button" value="전액 사용" class="button" id="use-all-point">
		                            </div>
		                            <div class="col-md-3 mt-3" id="memberPoint">
		                                보유 적립금 : ${member.point}원
		                            </div>
	                    			
	                    			<div class="col-md-12 mb-3">
		                            </div>
		                            
				                    <!-- 결제 수단 선택 -->
				                    
				                    <div class="col-md-12 mt-3">
		                                결제 수단<hr>
		                            </div>
		                            
		                            
		                            <div class="col-md-12 mb-3">
		                            </div>
				                    <!-- 개인정보 및 결제 동의 -->
				                    <div class="col-md-12 mt-3">
		                                개인정보 및 결제 동의<hr>
		                            </div>
		                            <div class="col-md-12">
		                                개인정보 수집∙이용 및 처리 동의<br>
		                                위 내용을 확인 하였으며 결제에 동의합니다.
		                            </div>
				                    
				                    <div class="col-md-12 mb-3">
		                            </div>
				                    <!-- 결제하기 버튼 -->
				                    <div class="col-md-12 mt-3">
		                                <div class="order-button-payment">
                                        <input class="total-payment-button process-payment" value="<%=payment_total%>원 결제하기" type="submit">
                                    </div>
		                            </div>
                                </div>
                            </div>
                    </div>
                    
                    
                    <!-- 결제 정보 요약 -->
                    <div class="col-6 col-lg-4">
                    	<div class="order-rightside">
                    	<h3>결제 금액</h3>
                        <div class="your-order">
                            <div class="payment-method">
                                <div class="payment-accordion">
                                    <div id="accordion">
                                        <div class="card">
	                                            <div class="card-header" id="#payment-1">
	                                            	<div class="row">
		                                            	<div class="col-md-6">
		                                                	주문 금액
		                                                </div>
		                                                <div class="col-md-6 right-align">
		                                                	<%=payment_total %>원
		                                                </div>
		                                                <input type="hidden" name="total" id="total-hidden">
		                                            </div>
	                                            </div>
	                                            <div class="card-header" id="#payment-1">
	                                                <div class="row">
		                                            	<div class="col-md-6">
		                                                	할인 금액
		                                                </div>
		                                                <div class="col-md-6 right-align" id="discounted-total">
		                                                	-0원
		                                                </div>
		                                            </div>
	                                            </div>
	                                            <div id="collapseOne" class="collapse show" data-parent="#accordion">
	                                                <div class="card-body">
	                                                	<div class="row">
			                                            	<div class="col-md-6 discount-price">
			                                                	└ 상품 할인 금액
			                                                </div>
			                                                <div class="col-md-6 discount-price right-align">
			                                                	0원
			                                                </div>
			                                            	<div class="col-md-6 discount-price">
			                                                	└ 적립금 할인 금액
			                                                </div>
			                                                <div class="col-md-6 discount-price right-align" id="used-point">
			                                                	0원
			                                                </div>
			                                                <input type="hidden" name="usedPoint" id="usedPoint-hidden">
			                                            </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        
	                                        
	                                        
	                                        <div class="col-6 col-lg-12 mt-3"></div>
	                                        <div class="card">
	                                            <div class="card-header" id="#payment-2">
	                                            	<div class="row">
	                                            		<div class="col-6 col-lg-6">
			                                                <h5 class="panel-title">
			                                                    최종 결제 금액
			                                                </h5>
		                                                </div>
		                                                <div class="col-6 col-lg-6 right-align">
			                                                <h5 class="panel-title" id="total-payment">
			                                                    <%=payment_total%>원
			                                                </h5>
			                                                <input type="hidden" name="totalAmount" id="totalAmount-hidden">
		                                                </div>
		                                            </div>
	                                            </div>
	                                        </div>
                                    </div>
                                    <div class="order-button-payment">
                                        <input class="total-payment-button process-payment" value="<%=payment_total%>원 결제하기" type="submit">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </form>
                </div>
            </div>
        </div>
        <!-- 메인 컨텐츠 끝 -->
        
    	<!-- 적립금 1원 단위 사용 경고 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="myModalLabel">적립금 사용 실패</h5>
		            </div>
		            <div class="modal-body">
		                유효하지 않은 값을 입력하셨습니다.
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 배송지 목록 모달 -->
		<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">배송지 목록</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
					</div>
					<div class="modal-body">
						<table class="table">
							<c:forEach var="memberAddr" items="${memberAddrs}">
								<tr >
									<td class="uren-product-name member-address-list" onclick="setShipping('${memberAddr.recipientName}', '${memberAddr.phoneNumber}', '${memberAddr.postalCode}', '${memberAddr.roadNameAddress}', '${memberAddr.detailAddress}', '${memberAddr.isDefault}')">
									<span class="amount">
									
									<b>${memberAddr.alias}</b>
									<c:if test="${memberAddr.isDefault == 1}">
										<span class="badge rounded-pill bg-secondary">기본배송지</span>
									</c:if>
										<br>${memberAddr.recipientName}&nbsp;&middot;&nbsp;<span class="phoneNumber">${memberAddr.phoneNumber}</span><br>
		                                	(${memberAddr.postalCode})&nbsp;${memberAddr.roadNameAddress}&nbsp;${memberAddr.detailAddress}
									</span></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	<ui:footer />
	<ui:js />
</body>
</html>