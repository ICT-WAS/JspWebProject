<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<ui:css />
<meta charset="UTF-8">

<!-- 스크립트 -->

</head>

<body class="template-color-1">
	<ui:header />

<!-- 사이드바 + 상품 + 페이지네이션 -->
	<div class="main-wrapper">
		
		<div class="shop-content_wrapper">
			<div class="container-fluid">
				<div class="row">
				
					<!-- 사이드바 시작 -->
					<div class="col-lg-3 col-md-5 order-2">
					
						<!-- 조건 별 조회 시작 -->
						<div class="uren-sidebar-catagories_area">
							
							<!-- 사이드바 - 카테고리 시작 -->
							<div class="category-module uren-sidebar_categories">
								<div class="category-module_heading">
									<h5>카테고리</h5>
									<div id="testCode"></div>
								</div>
								<div class="module-body">
									<ul class="module-list_item">
										<li>
											<!-- 부모 카테고리 리스트 --> <c:forEach var="category"
												items="${categoryList}">
												<c:if test="${category.parentCategoryId==0}">
													<a
														href="${pageContext.request.contextPath}/product/list?category=${category.categoryId}">
														${category.name} <span>(수량)</span>
													</a>

													<!-- 하위 카테고리 리스트 -->
													<c:forEach var="midCategory" items="${categoryList}">
														<ul class="module-sub-list_item">
															<c:if
																test="${midCategory.parentCategoryId == category.categoryId}">
																<li><a href="${pageContext.request.contextPath}/product/list?category=${midCategory.categoryId}">
																		${midCategory.name} <span>(수량)</span>
																</a></li>
																<c:forEach var="subCategory" items="${categoryList}">
																	<c:if test="${subCategory.parentCategoryId == midCategory.categoryId}">
																		<ul class="module-sub-list_item">
																			<li><a href="${pageContext.request.contextPath}/product/list?category=${subCategory.categoryId}">
																					${subCategory.name} <span>(수량)</span>
																			</a></li>
																															
																		</ul>
																	</c:if>	
																</c:forEach>
															</c:if>
														</ul>
													</c:forEach>
												</c:if>
											</c:forEach>
										</li>
									</ul>
								</div>
							</div>
							<!-- 사이드바 - 카테고리 끝 -->
							
							<!-- 사이드바 - 가격 시작 -->
							<div class="uren-sidebar_categories">
								<div class="uren-categories_title">
									<h5>가격</h5>
								</div>
								<div class="price-filter">
									<div id="slider-range"></div>
									<div class="price-slider-amount">
										<div class="label-input">
											<label>price : </label> <input type="text" id="amount"
												name="price" placeholder="Add Your Price" />
										</div>
										<!-- <button type="button">Filter</button> -->
									</div>
								</div>
							</div>
							<!-- 사이드바 - 가격 끝 -->
							
							<!-- 사이드바 - 브랜드 시작 -->
							<div class="uren-sidebar_categories">
								<div class="uren-categories_title">
									<h5>브랜드</h5>
								</div>
								<ul class="sidebar-checkbox_list">
									<li><a href="javascript:void(0)">Sanai <span>(10)</span></a>
									</li>
									<li><a href="javascript:void(0)">Xail <span>(2)</span></a>
									</li>
									<li><a href="javascript:void(0)">Chamcham <span>(1)</span></a>
									</li>
									<li><a href="javascript:void(0)">Meito <span>(3)</span></a>
									</li>
									<li><a href="javascript:void(0)">Walton <span>(0)</span></a>
									</li>
								</ul>
							</div>
							<!-- 사이드바 - 브랜드 끝 -->
							
						</div>
						<!-- 조건 별 조회 끝 -->
						
						<!-- 사이드바 배너 시작 -->
						<div class="sidebar-banner_area">
							<div class="banner-item img-hover_effect">
								<a href="javascript:void(0)"> <img
									src="${pageContext.request.contextPath}/static/template_assets/images/shop/1.jpg" alt="상품 이미지가 존재하지 않습니다.">
								</a>
							</div>
						</div>
						<!-- 사이드바 배너 끝 -->
					</div>
					<!-- 사이드바 끝 -->
					
					<!-- 상품 리스트 시작 -->
					<div class="col-lg-9 col-md-7 order-1">
						<div class="shop-toolbar">
							<div class="product-view-mode">
								<a class="grid-1" data-target="gridview-1" data-toggle="tooltip"
									data-placement="top" title="1">1</a> <a class="grid-2"
									data-target="gridview-2" data-toggle="tooltip"
									data-placement="top" title="2">2</a> <a class="active grid-3"
									data-target="gridview-3" data-toggle="tooltip"
									data-placement="top" title="3">3</a> <a class="grid-4"
									data-target="gridview-4" data-toggle="tooltip"
									data-placement="top" title="4">4</a> <a class="grid-5"
									data-target="gridview-5" data-toggle="tooltip"
									data-placement="top" title="5">5</a>
							</div>
							<div class="product-item-selection_area">
								<form id="optionsForm" action="${pageContext.request.contextPath}/product/list?page=${pageNumber}&pageSize=${pageSize}">
								    <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}">
								    <!-- 기타 폼 요소 -->
								</form>
								<div class="product-showing">
									<label class="select-label">페이지 크기:</label> 
									<select class="myniceselect short-select nice-select" id="pageSizeSelect" name="pageSize" onchange="document.getElementById('sort').value = this.value; document.getElementById('optionsForm').submit();">
										<option value="15" <c:if test="${param.pageSize == '15'}">selected</c:if>>15</option>
										<option value="50" <c:if test="${param.pageSize == '50'}">selected</c:if>>50</option>
										<option value="100" <c:if test="${param.pageSize == '100'}">selected</c:if>>100</option>
									</select>
								</div>
							</div>
						</div>
						
						<!--  상품리스트 보여주는 곳 -->
						<div class="shop-product-wrap grid gridview-3 img-hover-effect_area row" id="product-list-container">
							<!--  개별 상품리스트 시작 -->
							<c:forEach var="product" items="${productList}">
							<div class="col-lg-4">
								<div class="product-slide_item">
									<div class="inner-slide">
										<div class="single-product" id="single-proudct-area">
											
											<div class="product-img">
												<a href="detail?id=${product.productId}"> 
													<!-- 기본 이미지 -->
													<img class="primary-img"
													src="${product.img1}"
													alt="상품 이미지가 존재하지 않습니다."> 
													<!-- 토글 이미지, null일 경우 primary-img 와 동일 -->
													<c:choose>
														<c:when test="${not empty product.img2}">
															<img class="secondary-img" src="${product.img2}">
														</c:when>
														<c:otherwise>
															<img class="secondary-img" src="${product.img1}">
														</c:otherwise>
													</c:choose>
												</a>
												<div class="sticker">
													<span class="sticker">New</span>
												</div>
												<div class="add-actions">
													<ul>
														<li><a class="uren-add_cart" href="cart.html"
															data-toggle="tooltip" data-placement="top"
															title="Add To Cart"><i class="ion-bag"></i></a></li>
														<li class="quick-view-btn" data-toggle="modal"
															data-target="#exampleModalCenter"><a
															href="javascript:void(0)" data-toggle="tooltip"
															data-placement="top" title="Quick View"><i
																class="ion-android-open"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product-content">
												<div class="product-desc_info">
													<h6>
														<a class="product-name"
															href="${pageContext.request.contextPath}/product/list?id=${product.productId}">
															${product.name}</a>
													</h6>
													<div class="price-box">
														<span class="new-price" onload="updatePrice(this)">${product.price}</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 개별 상품 리스트 끝-->
						</div>
						<!--  상품리스트 보여주는 곳 끝 -->
						
						<!-- 페이지네이션 시작 -->
						<div class="row">
							<div class="col-lg-12">
								<div class="uren-paginatoin-area">
									<div class="row">
										<div class="col-lg-12">
										
											<!-- 버튼 그리기 시작 -->
											<ul id="pagination-container" class="uren-pagination-box primary-color">
												<!-- 자바스크립트  createPagenationButton() 함수로 페이지네이션 -->
											</ul>
											<!-- 버튼 그리기 끝 -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 페이지네이션 끝 -->
					</div>
					<!-- 상품 리스트 끝 -->
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 끝 -->
	</div>
	<!-- 사이드바 + 상품 + 페이지네이션 -->
	<ui:footer />
	<ui:js />
	
<script>

const pageNumber = ${pageNumber};
const totalPage = ${totalPage};
const contextPath = "${pageContext.request.contextPath}";
const pageSize = "<%= request.getParameter("pageSize") != null ? request.getParameter("pageSize") : "15" %>";

function createPagenationButton(pageNumber, totalPage){
	
	// 기존 버튼 초기화
	const paginationContainer = document.getElementById("pagination-container");
	paginationContainer.innerHTML = ""; 
	
    //이전 버튼 추가
    if(pageNumber > 1) {
    	const prevButton = document.createElement("li");
    	const url = contextPath + "/product/list?page=" + (pageNumber - 1) + "&pageSize=" + pageSize;
    	const anchor = document.createElement("a");
        anchor.classList.add("Pre");
        anchor.setAttribute("href", url);
        anchor.innerText="이전";
        prevButton.appendChild(anchor);
    	paginationContainer.appendChild(prevButton);
    }
	
    //페이지 번호 범위 계산
    for (let i = Math.max(1, pageNumber - 2); i <= Math.min(totalPage, pageNumber + 2); i++) {
    	//li 태그를 그림
        const pageButton = document.createElement("li");
    	//현재 페이지일 경우 "active"
        pageButton.className = ( i === pageNumber ) ? "active" : "";
        
    	//a태그를 그림
        const link = document.createElement("a");
    	//a태그에 연결된 링크 할당
    	link.href = contextPath + "/product/list?page=" + i + "&pageSize=" + pageSize;
    	//클라이언트에게 보여줄 값을 세팅(인덱스) 
        link.textContent=i
        
        //a태그를 li태그에 할당
        pageButton.appendChild(link);
    	//a태그를 표함한 li태그를 페이지네이션 컨테이너에 할당
        paginationContainer.appendChild(pageButton);
    }
    
    //다음 버튼 추가
    if (pageNumber < totalPage) {
        const nextButton = document.createElement("li");
        const url = contextPath + "/product/list?page=" + (pageNumber + 1) + "&pageSize=" + pageSize;
        const anchor = document.createElement("a");
        anchor.classList.add("Next");
        anchor.setAttribute("href", url);
        anchor.innerText="다음";
        nextButton.appendChild(anchor);
        paginationContainer.appendChild(nextButton);
    }
}


function updatedPrice(){
	$(".new-price").each(function(){
		const productPrice = $(this).text();
		const price = parseFloat(productPrice);
		
		//'금액'을 원화 표시
		const formatCurrency = (value) => {
			return new Intl.NumberFormat('ko-KR', {
	            style: 'currency', 
	            currency: 'KRW', 
	            minimumFractionDigits: 0, 
	            maximumFractionDigits: 0
	        }).format(value);
		};
		const formattedPrice = formatCurrency(price);
		$(this).text(formattedPrice);
		})
	}
	
const observer = new MutationObserver((mutationsList) => {
    mutationsList.forEach((mutation) => {
        if (mutation.type === "childList") {
            
        }
    });
});

observer.observe(document.getElementById("single-proudct-area"), { childList: true, subtree: true });

$(document).ready(function(){	
	
	// 페이지 사이즈 선택 시 폼 제출
    $('#pageSizeSelect').change(function() {
        $('#pageSize').val($(this).val()); // 선택한 값으로 페이지 사이즈 업데이트
        $('#optionsForm').submit(); // 폼 제출
    });

    // 페이지 번호 클릭 시 폼 제출 (페이지 번호 버튼을 생성하는 곳에서 호출)
    function goToPage(pageNumber) {
        $('#page').val(pageNumber); // 페이지 번호 설정
        $('#optionsForm').submit(); // 폼 제출
    }
    
  	//초기 로드 시 페이지네이션 버튼 그리기
    createPagenationButton(pageNumber, totalPage);
  	
    updatedPrice();
  	
});

</script>
</body>
</html>
