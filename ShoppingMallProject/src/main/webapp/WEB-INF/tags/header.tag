<%@tag import="com.shopping.model.Member"%>
<%@tag import="com.shopping.dao.MemberDao"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Begin Uren's Header Main Area -->
        <header class="header-main_area header-main_area-2 header-main_area-3">
        	<!-- 로고 영역 시작 -->
            <div class="header-middle_area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-3 col-lg-2 col-md-3 col-sm-5">
                            <div style="margin-left: 10px;" class="header-logo_area">
                                <a href="/ShoppingMallProject/main">
                                    <img width="189px" height="80px" src="${pageContext.request.contextPath}/static/template_assets/images/menu/logo/4.png" alt="Uren's Logo">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-6 d-none d-lg-block">
                            <div style="margin-top: 20px;" class="hm-form_area">
                                <form action="${pageContext.request.contextPath}/product/list" class="hm-searchbox" method="get">
                                    <input type="text" name="name" placeholder="찾으려는 상품명을 입력하세요">
                                    <button class="header-search_btn" type="submit">
	                                    <i class="ion-ios-search-strong">
	                                    	<span>검색</span>
	                                    </i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-7">
                            <div style="margin-top: 20px;" class="header-right_area">
                                <ul>
                                    <li class="mobile-menu_wrap d-flex d-lg-none">
                                        <a href="#mobileMenu" class="mobile-menu_btn toolbar-btn color--white">
                                            <i class="ion-navicon"></i>
                                        </a>
                                    </li>
                                    <li class="minicart-wrap">
                                        <a href="/ShoppingMallProject/cart" class="">
                                            <div class="minicart-count_area">
                                                <i class="ion-bag"></i>
                                            </div>
                                        </a>
                                    </li>
                                    <c:if test="${sessionScope.id == 'admin'}">
	                                    <li class="minicart-wrap">
	                                        <a href="/ShoppingMallProject/admin/usermanagement" class="">
	                                            <div style="" class="minicart-count_area">
	                                                <span class="fa fa-user">관리자 메뉴</span>
	                                                
	                                            </div>
	                                        </a>
	                                    </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 로고 영역 끝 -->
            
            <!-- 상단 네비게이터 시작 -->
            <div class="header-top_area bg--primary">
                <div class="container-fluid">
                    <div class="row">
                        <div class="custom-category_col col-12">
                            <div class="category-menu category-menu-hidden">
                                <div class="category-heading">
                                    <h2 class="categories-toggle">
                                        <span>카테고리</span>
                                    </h2>
                                </div>
                                <div id="cate-toggle" class="category-menu-list">
                                    <ul>
                                       <!-- 부모 카테고리 시작 -->
                                        <c:forEach var="topCategory" items="${categoryList}">
	                                        <c:if test="${topCategory.parentCategoryId==0}">
	                                        	<li class="right-menu">
	                                        		<a>${topCategory.name}</a>
	                                        		<!-- 자식 카테고리 시작 -->
	                                        		<ul class="cat-dropdown cat-dropdown-2">
	                                        			<li>
			                                        		<c:forEach var="midCategory" items="${categoryList}">
			                                        			<c:if test="${midCategory.parentCategoryId == topCategory.categoryId}">		
			                                        				<p></p>	                                        				
		                                        					<a href="${pageContext.request.contextPath}/product/list?category=${midCategory.categoryId}">${midCategory.name}</a>			                                        				
			                                        			</c:if>
			                                        		</c:forEach>
		                                        		</li>
	                                        		</ul>
                                        			<!-- 자식 카테고리 끝 -->                                        		
	                                        	</li>
	                                        </c:if>
                                        </c:forEach>
                                        <!-- 부모 카테고리 끝 -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="custom-menu_col col-12 d-none d-lg-block">
                        <div class="main-menu_area position-relative">
                                <nav class="main-nav">
                                    <ul>
                                        <li class=""><a href="/ShoppingMallProject/product/list">상품 목록</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>  <!-- css 정렬 -->
                        <div class="custom-setting_col col-12 d-none d-lg-block">
                            <div class="ht-right_area">
                                <div class="ht-menu">
                                    <ul>
                                        <li>
                                        <c:if test="${sessionScope.id == null}">
                                        <a href="/ShoppingMallProject/login">
                                        </c:if>
                                        <c:if test="${sessionScope.id != null}">
                                        <a href="/ShoppingMallProject/member/info">
                                        </c:if>
                                        <span class="fa fa-user"></span> 
                                        <span>
                                        <c:if test="${sessionScope.id == null}">
                                        	로그인
                                        </c:if>
                                        <c:if test="${sessionScope.id != null}">
										    <c:out value="${sessionScope.id}" /> &nbsp; 님
										</c:if>
                                        </span>
                                        <i class="fa fa-chevron-down"></i></a>
                                        	<ul class="ht-dropdown ht-my_account">
                                            	<c:if test="${sessionScope.id == null}">
                                            		<li><a href="/ShoppingMallProject/login">로그인</a></li>
                                               		<li><a href="/ShoppingMallProject/signup">회원가입</a></li>
                                            	</c:if>
                                            	<c:if test="${sessionScope.id != null}">
                                            		<li><a href="/ShoppingMallProject/member/info">내 정보</a></li>
                                            		<li><a href="/ShoppingMallProject/cart">장바구니</a></li>
													<li><a href="/ShoppingMallProject/logout">로그아웃</a></li>
												</c:if>
											</ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="custom-search_col col-12 d-none d-md-block d-lg-none">
                            <div class="hm-form_area">
                            	<form action="${pageContext.request.contextPath}/product/list" class="hm-searchbox" method="get">
                                    <input type="text" name="name" placeholder="검색어를 입력하세요">
                                    <button class="header-search_btn" type="submit">
	                                    <i class="ion-ios-search-strong">
	                                    	<span>검색</span>
	                                    </i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<!-- 상단 네비게이터 끝 -->
            
            <div class="header-top_area header-sticky bg--primary">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-8 col-lg-7 d-lg-block d-none">
                            <div class="main-menu_area position-relative">
                            <div class="header-logo_area">
                                <a href="/ShoppingMallProject/main">
                                    <img width="189px" height="80px" src="${pageContext.request.contextPath}/static/template_assets/images/menu/logo/4.png" alt="Uren's Logo">
                                </a>
                            </div>
                            </div>
                        </div>
                        <div class="col-sm-3 d-block d-lg-none">
                            <div class="header-logo_area header-sticky_logo">
                                <a href="index.html">
                                    <img src="${pageContext.request.contextPath}/static/template_assets/images/menu/logo/3.png" alt="Uren's Logo">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 col-sm-9">
                            <div class="header-right_area">
                                <ul>
                                    <li class="mobile-menu_wrap d-flex d-lg-none">
                                        <a href="#mobileMenu" class="mobile-menu_btn toolbar-btn color--white">
                                            <i class="ion-navicon"></i>
                                        </a>
                                    </li>
                                    <li class="minicart-wrap">
                                        <a href="/ShoppingMallProject/cart" class="">
                                            <div class="minicart-count_area">
                                                <i class="ion-bag"></i>
                                                <span>장바구니</span>
                                            </div>
                                                
                                        </a>
                                    </li>
                                    <li class="contact-us_wrap">
                                        <a href="tel://+821055700010"><i class="ion-android-call"></i>+82 10-5570-0010</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Uren's Header Main Area End Here -->
