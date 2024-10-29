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

	<div class="main-wrapper">
		<!-- 메인 컨텐츠 -->
		<div class="shop-content_wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3 col-md-5 order-2">
						<div class="uren-sidebar-catagories_area">
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
						</div>
						<div class="sidebar-banner_area">
							<div class="banner-item img-hover_effect">
								<a href="javascript:void(0)"> <img
									src="assets/images/shop/1.jpg" alt="Uren's Shop Banner Image">
								</a>
							</div>
						</div>
					</div>
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
									data-placement="top" title="5">5</a> <a class="list"
									data-target="listview" data-toggle="tooltip"
									data-placement="top" title="List"><i class="fa fa-th-list"></i></a>
							</div>
							<div class="product-item-selection_area">
								<div class="product-short">
									<label class="select-label">Short By:</label> <select
										class="myniceselect nice-select">
										<option value="1">기본순</option>
										<option value="2">이름순</option>
										<option value="3">가격순</option>
										<option value="4">최신순</option>
									</select>
								</div>
								<div class="product-showing">
									<label class="select-label">Show:</label> <select
										class="myniceselect short-select nice-select">
										<option value="1">15</option>
										<option value="1">50</option>
										<option value="1">100</option>
									</select>
								</div>
							</div>
						</div>
						
						<!--  상품리스트 보여주는 곳 -->
						<div class="shop-product-wrap grid gridview-3 img-hover-effect_area row" id="product-list-container">
							<!--  개별 상품리스트 -->
							<c:forEach var="product" items="${productList}">
							<div class="col-lg-4">
								<div class="product-slide_item">
									<div class="inner-slide">
										<div class="single-product">
											
											<div class="product-img">
												<a href="detail?id=${product.productId}"> 
													<img class="primary-img"
													src="assets/images/product/large-size/1.jpg"
													alt="기본으로 보여줄 이미지, IMG1"> 
													<img class="secondary-img"
													src="assets/images/product/large-size/2.jpg"
													alt="토글 되면 덮어 쓸 이미지, IMG2, null일 시 그대로 IMG1으로 표기">
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
														<span class="new-price">'$'${product.price}</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 개별 상품 리스트 -->
							
						</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="uren-paginatoin-area">
							<div class="row">
								<div class="col-lg-12">
									<ul class="uren-pagination-box primary-color">
										
										<c:if test="${pageNumber!=null}">
											<c:if test="${pageNumber!=1}">
												<li><a class="Pre" href="${pageContext.request.contextPath}/product/list?page=${pageNumber-1}">이전</a></li>
											</c:if>
											
											<c:if test="${(pageNumber-2)>=1}">
												<li><a href="${pageContext.request.contextPath}/product/list?page=${pageNumber-2}">${pageNumber-2}</a></li>												
											</c:if>
											<c:if test="${(pageNumber-1)>=1}">
												<li><a href="${pageContext.request.contextPath}/product/list?page=${pageNumber-1}">${pageNumber-1}</a></li>
											</c:if>
											
											<li class="active"><a href="${pageContext.request.contextPath}/product/list?page=${pageNumber}">${pageNumber}</a></li>
											
											<c:if test="${(pageNumber+1)<=totalPage}">
												<li><a href="${pageContext.request.contextPath}/product/list?page=${pageNumber+1}">${pageNumber+1}</a></li>												
											</c:if>
											<c:if test="${(pageNumber+2)<=totalPage}">
													<li><a href="${pageContext.request.contextPath}/product/list?page=${pageNumber+2}">${pageNumber+2}</a></li>
												</c:if>
											
											<c:if test="${pageNumber<totalPage}">
											<li><a class="Next" href="${pageContext.request.contextPath}/product/list?page=${pageNumber+1}">다음</a></li>
											</c:if>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<!-- 임시코드 -->
	<script>
		function setActive(element) {
		    // 모든 'li.active' 항목에서 'active' 클래스를 제거
		    document.querySelectorAll('li.active').forEach(li => li.classList.remove('active'));
		    
		    // 클릭된 요소의 부모인 'li' 요소에 'active' 클래스 추가
		    element.parentElement.classList.add('active');
		    
		    setPage(pageNumber);
		}
		
		function setPage(currentPage) {
			const nextPage = currentPage + 1
			
			if(nextPage >= 1 && nextPage <= totalPage) {
				
				window.location.href = `${pageContext.request.contextPath}/product/list?page=${nextPage}`;
			}
		}
		
		function loadPage(element){
			const page = element.getAttribute("data-page");
			
			//AJAX 요청
			fetch(`${window.location.origin}${pageContext.request.contextPath}/list?page=${pageNumber}`)
				.then(response => {
					if (!response.ok){
						throw new Error("네트워크 응답이 원활하지 않습니다.")
					}
					retrun response.text();
				})
				.then(date => {
					document.getElementById('product-list-container').innerHTML = data;
					setActive(element);
				})
				.catch(error => {
					console.error('문제 발생', error)
				})
		}
	</script>

	</div>
	<ui:footer />
	<ui:js />
</body>
</html>
