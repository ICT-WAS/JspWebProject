<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
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
            		<div class="col-6 col-lg-1"></div>
                    <div class="col-6 col-lg-10">
                        <form action="javascript:void(0)">
                            <div class="checkbox-form">
                                <h3>주문 완료</h3>
                                <div class="row">
                                	<div class="col-md-12">
                                	주문번호 : 123148344<br>
                                	주문이 완료되었습니다.
                                	</div>
                                	
                                	<div class="col-md-12 mt-3"></div>
		                            <!-- 결제 정보 -->
		                            <div class="col-md-12 mt-3">
		                                결제 정보<hr>
		                            </div>
                                	<div class="col-md-4">
                                		결제 금액
                                	</div>
                                	<div class="col-md-8 right-align">
                                		총 0원
                                	</div>
                                	<div class="col-md-4">
                                		상품 금액
                                	</div>
                                	<div class="col-md-8 right-align">
                                		13,300원
                                	</div>
                                	<div class="col-md-4">
                                		적립금 할인
                                	</div>
                                	<div class="col-md-8 right-align">
                                		-13,300원
                                	</div>
                                	<div class="col-md-4">
                                		결제수단명
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
		                            <div class="col-md-8">
		                                <label>경기 광명시 하안동 650 어쩌고 저쩌고</label>
		                            </div>
		                            <div class="col-md-4">
		                                <label>배송 요청 사항</label>
		                            </div>
                                    <div class="col-md-8">
		                                <label>부재 시 경비실에 맡겨주세요</label>
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
		                                            <td class="uren-product-name"><a href="javascript:void(0)">${cartItem.name}</a></td>
		                                            <td class="uren-product-price"><span class="amount">${cartItem.formattedPrice}원</span></td>
		                                            <td class="quantity"><span class="amount">x${cartItem.quantity}</span></td>
		                                            <td class="product-subtotal"><span class="amount">${cartItem.formattedTotal}원</span></td>
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
                   </div>
               </div>
           </div>
       </div>
    </div>
		<div class="col-6 col-lg-1"></div>
	<ui:footer />
	<ui:js />
</body>
</html>