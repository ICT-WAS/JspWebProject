<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<!doctype html>	
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	
<!-- 스크립트 -->
<style type="text/css">
#enter-space {
	padding: 15px 0px 0px 0px !important;
}
</style>
	
</head>

<body class="template-color-1">
	<ui:header />
	<% String msg = request.getParameter("msg"); %>
	<% if (msg != null) { %>
	    <div class="alert alert-info"><%= msg %></div>
	<% } %>
	<!-- 메인 컨텐츠 시작 -->
    <div class="main-wrapper">
    
    	<!-- 상품 메인 시작 -->
        <div class="sp-area">
            <div class="container-fluid">
                <div class="sp-nav">
                    <div class="row">
                    
                    	<!-- 상품 상세 이미지 -->
                        <div class="col-lg-4">
                            <div class="sp-img_area">
                            	<!-- 상품 줌 이미지 -->
                                <div class="sp-img_slider slick-img-slider uren-slick-slider" data-slick-options='{
                                "slidesToShow": 1,
                                "arrows": false,
                                "fade": true,
                                "draggable": false,
                                "swipe": false,
                                "asNavFor": ".sp-img_slider-nav"
                                }'>
									<div class="single-slide">
										<c:choose>
											<c:when test="${not empty productDTO.product.img1}">
												<img src="${productDTO.product.img1 }" />
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/static/template_assets/images/product/no-image.png"
													alt="이미지 없음" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>
                            
                                <!-- 상품 상세 이미지 -->
                                <div class="sp-img_slider-nav slick-slider-nav uren-slick-slider slider-navigation_style-3" data-slick-options='{
                                "slidesToShow": 3,
                                "asNavFor": ".sp-img_slider",
                                "focusOnSelect": true,
                                "arrows" : true,
                                "spaceBetween": 30
                                }' data-slick-responsive='[
                                        {"breakpoint":1501, "settings": {"slidesToShow": 3}},
                                        {"breakpoint":992, "settings": {"slidesToShow": 4}},
                                        {"breakpoint":768, "settings": {"slidesToShow": 3}},
                                        {"breakpoint":575, "settings": {"slidesToShow": 2}}
                                    ]'>
                                    <c:choose>
                                		<c:when test="${not empty productDTO.product.img1}">
											<c:if test="${not empty productDTO.product.img1}">
												<div class="single-slide red">
													<img
														src="${productDTO.product.img1}"
														alt="${product.name}" />
												</div>
											</c:if>
											<c:if test="${not empty productDTO.product.img2}">
												<div class="single-slide red">
													<img
														src="${productDTO.product.img2}"
														alt="${product.name}" />
												</div>
											</c:if>
											<c:if test="${not empty productDTO.product.img3}">
												<div class="single-slide red">
													<img
														src="${productDTO.product.img3}"
														alt="${product.name}" />
												</div>
											</c:if>
										</c:when>
                                		<c:otherwise>
                                			<div class="single-slide red">
                                				<img src="${pageContext.request.contextPath}/static/template_assets/images/product/no-image.png" alt="이미지 없음" />
                                			</div>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 상품 상세 텍스트 -->
                        <div class="col-lg-8">
                            <div class="sp-content">
                            <c:set var="product" value="${productDTO.product}" />
                            
                                <div class="sp-heading">
                                    <h5>
                                    	<a href="#">${product.name}</a>
                                    </h5>
                                </div>
                                
                                <div class="sp-essential_stuff">
                                    <ul>
                                        <li>브랜드: <a>${product.brand}</a></li>
										<li>상품 가격: <a id="product-price">${product.price}</a></li>
                                    </ul>
                                </div>
                                
                               <c:if test="${not empty optionTree}">
									<c:forEach var="entry" items="${optionTree}">
										<div class="product-size_box">
											<span>${entry.key}</span> 
											<select name="${entry.key}Options" id="${entry.key}Options" class="myniceselect nice-select" onChange="show(); updateOptionTotalAmount();">
												<option value="옵션을 선택해주세요" disabled selected>옵션을 선택해주세요</option>
												<c:forEach var="optionMap" items="${entry.value}">
													<c:set var="optionDetails" value="${optionMap.value}" />
													<option class="stock-quantity"
														value="option-${optionDetails.optionId}"
														data-stockQuantity="${optionDetails.optionName} (재고: ${optionDetails.optionStockquantity}"
														data-additionalPrice="${optionDetails.additionalPrice}">
														${optionDetails.optionName} 
														<c:if test="${not empty optionDetails.additionalPrice && optionDetails.additionalPrice != 0}">
															(옵션 추가금: <fmt:formatNumber value='${optionDetails.additionalPrice}' type='number' />)
														</c:if>
														(재고: <fmt:formatNumber value='${optionDetails.optionStockquantity}' type='number' />)
													</option>
												</c:forEach>
											</select>
										</div>
									</c:forEach>
								</c:if>
				
                                <div class="quantity" style="display:none;">
									<label>수량</label>
									<div class="cart-plus-minus">
										<input  id="input-quantity" class="cart-plus-minus-box" value="1" type="text" readonly>
										<div class="dec qtybutton">
											<i class="fa fa-angle-down"></i>
										</div>
										<div class="inc qtybutton">
											<i class="fa fa-angle-up"></i>
										</div>
									</div>
								</div>
								
								<div id="enter-space"></div>
								
								<div class="sp-heading">
									<h5>상품 금액</h5>
								</div>
								<div class="sp-essential_stuff">
									<ul>
										<li>
											<div class="sp-heading">
												<h5>
													<a id="total-amount">${product.price}</a>
												</h5>
											</div>
										</li>
									</ul>
								</div>
								
                                <div class="qty-btn_area">
									<ul>
										<li><a class="qty-order_btn" href="cart.html">바로 구매</a></li>
										<li><a class="qty-cart_btn" href="javascript:void(0)" onclick="addToCart(${product.productId})">카트 담기</a></li>
										<li><a class="qty-wishlist_btn" href="wishlist.html"
											data-toggle="tooltip" title="Add To Wishlist">
												<i class="ion-android-favorite-outline"></i>
											</a>
										</li>
									</ul>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 상품 메인 끝 -->

        <!-- 상품 상세 시작 -->
        <div class="sp-product-tab_area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sp-product-tab_nav">
                            <div class="product-tab">
                                <ul class="nav product-menu">
                                    <li><a class="active" data-toggle="tab" href="#description"><span>상품설명</span></a></li>
                                    <li><a data-toggle="tab" href="#specification"><span>상세정보</span></a></li>
                                    <li><a data-toggle="tab" href="#reviews"><span>리뷰(수정필요)</span></a></li>
                                </ul>
                            </div>
                            <div class="tab-content uren-tab_content">
                                <div id="description" class="tab-pane active show" role="tabpanel">
                                    <div class="product-description">
                                        <ul>
                                            <li>
                                                <strong>상품설명</strong>
                                                <span>${product.description}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="specification" class="tab-pane" role="tabpanel">
                                    <table class="table table-bordered specification-inner_stuff">
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><strong>Memory</strong></td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <td>test 1</td>
                                                <td>8gb</td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><strong>Processor</strong></td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <td>No. of Cores</td>
                                                <td>1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="reviews" class="tab-pane" role="tabpanel">
                                    <div class="tab-pane active" id="tab-review">
                                        <form class="form-horizontal" id="form-review">
                                            <div id="review">
                                                <table class="table table-striped table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 50%;"><strong>Customer</strong></td>
                                                            <td class="text-right">15/09/20</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <p>Good product! Thank you very much</p>
                                                                <div class="rating-box">
                                                                    <ul>
                                                                        <li><i class="ion-android-star"></i></li>
                                                                        <li><i class="ion-android-star"></i></li>
                                                                        <li><i class="ion-android-star"></i></li>
                                                                        <li><i class="ion-android-star"></i></li>
                                                                        <li><i class="ion-android-star"></i></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <h2>Write a review</h2>
                                            <div class="form-group required">
                                                <div class="col-sm-12 p-0">
                                                    <label>Your Email <span class="required">*</span></label>
                                                    <input class="review-input" type="email" name="con_email" id="con_email" required>
                                                </div>
                                            </div>
                                            <div class="form-group required second-child">
                                                <div class="col-sm-12 p-0">
                                                    <label class="control-label">Share your opinion</label>
                                                    <textarea class="review-textarea" name="con_message" id="con_message"></textarea>
                                                    <div class="help-block"><span class="text-danger">Note:</span> HTML is not
                                                        translated!</div>
                                                </div>
                                            </div>
                                            <div class="form-group last-child required">
                                                <div class="col-sm-12 p-0">
                                                    <div class="your-opinion">
                                                        <label>Your Rating</label>
                                                        <span>
                                                    <select class="star-rating">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </span>
                                                    </div>
                                                </div>
                                                <div class="uren-btn-ps_right">
                                                    <button class="uren-btn-2">Continue</button>
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
        <!-- 상품 상세 끝 -->
    </div>
    <!-- 메인 컨텐츠 끝 -->
    
    <!-- 모달 영역 시작 -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">경고: 잘못된 수량</h5>
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
	<!-- 모달 영역 끝 -->
	
	
    
	<ui:footer />
	<ui:js />

<!-- 스크립트 시작 -->	
<script>
//옵션이 있는 품목은 옵션 선택 시 수량 콤보박스 보이기
function show(){
	const select = document.querySelector('.myniceselect.nice-select');
	
	if (select){
		const selectedValue = select.value; 

		if (selectedValue !== "옵션을 선택해주세요") {
			$(".quantity").show();
			$(".cart-plus-minus-box").val(1);		
		} else {
			$(".quantity").hide();		
			$(".cart-plus-minus-box").val(1);	
		}
	} else {
		$(".quantity").show();
		$(".cart-plus-minus-box").val(1);
	}
	
	updateTotalAmount();

}
	
//초기 화면 수량 및 가격 포매팅
function updateTotalAmount() {
	const quantity = parseInt($('.cart-plus-minus-box').val(), 10);
	const price = parseFloat(${product.price});
	
	//'금액'을 원화 표시
	const formatCurrency = (value) => {
		return new Intl.NumberFormat('ko-KR', {
            style: 'currency', 
            currency: 'KRW', 
            minimumFractionDigits: 0, 
            maximumFractionDigits: 0
        }).format(value);
	};
	
	//포맷된 상품 가격
	const formattedPrice = formatCurrency(price);

	const stockQuantity = parseFloat(${optionDetails.optionStockquantity});
	//재고 등 '수량'을 정수 표시
	const formatQuantity = (value) => {
		return new Intl.NumberFormat('ko-KR', {
            style: 'decimal', // 일반 숫자 형식
            minimumFractionDigits: 0, 
            maximumFractionDigits: 0
        }).format(value);
	}
			
	//포맷된 재고 수량
	const formattedStockQuantity = formatQuantity(stockQuantity);
	
	//총 금액 원화로 포맷팅
	const totalPrice = price * quantity;
	const formattedTotalPrice = formatCurrency(totalPrice);

	//포맷된 숫자 형식을 업데이트
	$('#product-price').text(formattedPrice);
	$('.stock-quantity').text(formattedStockQuantity);
	$('#total-amount').text(formattedTotalPrice);
			
}




//옵션 클릭 시 추가금 포함한 금액 나타내기
function updateOptionTotalAmount(){
	
	const select = document.querySelector('.myniceselect.nice-select');

	const selectedOption = select.options[select.selectedIndex];
	const selectedAdditionalPrice = parseFloat(selectedOption.getAttribute('data-additionalPrice'));

	const quantity = parseInt($('.cart-plus-minus-box').val(), 10);
	
	const price = parseFloat(${product.price});
	
	var totalPrice = null;
	
	if(selectedAdditionalPrice !== 0){
		totalPrice = (price + selectedAdditionalPrice) * quantity;
		updateTotal(totalPrice);
	} else {
		totalPrice = price * quantity;
		updateTotal(totalPrice);
	}
	
}

//총 가격 포매팅 함수
function updateTotal(amount){

	//'금액'을 원화 표시
	const formatCurrency = (value) => {
		return new Intl.NumberFormat('ko-KR', {
            style: 'currency', 
            currency: 'KRW', 
            minimumFractionDigits: 0, 
            maximumFractionDigits: 0
        }).format(value);
	};
	
	const formattedTotalPrice = formatCurrency(amount);
	$('#total-amount').text(formattedTotalPrice);
}


//총 상품 금액이 해당 버튼을 클릭할 때마다 동적으로 변경됨
function checkStockQuantity() {
	const qtyInputs = document.querySelectorAll('.cart-plus-minus');
	qtyInputs.forEach(qtyInput => {
		
		//수량 변경 버튼이 클릭될 시
		qtyInput.addEventListener('click', function(){
			
			const select = document.querySelector('.myniceselect.nice-select');
			
			//옵션 창이 있는 경우
			if(select){
				const selectedOption = select.options[select.selectedIndex];
				const selectedQuantity = selectedOption.getAttribute('data-stockQuantity');
			
				const stockQauntity = parseFloat(selectedQuantity.split(' (재고: ')[1].trim());
				
				const quantity = parseInt($('.cart-plus-minus-box').val(), 10);				
				
				//고객이 선택한 옵션의 재고가 null이 아닐 경우
				if(selectedQuantity !== null){
					//고객이 선택한 수량(quantity)이 실제 옵션의 재고(stockQauntity) 초과 시 실행되는 로직 
					//모달 처리 및 수량은 총 재고 수량(stockQauntity)으로 변경
					if(quantity > stockQauntity){
						$('.modal-body').text('주문 수량은 해당 상품의 재고 수량(' + stockQauntity + ')을(를) 초과할 수 없습니다.');
			    		$('#myModal').modal('show');
						$('.cart-plus-minus-box').val(stockQauntity);
					}
				
				//고객이 선택한 옵션의 재고가 null일 경우
				} else {
					$('.modal-body').text('해당 상품의 재고가 없습니다.');
		    		$('#myModal').modal('show');
				}
			
			//옵션이 없는 상품일 경우
			} else {
				const quantity = parseInt($('.cart-plus-minus-box').val(), 10);
				if (quantity>${product.quantity}){
					$('.modal-body').text('주문 수량은 해당 상품의 재고 수량(' + ${product.quantity} + ')을(를) 초과할 수 없습니다.');
		    		$('#myModal').modal('show');
					$('.cart-plus-minus-box').val(${product.quantity});
				}
			}
			
			updateOptionTotalAmount();
		
		});
	})
	
	
}


//페이지 로드 시 실행될 공간
$(document).ready(function(){	
	//초기 토탈 금액 상태 설정
	updateTotalAmount();

	//수량 변경 이벤트 발생 시 validation 체크
	checkStockQuantity();
	
	//옵션이 없는 상품의 경우 수량 선택 박스 표시
	show();
	
	//초기 금액 포매팅
	updateTotalAmount();
	
});
	
	
function addToCart(productId) {
	var data = $('div.myniceselect > ul > li.option.selected').data('value');
	
	var quantity = $('#input-quantity').val();
	console.log(data);
	var optionId = null;
	if(data){
		optionId = data.split('-')[1];
	}
	// GET 방식으로 쿼리 스트링을 만들어서 이동
    var url = '/ShoppingMallProject/addtocart?productId=' + productId + 
    		  '&quantity=' + quantity +
              '&optionId=' + optionId;
    
    // 페이지 이동
    window.location.href = url;  // 지정한 URL로 GET 요청을 보내면서 페이지 이동
    
}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 스크립트 끝 -->	

</body>
</html>