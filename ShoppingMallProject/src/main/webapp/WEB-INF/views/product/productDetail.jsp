<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
    	
    	<!-- Begin Uren's Single Product Area -->
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
                                	
                                	<c:choose>
                                		<c:when test="${not empty product.img1} || ${not empty product.img2} || ${not empty product.img3}">
                                			<c:forEach var="i" begin="1" end="5">
			                                	<c:if test="${not empty product['img'+i]}">
			                                		<div class="single-slide red zoom">
			                                			<img src="data:image/jpeg;base64,${product['img'+i]}" alt="${product.name}${i}" />
			                                		</div>
			                                	</c:if>     
			                                </c:forEach>                           				                                	                               
                                		</c:when>
                                		<c:otherwise>
                                			<div class="single-slide">
                                				<img src="${pageContext.request.contextPath}/static/template_assets/images/product/no-image.png" alt="이미지 없음" />
                                			</div>
                                		</c:otherwise>
                                	</c:choose>  	
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
                                		<c:when test="${not empty product.img1} || ${not empty product.img2} || ${not empty product.img3}">
                                			<c:forEach var="i" begin="1" end="5">
			                                	<c:if test="${not empty product['img'+i]}">
			                                		<div class="single-slide red">
			                                			<img src="data:image/jpeg;base64,${product['img'+i]}" alt="${product.name}${i}" />
			                                		</div>
			                                	</c:if>     
			                                </c:forEach>                           				                                	                               
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
                                    <h5><a href="#">${product.name}</a></h5>
                                </div>
                                <span class="reference">한 줄 추가 정보</span>
                                <div class="sp-essential_stuff">
                                    <ul>
                                        <li>브랜드: <a href="javascript:void(0)">${product.brand}</a></li>
                                        <li>재고 수량: <a href="javascript:void(0)">${product.quantity}</a></li>
                                        <li>상품 가격: <a href="javascript:void(0)">${product.price}원</a></li>
                                    </ul>
                                </div>
                                <c:if test="${not empty optionTree}" >
                                	<c:forEach var="entry" items="${optionTree}">
		                                <div class="product-size_box">
		                                    <span>${entry.key}</span>
		                                    <select name="${entry.key}Options" id="${entry.key}Options" class="myniceselect nice-select">
		                                    	<option value="옵션을 선택해주세요">옵션을 선택해주세요</option>
		                                    	<c:forEach var="option" items="${entry.value}">
		                                        <option value="${option}">${option}</option>
		                                        </c:forEach>
		                                    </select>
		                                </div>
	                                </c:forEach>
                                </c:if>
                                <div class="quantity">
                                    <label>Quantity</label>
                                    <div class="cart-plus-minus">
                                        <input class="cart-plus-minus-box" value="1" type="text">
                                        <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                        <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                    </div>
                                </div>
                                <div class="qty-btn_area">
                                    <ul>
                                        <li><a class="qty-cart_btn" href="cart.html">Add To Cart</a></li>
                                        <li><a class="qty-wishlist_btn" href="wishlist.html" data-toggle="tooltip" title="Add To Wishlist"><i class="ion-android-favorite-outline"></i></a>
                                        </li>
                                        <li><a class="qty-compare_btn" href="compare.html" data-toggle="tooltip" title="Compare This Product"><i class="ion-ios-shuffle-strong"></i></a></li>
                                    </ul>
                                </div>
                                <div class="uren-social_link">
                                    <ul>
                                        <li class="facebook">
                                            <a href="https://www.facebook.com/" data-toggle="tooltip" target="_blank" title="Facebook">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="twitter">
                                            <a href="https://twitter.com/" data-toggle="tooltip" target="_blank" title="Twitter">
                                                <i class="fab fa-twitter-square"></i>
                                            </a>
                                        </li>
                                        <li class="youtube">
                                            <a href="https://www.youtube.com/" data-toggle="tooltip" target="_blank" title="Youtube">
                                                <i class="fab fa-youtube"></i>
                                            </a>
                                        </li>
                                        <li class="google-plus">
                                            <a href="https://www.plus.google.com/discover" data-toggle="tooltip" target="_blank" title="Google Plus">
                                                <i class="fab fa-google-plus"></i>
                                            </a>
                                        </li>
                                        <li class="instagram">
                                            <a href="https://rss.com/" data-toggle="tooltip" target="_blank" title="Instagram">
                                                <i class="fab fa-instagram"></i>
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
        <!-- Uren's Single Product Area End Here -->

        <!-- Begin Uren's Single Product Tab Area -->
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
    </div>
    
	<ui:footer />
	<ui:js />
</body>
</html>