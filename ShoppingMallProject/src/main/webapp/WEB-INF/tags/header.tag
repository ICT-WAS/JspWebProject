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
                                        <a href="#miniCart" class="minicart-btn toolbar-btn">
                                            <div class="minicart-count_area">
                                                <span class="item-count">3</span>
                                                <i class="ion-bag"></i>
                                            </div>
                                        </a>
                                    </li>
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
                                        <li class="right-menu"><a href="shop-left-sidebar.html">Car Parts</a>
                                            <ul class="cat-mega-menu">
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Active body control</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Aluminum Nonstick</a></li>
                                                        <li><a href="shop-left-sidebar.html">Calphalon</a></li>
                                                        <li><a href="shop-left-sidebar.html">Contemporary</a></li>
                                                        <li><a href="shop-left-sidebar.html">Hard-Anodized</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Battery Indicator</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Sanai laptops</a></li>
                                                        <li><a href="shop-left-sidebar.html">Byteflight</a></li>
                                                        <li><a href="shop-left-sidebar.html">EXcaliberPC</a></li>
                                                        <li><a href="shop-left-sidebar.html">Gaming Laptops</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Remote Starter</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Dual Core</a></li>
                                                        <li><a href="shop-left-sidebar.html">Gaming Monitors</a></li>
                                                        <li><a href="shop-left-sidebar.html">GPS Monitors</a></li>
                                                        <li><a href="shop-left-sidebar.html">Heat Shield</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="right-menu"><a href="shop-left-sidebar.html">Tools &amp;
                                                Accessories</a>
                                            <ul class="cat-mega-menu cat-mega-menu-2">
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Drills</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Angle Drills</a></li>
                                                        <li><a href="shop-left-sidebar.html">Combi Drills</a></li>
                                                        <li><a href="shop-left-sidebar.html">Drill Drivers</a></li>
                                                        <li><a href="shop-left-sidebar.html">PercussionDrills</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Nail Guns</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Air Nail Guns</a></li>
                                                        <li><a href="shop-left-sidebar.html">Cordless Nail Guns</a></li>
                                                        <li><a href="shop-left-sidebar.html">Electric Nail Guns</a></li>
                                                        <li><a href="shop-left-sidebar.html">Gas Nail Guns</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Sanders</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">1/2 Sheet Sanders</a></li>
                                                        <li><a href="shop-left-sidebar.html">1/4 Sheet Sanders</a></li>
                                                        <li><a href="shop-left-sidebar.html">Belt Sanders</a></li>
                                                        <li><a href="shop-left-sidebar.html">Drywall Sanders</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Saws</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Circular Saws</a></li>
                                                        <li><a href="shop-left-sidebar.html">Jigsaws</a></li>
                                                        <li><a href="shop-left-sidebar.html">Mitre Saws</a></li>
                                                        <li><a href="shop-left-sidebar.html">Reciprocating Saws</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="right-menu"><a href="shop-left-sidebar.html">Suspension Systems</a>
                                            <ul class="cat-mega-menu cat-mega-menu-3">
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Clothing</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Cuisinart</a></li>
                                                        <li><a href="shop-left-sidebar.html">Homeinart</a></li>
                                                        <li><a href="shop-left-sidebar.html">Kettle Stainless</a></li>
                                                        <li><a href="shop-left-sidebar.html">Steel Stovetop</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">Jewelry</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Hard Anodized</a></li>
                                                        <li><a href="shop-left-sidebar.html">Scratch Resistant</a></li>
                                                        <li><a href="shop-left-sidebar.html">Thermo-Spot</a></li>
                                                        <li><a href="shop-left-sidebar.html">Ultimate</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="right-menu"><a href="shop-left-sidebar.html">Turbo System</a>
                                            <ul class="cat-mega-menu">
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">BMW</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Dining Chairs</a></li>
                                                        <li><a href="shop-left-sidebar.html">Dining Tables</a></li>
                                                        <li><a href="shop-left-sidebar.html">Gramophone</a></li>
                                                        <li><a href="shop-left-sidebar.html">Sideboards</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">FORD</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Chairs & Sofas</a></li>
                                                        <li><a href="shop-left-sidebar.html">Chest</a></li>
                                                        <li><a href="shop-left-sidebar.html">Loungers</a></li>
                                                        <li><a href="shop-left-sidebar.html">Sets</a></li>
                                                    </ul>
                                                </li>
                                                <li class="right-menu cat-mega-title">
                                                    <a href="shop-left-sidebar.html">POSCHER</a>
                                                    <ul>
                                                        <li><a href="shop-left-sidebar.html">Bed</a></li>
                                                        <li><a href="shop-left-sidebar.html">Daybed</a></li>
                                                        <li><a href="shop-left-sidebar.html">Futon</a></li>
                                                        <li><a href="shop-left-sidebar.html">Hammock</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="right-menu"><a href="shop-left-sidebar.html">Oils & Fluids</a>
                                            <ul class="cat-dropdown">
                                                <li>
                                                    <a href="shop-left-sidebar.html">Daylesford</a>
                                                    <a href="shop-left-sidebar.html">Delaware</a>
                                                    <a href="shop-left-sidebar.html">Fayence</a>
                                                    <a href="shop-left-sidebar.html">Franzea</a>
                                                    <a href="shop-left-sidebar.html">Mable</a>
                                                    <a href="shop-left-sidebar.html">Mobo</a>
                                                    <a href="shop-left-sidebar.html">Pippins</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="right-menu"><a href="shop-left-sidebar.html">Exterior</a>
                                            <ul class="cat-dropdown cat-dropdown-2">
                                                <li>
                                                    <a href="shop-left-sidebar.html">Coffee & side tables</a>
                                                    <a href="shop-left-sidebar.html">Living room lighting</a>
                                                    <a href="shop-left-sidebar.html">Living room storage</a>
                                                    <a href="shop-left-sidebar.html">Living room textiles & rugs</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="shop-left-sidebar.html">Body Parts</a></li>
                                        <li><a href="shop-left-sidebar.html">Interior</a></li>
                                        <li><a href="shop-left-sidebar.html">Audio</a></li>
                                        <li><a href="shop-left-sidebar.html">End Tables</a></li>
                                        <li class="rx-child"><a href="shop-left-sidebar.html">Uncategorized</a></li>
                                        <li class="rx-child"><a href="shop-left-sidebar.html">Appliances</a></li>
                                        <li class="rx-parent">
                                            <a class="rx-default">More Categories</a>
                                            <a class="rx-show">Collapse</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="custom-menu_col col-12 d-none d-lg-block">
                            <div class="main-menu_area position-relative">
                                <nav class="main-nav">
                                    <ul>
                                        <li class="dropdown-holder active"><a href="index.html">Home</a>
                                            <ul class="hm-dropdown">
                                                <li><a href="index.html">Home One</a></li>
                                                <li><a href="index-2.html">Home Two</a></li>
                                                <li><a href="index-3.html">Home Three</a></li>
                                            </ul>
                                        </li>
                                        <li class="megamenu-holder "><a href="shop-left-sidebar.html">Shop <i
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
                                        <li><a href="javascript:void(0)">Specials</a></li>
                                        </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="custom-setting_col col-12 d-none d-lg-block">
                            <div class="ht-right_area">
                                <div class="ht-menu">
                                    <ul>
                                        <li><a href="/ShoppingMallProject/member/info"><span class="fa fa-user"></span> 
                                        <span>
                                        <c:if test="${sessionScope.id == null}">
                                        	로그인
                                        </c:if>
                                        <c:if test="${sessionScope.id != null}">
										    <c:out value="${sessionScope.id}" /> &nbsp; 님
										</c:if>
                                        </span><i class="fa fa-chevron-down"></i></a>
                                        	<ul class="ht-dropdown ht-my_account">
                                            	<c:if test="${sessionScope.id == null}">
                                            		<li><a href="/ShoppingMallProject/login">로그인</a></li>
                                               		<li><a href="/ShoppingMallProject/signup">회원가입</a></li>
                                            	</c:if>
                                            	<c:if test="${sessionScope.id != null}">
                                            		<li><a href="/ShoppingMallProject/member/info">내 정보</a></li>
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
                                        <li class="dropdown-holder active"><a href="index.html">Home</a>
                                            <ul class="hm-dropdown">
                                                <li><a href="index.html">Home One</a></li>
                                                <li><a href="index-2.html">Home Two</a></li>
                                                <li><a href="index-3.html">Home Three</a></li>
                                            </ul>
                                        </li>
                                        <li class="megamenu-holder "><a href="shop-left-sidebar.html">Shop
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
                                        <li><a href="javascript:void(0)">Specials</a></li>
                                        <li class=""><a href="javascript:void(0)">Pages <i
                                                class="ion-ios-arrow-down"></i></a>
                                            <ul class="hm-dropdown">
                                                <li><a href="my-account.html">내 정보</a></li>
                                                <li><a href="login-register.html">로그인 | 회원가입</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="cart.html">장바구니</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="compare.html">Compare</a></li>
                                                <li><a href="faq.html">FAQ</a></li>
                                                <li><a href="404.html">404 Error</a></li>
                                            </ul>
                                        </li>
                                        <li class=""><a href="about-us.html">About Us</a></li>
                                        <li class=""><a href="contact.html">Contact</a></li>
                                        <li class=""><a href="blog-left-sidebar.html">Blog <i
                                                class="ion-ios-arrow-down"></i></a>
                                            <ul class="hm-dropdown">
                                                <li><a href="blog-left-sidebar.html">Grid View</a>
                                                    <ul class="hm-dropdown hm-sub_dropdown">
                                                        <li><a href="blog-2-column.html">Column Two</a></li>
                                                        <li><a href="blog-3-column.html">Column Three</a></li>
                                                        <li><a href="blog-left-sidebar.html">Left Sidebar</a></li>
                                                        <li><a href="blog-right-sidebar.html">Right Sidebar</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="blog-list-left-sidebar.html">List View</a>
                                                    <ul class="hm-dropdown hm-sub_dropdown">
                                                        <li><a href="blog-list-fullwidth.html">List Fullwidth</a></li>
                                                        <li><a href="blog-list-left-sidebar.html">List Left Sidebar</a>
                                                        </li>
                                                        <li><a href="blog-list-right-sidebar.html">List Right
                                                                Sidebar</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><a href="blog-details-left-sidebar.html">Blog Details</a>
                                                    <ul class="hm-dropdown hm-sub_dropdown">
                                                        <li><a href="blog-details-left-sidebar.html">Left Sidebar</a>
                                                        </li>
                                                        <li><a href="blog-details-right-sidebar.html">Right Sidebar</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li><a href="blog-gallery-format.html">Blog Format</a>
                                                    <ul class="hm-dropdown hm-sub_dropdown">
                                                        <li><a href="blog-gallery-format.html">Gallery Format</a></li>
                                                        <li><a href="blog-audio-format.html">Audio Format</a></li>
                                                        <li><a href="blog-video-format.html">Video Format</a></li>
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
                                        <a href="#miniCart" class="minicart-btn toolbar-btn">
                                            <div class="minicart-count_area">
                                                <span class="item-count">3</span>
                                                <i class="ion-bag"></i>
                                            </div>
                                            <div class="minicart-front_text">
                                                <span>장바구니</span>
                                                <span class="total-price">462.4</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="contact-us_wrap">
                                        <a href="tel://+123123321345"><i class="ion-android-call"></i>+123 321 345</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="offcanvas-minicart_wrapper" id="miniCart">
                <div class="offcanvas-menu-inner">
                    <a href="#" class="btn-close"><i class="ion-android-close"></i></a>
                    <div class="minicart-content">
                        <div class="minicart-heading">
                            <h4>장바구니</h4>
                        </div>
                        <ul class="minicart-list">
                            <li class="minicart-product">
                                <a class="product-item_remove" href="javascript:void(0)"><i
                                    class="ion-android-close"></i></a>
                                <div class="product-item_img">
                                    <img src="${pageContext.request.contextPath}/static/template_assets/images/product/small-size/1.jpg" alt="Uren's Product Image">
                                </div>
                                <div class="product-item_content">
                                    <a class="product-item_title" href="shop-left-sidebar.html">Autem ipsa ad</a>
                                    <span class="product-item_quantity">1 x $145.80</span>
                                </div>
                            </li>
                            <li class="minicart-product">
                                <a class="product-item_remove" href="javascript:void(0)"><i
                                    class="ion-android-close"></i></a>
                                <div class="product-item_img">
                                    <img src="${pageContext.request.contextPath}/static/template_assets/images/product/small-size/2.jpg" alt="Uren's Product Image">
                                </div>
                                <div class="product-item_content">
                                    <a class="product-item_title" href="shop-left-sidebar.html">Tenetur illum amet</a>
                                    <span class="product-item_quantity">1 x $150.80</span>
                                </div>
                            </li>
                            <li class="minicart-product">
                                <a class="product-item_remove" href="javascript:void(0)"><i
                                    class="ion-android-close"></i></a>
                                <div class="product-item_img">
                                    <img src="${pageContext.request.contextPath}/static/template_assets/images/product/small-size/3.jpg" alt="Uren's Product Image">
                                </div>
                                <div class="product-item_content">
                                    <a class="product-item_title" href="shop-left-sidebar.html">Non doloremque placeat</a>
                                    <span class="product-item_quantity">1 x $165.80</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="minicart-item_total">
                        <span></span>
                        <span class="ammount">$462.4‬0</span>
                    </div>
                    <div class="minicart-btn_area">
                        <a href="cart.html" class="uren-btn uren-btn_dark uren-btn_fullwidth">Minicart</a>
                    </div>
                    <div class="minicart-btn_area">
                        <a href="checkout.html" class="uren-btn uren-btn_dark uren-btn_fullwidth">구매하기</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- Uren's Header Main Area End Here -->
