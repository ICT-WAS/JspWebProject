<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
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
                                    	<% 
										    List<Integer> myList = Arrays.asList(1, 2, 3, 4, 5);
										    request.setAttribute("myList", myList); 
										%>
                                    	<c:forEach var="product" items="${myList}">
                                    		<tr>
                                    			<td class="uren-product-check"><input type="checkbox" checked="checked" value="${product }"></td>
                                    			<td class="uren-product-thumbnail"><a href="javascript:void(0)"><img src="assets/images/product/small-size/1.jpg" alt="Uren's Cart Thumbnail"></a></td>
                                    			<td class="uren-product-name"><a href="javascript:void(0)">${product} 이름</a></td>
                                    			<td class="uren-product-option"><a href="javascript:void(0)">${product} 옵션</a></td>
                                    			<td class="quantity">
	                                                <label>수량</label>
	                                                <div class="cart-plus-minus">
	                                                    <input class="cart-plus-minus-box" value="1" type="text">
	                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
	                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
	                                                <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div></div>
                                            	</td>
                                    			<td class="uren-product-price"><span class="amount">${product} 원</span></td>
                                    		</tr>
                                    	</c:forEach>
                                    
                                    
                                    
                                    	<tr>
                                            <td class="uren-product-remove"><input type="checkbox" value="213"></td>
                                            <td class="uren-product-thumbnail"><a href="javascript:void(0)"><img src="assets/images/product/small-size/1.jpg" alt="Uren's Cart Thumbnail"></a></td>
                                            <td class="uren-product-name"><a href="javascript:void(0)">Juma rema pola</a></td>
                                            <td class="uren-product-price"><span class="amount">$46.80</span></td>
                                            <td class="quantity">
                                                <label>Quantity</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div></div>
                                            </td>
                                            <td class="product-subtotal"><span class="amount">$46.80</span></td>
                                        </tr>
                                        <tr>
                                            <td class="uren-product-remove"><a href="javascript:void(0)"><i class="fa fa-trash" title="Remove"></i></a></td>
                                            <td class="uren-product-thumbnail"><a href="javascript:void(0)"><img src="assets/images/product/small-size/1.jpg" alt="Uren's Cart Thumbnail"></a></td>
                                            <td class="uren-product-name"><a href="javascript:void(0)">Juma rema pola</a></td>
                                            <td class="uren-product-price"><span class="amount">$46.80</span></td>
                                            <td class="quantity">
                                                <label>Quantity</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div></div>
                                            </td>
                                            <td class="product-subtotal"><span class="amount">$46.80</span></td>
                                        </tr>
                                        <tr>
                                            <td class="uren-product-remove"><a href="javascript:void(0)"><i class="fa fa-trash" title="Remove"></i></a></td>
                                            <td class="uren-product-thumbnail"><a href="javascript:void(0)"><img src="assets/images/product/small-size/2.jpg" alt="Uren's Cart Thumbnail"></a></td>
                                            <td class="uren-product-name"><a href="javascript:void(0)">Bag Goodscol model</a></td>
                                            <td class="uren-product-price"><span class="amount">$71.80</span></td>
                                            <td class="quantity">
                                                <label>Quantity</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div><div class="inc qtybutton"><i class="fa fa-angle-up"></i></div></div>
                                            </td>
                                            <td class="product-subtotal"><span class="amount">$71.80</span></td>
                                        </tr>
                                    </tbody>
                                </table>
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
