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

<!-- 메인 컨텐츠 : 사이드바 + 상품 + 페이지네이션 끝-->
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
													<a>${category.name}</a>

													<!-- 하위 카테고리 리스트 -->
													<c:forEach var="midCategory" items="${categoryList}">
														<ul class="module-sub-list_item">
														<c:set var="categoryQuantity" value="${productCounts[midCategory.categoryId]}" />
															<c:if
																test="${midCategory.parentCategoryId == category.categoryId && categoryQuantity!=0}">
																<li>
																	<a href="${pageContext.request.contextPath}/product/list?category=${midCategory.categoryId}">
																		- ${midCategory.name} 
																		<span>(${categoryQuantity})</span>
																	</a>
																</li>
																<c:forEach var="subCategory" items="${categoryList}">
																	<c:if test="${subCategory.parentCategoryId == midCategory.categoryId}">
																		<ul class="module-sub-list_item">
																			<li>
																				<a href="${pageContext.request.contextPath}/product/list?category=${subCategory.categoryId}">
																					- ${subCategory.name} <span>(수량)</span>
																				</a>
																			</li>
																															
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
						</div>
						<!-- 조건 별 조회 끝 -->
					</div>
					<!-- 사이드바 끝 -->
					
					<!-- 상품 리스트 시작 -->
					<div class="col-lg-9 col-md-7 order-1">
						<div class="shop-toolbar">
							<div class="product-view-mode">
								<a class="grid-1" data-target="gridview-1" data-toggle="tooltip"
									data-placement="top" title="1">1</a> <a class="grid-2"
									data-target="gridview-2" data-toggle="tooltip"
									data-placement="top" title="2">2</a> <a class="grid-3"
									data-target="gridview-3" data-toggle="tooltip"
									data-placement="top" title="3">3</a> <a class="grid-4"
									data-target="gridview-4" data-toggle="tooltip"
									data-placement="top" title="4">4</a> <a class="active grid-5"
									data-target="gridview-5" data-toggle="tooltip"
									data-placement="top" title="5">5</a>
							</div>
							<div class="product-item-selection_area">
								<div class="product-showing">
									<label class="select-label">페이지 크기:</label> 
									<select class="myniceselect short-select nice-select" id="pageSizeSelect" name="pageSize" onchange="changePageSize(this.value)">
										<option value="15" <c:if test="${param.pageSize == '15'}">selected</c:if>>15</option>
										<option value="50" <c:if test="${param.pageSize == '50'}">selected</c:if>>50</option>
										<option value="100" <c:if test="${param.pageSize == '100'}">selected</c:if>>100</option>
									</select>
								</div>
							</div>
						</div>
						
						<!--  상품리스트 보여주는 곳 -->
						<div class="shop-product-wrap grid gridview-5 img-hover-effect_area row" id="product-list-container">
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
														<c:when test="${not empty product.img2 and product.img2 != 'NULL'}">
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
											</div>
											<div class="product-content">
												<div class="product-desc_info">
												<div style="height: 1.0em;"></div>
													<h6>
														<a class="product-name"
															href="${pageContext.request.contextPath}/product/list?id=${product.productId}">
															${product.name}
														</a>
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
	</div>
	<!-- 메인 컨텐츠 : 사이드바 + 상품 + 페이지네이션 끝-->
	
	<!-- 모달 영역 시작 -->
	<!-- 검색어에 맞는 상품 없을 때 보여줄 모달 시작 -->
	<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">검색 결과</h5>
				</div>
				<div class="modal-body">
					검색 조건에 맞는 상품이 없습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modal-close-btn-search">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 검색어에 맞는 상품 없을 때 보여줄 모달 끝 -->
	<!-- 수량이 없는 카테고리 조회 시 보여줄 모달 시작 -->
	<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">경고: 상품 조회 실패</h5>
				</div>
				<div class="modal-body">
					해당 카테고리의 상품이 존재하지 않습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modal-close-btn-category">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 수량이 없는 카테고리 조회 시 보여줄 모달 끝 -->
	<!-- 모달 영역 끝 -->
	
	<ui:footer />
	<ui:js />
	
<script>

const pageNumber = ${pageNumber};
const totalPage = ${totalPage};
const contextPath = "${pageContext.request.contextPath}";
const pageSize = "<%= request.getParameter("pageSize") != null ? request.getParameter("pageSize") : "15" %>";

//페이지가 바뀌면 파라미터 변경하기
function changePage(pageNumber){
	var currentUrl = window.location.href;
	var newUrl = updateQueryStringParameter(currentUrl, 'page', pageNumber);
	window.location.href = newUrl;
}

//페이지 크기가 바뀌면 파라미터 변경하기
function changePageSize(pageSize){
	var currentUrl = window.location.href;
	var url = updateQueryStringParameter(currentUrl, 'pageSize', pageSize);
	
	var newUrl = new URL(url);
	var params = new URLSearchParams(newUrl.search);
	var urlParams = new URLSearchParams(currentUrl.split('?')[1]);
	
	//현재 url에 페이지 번호가 존재할 시 1으로 초기화
	if(urlParams.has('page')){
		params.set('page', '1');
		newUrl.search = params.toString();
	}
	
	window.location.href = newUrl;
}

function updateQueryStringParameter(url, param, value){
	// URL이 ?를 포함하고 있는지 확인
	var baseUrl = url.split('?')[0];
	var queryString = url.includes('?') ? url.split('?')[1] : '';
	 
	// 기존 쿼리 파라미터에서 해당 param을 찾아 새로운 값으로 변경
	var updatedQueryString = [];
	var params = queryString.split('&');
	var foundParam = false;
	
	params.forEach(function(paramString) {
        var paramParts = paramString.split('=');
        if (paramParts[0] === param) {
            updatedQueryString.push(param + '=' + value); // 원하는 파라미터만 변경
            foundParam = true;
        } else {
            updatedQueryString.push(paramString); // 다른 파라미터는 그대로 추가
        }
    });
	
	// param이 없으면 새로운 파라미터를 추가
    if (!foundParam) {
        updatedQueryString.push(param + '=' + value);
    }

    // 새로 변경된 쿼리 문자열과 기본 URL을 합쳐서 리턴
    return baseUrl + '?' + updatedQueryString.join('&');
     
}


function createPagenationButton(pageNumber, totalPage){
	
	// 기존 버튼 초기화
	const paginationContainer = document.getElementById("pagination-container");
	paginationContainer.innerHTML = ""; 
	var currentUrl = window.location.href;
	
	// 페이지 번호 범위 설정
	const maxPageButtons=5;
	let startPage = Math.max(1, pageNumber - Math.floor(maxPageButtons / 2));
    let endPage = Math.min(totalPage, startPage + maxPageButtons - 1);
    
    if (endPage - startPage < maxPageButtons - 1) {
        startPage = Math.max(1, endPage - maxPageButtons + 1);
    }
	
    //이전 버튼 추가
    if(pageNumber > 1) {
    	const prevButton = document.createElement("li");
    	
    	var newUrl = updateQueryStringParameter(currentUrl, 'page', pageNumber-1);

    	const anchor = document.createElement("a");
        anchor.classList.add("Pre");
        anchor.setAttribute("href", newUrl);
        anchor.innerText="이전";
        
        prevButton.appendChild(anchor);
    	paginationContainer.appendChild(prevButton);
    }
	
    //페이지 번호 범위 계산
    for (let i = startPage; i <= endPage; i++) {
    	//li 태그를 그림
        const pageButton = document.createElement("li");
    	//현재 페이지일 경우 "active"
        pageButton.className = ( i === pageNumber ) ? "active" : "";
        
    	//a태그를 그림
        const link = document.createElement("a");
    	//a태그에 연결된 링크 할당
    	link.href = updateQueryStringParameter(currentUrl, 'page', i);
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

        var newUrl = updateQueryStringParameter(currentUrl, 'page', pageNumber+1);

        const anchor = document.createElement("a");
        anchor.classList.add("Next");
        anchor.setAttribute("href", newUrl);
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

//조건에 맞는 모달 창을 보여주기
window.onload = function() {
    // URL 파라미터에서 모달 옵션을 확인
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('noResults') && urlParams.get('noResults') === 'true') {
        $('#searchModal').modal('show');
    }
    if (urlParams.has('noCategory') && urlParams.get('noCategory') === 'true') {
        $('#categoryModal').modal('show');
        console.log("걸리는지 확인")
    } 
}

//모달 닫기 버튼 클릭 시 URL에서 noResults=true 제거하고 페이지 업데이트
document.getElementById('modal-close-btn-search').addEventListener('click', function() {
    const urlParams = new URLSearchParams(window.location.search);

    // 'noResults' 파라미터가 존재하면 제거
    if (urlParams.has('noResults')) {
        urlParams.delete('noResults');
    }

    // URL을 새로 업데이트
    const newUrl = window.location.pathname + '?' + urlParams.toString();

    // 주소 표시줄에서 'noResults' 파라미터를 제거한 새로운 URL로 변경
    window.history.replaceState({}, '', newUrl);
});

//모달 닫기 버튼 클릭 시 URL에서 noCategory=true 제거하고 페이지 업데이트
document.getElementById('modal-close-btn-category').addEventListener('click', function() {
    const urlParams = new URLSearchParams(window.location.search);

    // 'noCategory' 파라미터가 존재하면 제거
    if (urlParams.has('noCategory')) {
        urlParams.delete('noCategory');
    }

    // URL을 새로 업데이트
    const newUrl = window.location.pathname + '?' + urlParams.toString();

    // 주소 표시줄에서 'noResults' 파라미터를 제거한 새로운 URL로 변경
    window.history.replaceState({}, '', newUrl);
});

observer.observe(document.getElementById("single-proudct-area"), { childList: true, subtree: true });

$(document).ready(function(){	
    
  	//초기 로드 시 페이지네이션 버튼 그리기
    createPagenationButton(pageNumber, totalPage);
  	
  	//초기 로드 시 금액 포매팅
    updatedPrice();
  	
});

</script>
</body>
</html>
