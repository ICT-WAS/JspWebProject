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
                            <div class="header-logo_area">
                                <a href="/ShoppingMallProject/main">
                                    <img src="${pageContext.request.contextPath}/static/template_assets/images/menu/logo/2.png" alt="Uren's Logo">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-6 d-none d-lg-block">
                            <div class="hm-form_area">
                                <form action="#" class="hm-searchbox">
                                    <select class="nice-select select-search-category">
                                        <option value="0">카테고리</option>
                                        <option value="10">Laptops</option>
                                        <option value="17">Prime Video</option>
                                        <option value="20">All Videos</option>
                                        <option value="21">Blouses</option>
                                        <option value="22">Evening Dresses</option>
                                        <option value="23">Summer Dresses</option>
                                        <option value="24">T-shirts</option>
                                        <option value="25">Rent or Buy</option>
                                        <option value="26">Your Watchlist</option>
                                        <option value="27">Watch Anywhere</option>
                                        <option value="28">Getting Started</option>
                                        <option value="18">Computers</option>
                                        <option value="29">More to Explore</option>
                                        <option value="30">TV &amp; Video</option>
                                        <option value="31">Audio &amp; Theater</option>
                                        <option value="32">Camera, Photo </option>
                                        <option value="33">Cell Phones</option>
                                        <option value="34">Headphones</option>
                                        <option value="35">Video Games</option>
                                        <option value="36">Wireless Speakers</option>
                                        <option value="19">Electronics</option>
                                        <option value="37">Amazon Home</option>
                                        <option value="38">Kitchen &amp; Dining</option>
                                        <option value="39">Furniture</option>
                                        <option value="40">Bed &amp; Bath</option>
                                        <option value="41">Appliances</option>
                                        <option value="11">TV &amp; Audio</option>
                                        <option value="42">Chamcham</option>
                                        <option value="45">Office</option>
                                        <option value="47">Gaming</option>
                                        <option value="48">Chromebook</option>
                                        <option value="49">Refurbished</option>
                                        <option value="50">Touchscreen</option>
                                        <option value="51">Ultrabooks</option>
                                        <option value="52">Blouses</option>
                                        <option value="43">Sanai</option>
                                        <option value="53">Hard Drives</option>
                                        <option value="54">Graphic Cards</option>
                                        <option value="55">Processors (CPU)</option>
                                        <option value="56">Memory</option>
                                        <option value="57">Motherboards</option>
                                        <option value="58">Fans &amp; Cooling</option>
                                        <option value="59">CD/DVD Drives</option>
                                        <option value="44">Meito</option>
                                        <option value="60">Sound Cards</option>
                                        <option value="61">Cases &amp; Towers</option>
                                        <option value="62">Casual Dresses</option>
                                        <option value="63">Evening Dresses</option>
                                        <option value="64">T-shirts</option>
                                        <option value="65">Tops</option>
                                        <option value="12">Smartphone</option>
                                        <option value="66">Camera Accessories</option>
                                        <option value="68">Octa Core</option>
                                        <option value="69">Quad Core</option>
                                        <option value="70">Dual Core</option>
                                        <option value="71">7.0 Screen</option>
                                        <option value="72">9.0 Screen</option>
                                        <option value="73">Bags &amp; Cases</option>
                                        <option value="67">XailStation</option>
                                        <option value="74">Batteries</option>
                                        <option value="75">Microphones</option>
                                        <option value="76">Stabilizers</option>
                                        <option value="77">Video Tapes</option>
                                        <option value="78">Memory Card Readers</option>
                                        <option value="79">Tripods</option>
                                        <option value="13">Cameras</option>
                                        <option value="14">headphone</option>
                                        <option value="15">Smartwatch</option>
                                        <option value="16">Accessories</option>
                                    </select>
                                    <input type="text" placeholder="검색어를 입력하세요">
                                    <button class="header-search_btn" type="submit"><i
                                        class="ion-ios-search-strong"><span>검색</span></i></button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-7">
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
                                            </div>
                                        </a>
                                    </li>
                                    <c:if test="${sessionScope.id == 'admin'}">
                                    <li class="minicart-wrap">
                                        <a href="/ShoppingMallProject/admin/usermanagement" class="">
                                            <div class="minicart-count_area">
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
                                        <li class="dropdown-holder active"><a href="/ShoppingMallProject/main">Home</a>

                                        </li>
                                        <li class="megamenu-holder "><a href="/ShoppingMallProject/product/list">Shop <i
                                                class="ion-ios-arrow-down"></i></a>
                                            <ul class="hm-megamenu">
                                                <li><span class="megamenu-title">Shop Page Layout</span>
                                                    <ul>
                                                        <li><a href="shop-grid-fullwidth.html">Grid Fullwidth</a></li>
                                                        <li><a href="shop-left-sidebar.html">Left Sidebar</a></li>
                                                        <li><a href="shop-right-sidebar.html">Right Sidebar</a></li>
                                                        <li><a href="shop-list-fullwidth.html">List Fullwidth</a></li>
                                                        <li><a href="shop-list-left-sidebar.html">List Left Sidebar</a>
                                                        </li>
                                                        <li><a href="shop-list-right-sidebar.html">List Right
                                                                Sidebar</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><span class="megamenu-title">Single Product Style</span>
                                                    <ul>
                                                        <li><a href="single-product-gallery-left.html">Gallery Left</a>
                                                        </li>
                                                        <li><a href="single-product-gallery-right.html">Gallery
                                                                Right</a>
                                                        </li>
                                                        <li><a href="single-product-tab-style-left.html">Tab Style
                                                                Left</a>
                                                        </li>
                                                        <li><a href="single-product-tab-style-right.html">Tab Style
                                                                Right</a>
                                                        </li>
                                                        <li><a href="single-product-sticky-left.html">Sticky Left</a>
                                                        </li>
                                                        <li><a href="single-product-sticky-right.html">Sticky Right</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><span class="megamenu-title">Single Product Type</span>
                                                    <ul>
                                                        <li><a href="single-product.html">Single Product</a></li>
                                                        <li><a href="single-product-sale.html">Single Product Sale</a>
                                                        </li>
                                                        <li><a href="single-product-group.html">Single Product Group</a>
                                                        </li>
                                                        <li><a href="single-product-variable.html">Single Product
                                                                Variable</a>
                                                        </li>
                                                        <li><a href="single-product-affiliate.html">Single Product
                                                                Affiliate</a>
                                                        </li>
                                                        <li><a href="single-product-slider.html">Single Product
                                                                Slider</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        </ul>
                                </nav>
                            </div>
                        </div>

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
                                <form action="#" class="hm-searchbox">
                                    <select class="nice-select select-search-category">
                                        <option value="0">전체</option>
                                        <option value="10">Laptops</option>
                                        <option value="17">Prime Video</option>
                                        <option value="20">All Videos</option>
                                        <option value="21">Blouses</option>
                                        <option value="22">Evening Dresses</option>
                                        <option value="23">Summer Dresses</option>
                                        <option value="24">T-shirts</option>
                                        <option value="25">Rent or Buy</option>
                                        <option value="26">Your Watchlist</option>
                                        <option value="27">Watch Anywhere</option>
                                        <option value="28">Getting Started</option>
                                        <option value="18">Computers</option>
                                        <option value="29">More to Explore</option>
                                        <option value="30">TV &amp; Video</option>
                                        <option value="31">Audio &amp; Theater</option>
                                        <option value="32">Camera, Photo </option>
                                        <option value="33">Cell Phones</option>
                                        <option value="34">Headphones</option>
                                        <option value="35">Video Games</option>
                                        <option value="36">Wireless Speakers</option>
                                        <option value="19">Electronics</option>
                                        <option value="37">Amazon Home</option>
                                        <option value="38">Kitchen &amp; Dining</option>
                                        <option value="39">Furniture</option>
                                        <option value="40">Bed &amp; Bath</option>
                                        <option value="41">Appliances</option>
                                        <option value="11">TV &amp; Audio</option>
                                        <option value="42">Chamcham</option>
                                        <option value="45">Office</option>
                                        <option value="47">Gaming</option>
                                        <option value="48">Chromebook</option>
                                        <option value="49">Refurbished</option>
                                        <option value="50">Touchscreen</option>
                                        <option value="51">Ultrabooks</option>
                                        <option value="52">Blouses</option>
                                        <option value="43">Sanai</option>
                                        <option value="53">Hard Drives</option>
                                        <option value="54">Graphic Cards</option>
                                        <option value="55">Processors (CPU)</option>
                                        <option value="56">Memory</option>
                                        <option value="57">Motherboards</option>
                                        <option value="58">Fans &amp; Cooling</option>
                                        <option value="59">CD/DVD Drives</option>
                                        <option value="44">Meito</option>
                                        <option value="60">Sound Cards</option>
                                        <option value="61">Cases &amp; Towers</option>
                                        <option value="62">Casual Dresses</option>
                                        <option value="63">Evening Dresses</option>
                                        <option value="64">T-shirts</option>
                                        <option value="65">Tops</option>
                                        <option value="12">Smartphone</option>
                                        <option value="66">Camera Accessories</option>
                                        <option value="68">Octa Core</option>
                                        <option value="69">Quad Core</option>
                                        <option value="70">Dual Core</option>
                                        <option value="71">7.0 Screen</option>
                                        <option value="72">9.0 Screen</option>
                                        <option value="73">Bags &amp; Cases</option>
                                        <option value="67">XailStation</option>
                                        <option value="74">Batteries</option>
                                        <option value="75">Microphones</option>
                                        <option value="76">Stabilizers</option>
                                        <option value="77">Video Tapes</option>
                                        <option value="78">Memory Card Readers</option>
                                        <option value="79">Tripods</option>
                                        <option value="13">Cameras</option>
                                        <option value="14">headphone</option>
                                        <option value="15">Smartwatch</option>
                                        <option value="16">Accessories</option>
                                    </select>
                                    <input type="text" placeholder="검색어를 입력하세요">
                                    <button class="header-search_btn" type="submit"><i
                                        class="ion-ios-search-strong"><span>검색</span></i></button>
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
                                <nav class="main-nav">
                                    <ul>
                                        <li class="dropdown-holder active"><a href="/ShoppingMallProject/main">Home</a>
                                        </li>
                                        <li class="megamenu-holder "><a href="/ShoppingMallProject/product/list">Shop
                                                <i class="ion-ios-arrow-down"></i></a>
                                            <ul class="hm-megamenu">
                                                <li><span class="megamenu-title">Shop Page Layout</span>
                                                    <ul>
                                                        <li><a href="shop-grid-fullwidth.html">Grid Fullwidth</a></li>
                                                        <li><a href="shop-left-sidebar.html">Left Sidebar</a></li>
                                                        <li><a href="shop-right-sidebar.html">Right Sidebar</a></li>
                                                        <li><a href="shop-list-fullwidth.html">List Fullwidth</a></li>
                                                        <li><a href="shop-list-left-sidebar.html">List Left Sidebar</a>
                                                        </li>
                                                        <li><a href="shop-list-right-sidebar.html">List Right
                                                                Sidebar</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><span class="megamenu-title">Single Product Style</span>
                                                    <ul>
                                                        <li><a href="single-product-gallery-left.html">Gallery Left</a>
                                                        </li>
                                                        <li><a href="single-product-gallery-right.html">Gallery
                                                                Right</a>
                                                        </li>
                                                        <li><a href="single-product-tab-style-left.html">Tab Style
                                                                Left</a>
                                                        </li>
                                                        <li><a href="single-product-tab-style-right.html">Tab Style
                                                                Right</a>
                                                        </li>
                                                        <li><a href="single-product-sticky-left.html">Sticky Left</a>
                                                        </li>
                                                        <li><a href="single-product-sticky-right.html">Sticky Right</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><span class="megamenu-title">Single Product Type</span>
                                                    <ul>
                                                        <li><a href="single-product.html">Single Product</a></li>
                                                        <li><a href="single-product-sale.html">Single Product Sale</a>
                                                        </li>
                                                        <li><a href="single-product-group.html">Single Product Group</a>
                                                        </li>
                                                        <li><a href="single-product-variable.html">Single Product
                                                                Variable</a>
                                                        </li>
                                                        <li><a href="single-product-affiliate.html">Single Product
                                                                Affiliate</a>
                                                        </li>
                                                        <li><a href="single-product-slider.html">Single Product
                                                                Slider</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
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
                                        <a href="#"><i class="ion-android-call"></i>+82 10-5570-0010</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Uren's Header Main Area End Here -->
