<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	
	<!-- 스크립트 -->
	<style>
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
		.button-modify {
		    background: #ffffff;
		    display: block;
		    font-size: 12px;
		    font-weight: 600;
		    height: 40px;
		    margin: 0;
		    padding: 0;
		    width: 100%;
		    border: 1px solid transparent;
		    
		    border: 1px solid #999999;
		    cursor: pointer;
		    border-radius: 8px;
		}
		select span {
		    height: 30px;
		    line-height: 40px;
		    display: inline-block;
		    width: 100%;
		    padding: 0 0 0 15px;
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
            		
                    	<div class="col-6 col-lg-12">
							<div class="checkbox-form">
								<h3>상품 관리</h3>
								<div class="row">

									<div class="col-md-12 mt-3"></div>
									
									<div class="col-md-1"></div>
									<div class="col-md-6 d-none d-lg-block">
										<div class="hm-form_area">
											<form action="#" class="hm-searchbox">
												<select class="nice-select select-search-category">
													<option value="0">카테고리</option>
													<option value="10">Laptops</option>
													<option value="17">Prime Video</option>
												</select>
												<input type="text" placeholder="검색어를 입력하세요">
												<button class="header-search_btn" type="submit">검색</button>
											</form>
										</div>
									</div>
									
									<div class="col-md-2"></div>
									<div class="col-md-3">
										<a href="/ShoppingMallProject/product/add" class="btn btn-warning btn-lg">상품 등록</a>
									</div>


									<!-- 상품 목록 테이블 -->

									<div class="col-md-12 mb-3"></div>
									<div class="col-md-12 mt-3">

										<table class="table">
											<tr>
												<th>상품번호</th>
												<th colspan="2">상품명</th>
												<th>옵션별 재고</th>
												<th>판매상태</th>
												<th>상품수정</th>
												<th>옵션수정</th>
												<th>등록일자</th>
											</tr>
											<c:forEach var="productDto" items="${productDtoList}">
												<tr>
													<td>${productDto.product.productId}</td>
													<td colspan="2"><a
														href="/ShoppingMallProject/product/detail?id=${productDto.product.productId}">

															<c:set var="productName"
																value="${productDto.product.name }" /> <c:set
																var="maxLength" value="30" /> <c:if
																test="${fn:length(productName) > maxLength}">
																<c:set var="productName"
																	value="${fn:substring(productName, 0, maxLength)}…" />
															</c:if> ${productName}
													</a></td>
													<td class="uren-product-name"><c:choose>
															<c:when test="${productDto.optionList.size() > 1}">
																<div class="country-select clearfix" id="selectMessage">
																	<select name="message"
																		class="myniceselect nice-select wide">
																		<c:forEach var="option"
																			items="${productDto.optionList}">
																			<c:if test="${option.optionId != null}">
																				<option value="${option.optionId }">

																					<c:set var="optionName"
																						value="${option.optionName }" />
																					<c:set var="maxLength" value="8" />
																					<c:if
																						test="${fn:length(option.optionName) > maxLength}">
																						<c:set var="optionName"
																							value="${fn:substring(optionName, 0, maxLength)}…" />
																					</c:if>
																					<p>
																						${optionName }
																						<fmt:formatNumber
																							value="${option.optionStockquantity}"
																							pattern=" : 0개" />
																					</p>
																				</option>
																			</c:if>
																		</c:forEach>
																	</select>
																</div>
															</c:when>
															<c:otherwise>
																<p>
																	옵션 없음
																	<fmt:formatNumber
																		value="${productDto.product.quantity}" pattern=" : 0개" />
																</p>
															</c:otherwise>
														</c:choose></td>
													<td>
														<div class="country-select clearfix" id="selectMessage">
															<select name="message"
																class="myniceselect nice-select wide">
																<option value="">판매중</option>
																<option value="부재 시 경비실에 맡겨주세요">품절</option>
																<option value="부재 시 문앞에 놓아주세요">판매중지</option>
															</select>
														</div>
													</td>
													<td><input type="button" value="상품 수정"
														class="button-modify"></td>
													<td><input type="button" value="옵션 수정"
														class="button-modify"></td>
													<td><c:set var="localDateTime"
															value="${productDto.product.registrationDate}" /> <c:set
															var="localDate" value="${fn:split(localDateTime, 'T')}" />
														<p>${localDate[0]}</p></td>
												</tr>
											</c:forEach>
										</table>
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