<%@page import="java.text.DecimalFormat"%>
<%@page import="com.shopping.model.CartProductDto"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<%!  
List<CartProductDto> cartProducts;
%>

<%
cartProducts = (List<CartProductDto>) request.getAttribute("cartProducts");

%>
<head>
    <ui:css />
    <meta charset="UTF-8">
	<style>
		.thumbnail{
		width:200px;
		height:200px;
		}
	</style>
	<!-- 스크립트 -->
	
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="uren-cart-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form action="javascript:void(0)">
                            <div class="table-content table-responsive">
                                <table class="table">
    <thead>
        <tr>
            <th class="uren-product-remove">선택</th>
            <th class="uren-product-thumbnail">사진</th>
            <th class="cart-product-name">상품명</th>
            <th class="cart-product-option">옵션</th>
            <th class="uren-product-quantity">수량</th>
            <th class="uren-product-subtotal">가격</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${cartProducts}">
            <tr class="${product.cartProductId} product-row">
                <td class="uren-product-check"><input type="checkbox" checked="checked" value="${product.cartProductId}"></td>
                <td class="uren-product-thumbnail thumbnail"><img src="${product.image}" alt="Uren's Cart Thumbnail"></td>
                <td class="uren-product-name"><a href="/ShoppingMallProject/product/detail?id=${product.productId}">${product.name}</a></td>
                <td class="uren-product-option">${product.optionName}</td>
                <td class="quantity">
                    <label>수량</label>
                    <div class="cart-plus-minus">
                        <input class="cart-plus-minus-box" value="${product.quantity}" type="text" data-price="${product.price}" data-product-id="${product.cartProductId}">
                        <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                        <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                    </div>
                </td>
                <td class="uren-product-price"><span class="amount">${product.formattedTotalPrice} 원</span></td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	$('.product-row').each(function() {
        const row = $(this); // 현재 행을 jQuery 객체로 설정

        // 증가 버튼 클릭 이벤트 리스너 추가
        row.find('.qtybutton').on('click', function() {
            const input = row.find('.cart-plus-minus-box'); // 해당 입력 필드 선택
            let quantity = parseInt(input.val()); // 현재 수량 가져오기

            const pricePerUnit = parseFloat(input.data('price')); // jQuery로 data-price 가져오기
            const totalPrice = quantity * pricePerUnit; // 총 가격 계산

            const formattedPrice = new Intl.NumberFormat('ko-KR').format(totalPrice);
        
            const priceCell = row.find('.uren-product-price .amount');
            priceCell.text(formattedPrice + ' 원'); // 포맷된 가격 표시
        });
    });
});

</script>

                                
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="coupon-all">
                                        <div class="coupon">
                                            <input id="coupon_code" class="input-text" name="coupon_code" value="" placeholder="Coupon code" type="text">
                                            <input class="button" name="apply_coupon" value="Apply coupon" type="submit">
                                        </div>
                                        <div class="coupon2">
                                            <input class="button" name="update_cart" value="Update cart" type="submit">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 ml-auto">
                                    <div class="cart-page-total">
                                        <h2>Cart totals</h2>
                                        <ul>
                                            <li>Subtotal <span>$118.60</span></li>
                                            <li>Total <span>$118.60</span></li>
                                        </ul>
                                        <a href="javascript:void(0)">Proceed to checkout</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>
