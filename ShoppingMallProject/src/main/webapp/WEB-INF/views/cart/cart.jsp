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

<%
List<CartProductDto> cartProducts = (List<CartProductDto>) request.getAttribute("cartProducts");
int total = 0 ;
for(CartProductDto cart : cartProducts){
	total += cart.getTotal(); 
}
String str = String.valueOf(total);
DecimalFormat df = new DecimalFormat("#,###");
str = df.format(total);
%>

<head>
    <ui:css />
    <meta charset="UTF-8">
	<style>
		.thumbnail{
		width:100px;
		height:100px;
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
                <div class="col-3"></div>
                    <div class="col-6">
                        <form action="javascript:void(0)">
                            <div class="table-content table-responsive">
                                   <% if (cartProducts.size() == 0){ %>
       <h4>장바구니에 담긴 상품이 없습니다.</h4>
       <%}else{%>
                                <table class="table">
    <thead>
        <tr>
            <th class="uren-product-thumbnail">사진</th>
            <th class="cart-product-name">상품명</th>
            <th class="cart-product-option">옵션</th>
            <th class="uren-product-quantity">수량</th>
            <th class="uren-product-subtotal">가격</th>
            <th class="uren-product-remove"></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${cartProducts}">
            <tr class="${product.cartProductId} product-row">
                <td class="uren-product-thumbnail thumbnail"><img src="${product.image}" alt="Uren's Cart Thumbnail"></td>
                <td class="uren-product-name"><a href="/ShoppingMallProject/product/detail?id=${product.productId}">${product.name}</a></td>
                <td class="uren-product-option">
                <c:if test="${product.optionId != null}">
                	${product.optionName}
                	<br>
                	(${product.formattedOptionPrice}원)
                </c:if>
                <c:if test="${product.optionId == null}">
                	없음
                </c:if>
                </td>
                <td class="quantity">
                    <label>수량</label>
                    <div class="cart-plus-minus">
                        <input class="cart-plus-minus-box" data-stock="${product.stock}" value="${product.quantity}" type="text" data-price="${product.price}" data-product-id="${product.cartProductId}">
                        <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                        <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                    </div>
                </td>
                <td class="uren-product-price"><span class="amount">${product.formattedTotalPrice} 원</span></td>
                <td><a href="#" onclick="if(confirm('정말 삭제하시겠습니까?')) { window.location.href='/ShoppingMallProject/cart/delete?cartProductId=${product.cartProductId}'; } return false;" class="uren-btn uren-btn_dark uren-btn_sm"><span>삭제</span></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<%} %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	$('.product-row').each(function() {
        const row = $(this); // 현재 행을 jQuery 객체로 설정
        // 증가 버튼 클릭 이벤트 리스너 추가
        row.find('.qtybutton').on('click', function() {
        	const stock = row.find('.cart-plus-minus-box').data('stock');
        	
        	const cartProductId = parseInt(row.attr('class').split(' ')[0]);
            const input = row.find('.cart-plus-minus-box'); // 해당 입력 필드 선택
            let quantity = parseInt(input.val()); // 현재 수량 가져오기

            if(stock<quantity){
            	alert('재고가 부족합니다. ' + stock + '개 이상 담을 수 없습니다.');
            	location.reload();
            	return;
            }
            
            const pricePerUnit = parseFloat(input.data('price')); // jQuery로 data-price 가져오기
            const totalPrice = quantity * pricePerUnit; // 총 가격 계산


            const formattedPrice = new Intl.NumberFormat('ko-KR').format(totalPrice);
 
            const priceCell = row.find('.uren-product-price .amount');
            priceCell.text(formattedPrice + ' 원'); // 포맷된 가격 표시
            
            let totalValue = parseInt($('.hiddenTotal').val());
            if ($(this).hasClass('inc')) {
            	totalValue += pricePerUnit;
            } else if ($(this).hasClass('dec')) {
            	totalValue -= pricePerUnit;
            }
            
            $('.hiddenTotal').val(totalValue);
            
            const formattedTotalPrice = new Intl.NumberFormat('ko-KR').format(totalValue);
            const priceCell2 = $('.formattedTotal');
            priceCell2.text(formattedTotalPrice + ' 원');
            
            $.ajax({
                type: "POST",
                url: "/ShoppingMallProject/cart",
                data: {
                    cartProductId: cartProductId,
                    quantity: quantity
                },
                success: function(response) {
                },
                error: function(xhr) {
                    if (xhr.status === 404) {
                        alert("오~류 : 404");
                    } else if (xhr.status === 400) {
                        alert("오~류 : 400");
                    } else {
                        alert("오~류 : ?");
                    }
                }
            });
        });
    });
});

</script>

                                
                            </div>
                            <div class="row">
                                <div class="col-md-5 ml-auto">
                                    <div class="cart-page-total">

                                        <input class="hiddenTotal" type="hidden" value="<%=total%>">
                                        <% if (cartProducts.size() == 0){ %>
                                        <a href="/ShoppingMallProject/product/list">상품페이지 이동</a>
                                        <%}else{ %>
                                                                                <h2>총 가격</h2>
                                        <ul>
                                            <li >Total <span class="formattedTotal"><%=str %> 원</span></li>
                                        </ul>
                                        <a href="/ShoppingMallProject/order/checkout">결제하기</a>
                                        <%} %>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>
        </div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>
