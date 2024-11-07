<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="ui" tagdir="/WEB-INF/tags"%>

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
		<div class="about-us-area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3"></div>
                    <div class="col-lg-3 col-md-5">
                        <div class="overview-img text-center img-hover_effect">
                            <a href="https://www.canva.com/design/DAGVqMDA4aQ/rKE1JQpc7b3oWLo3hQ2C0A/edit?utm_content=DAGVqMDA4aQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton">
                                <img class="img-full" src="${pageContext.request.contextPath}/static/template_assets/images/project.png" alt="Uren's About Us Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-7 d-flex align-items-center">
                        <div class="overview-content">
                            <h2><span>쇼킹몰</span> 에 오신 것을 환영합니다!</h2>
                            <p class="short_desc">아니 여기 없는게 없네? 물건이 너무 많아서 쇼킹!<br>
                            이 가격이면 남는게 있나? 가격이 너무 싸서 쇼킹!<br>
                            JSP로 만든 쇼킹몰 페이지, 너무 잘만들어서 쇼킹!<br>
                            쇼킹의 연속, 쇼킹몰에 오신 것을 환영합니다~!
                            </p>
                            <div class="uren-about-us_btn-area">
                                <a class="about-us_btn" href="/ShoppingMallProject/product/list">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </div>
        <div class="project-count-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-count text-center">
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-count text-center">
							<div class="count-icon">
                                <span class="ion-ios-briefcase-outline"></span>
                            </div>
                            <div class="count-title">
                                <h2 class="count"><%=request.getAttribute("productCount") %></h2>
                                <span>보유 상품 수</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-count text-center">
                            <div class="count-icon">
                                <span class="ion-happy-outline"></span>
                            </div>
                            <div class="count-title">
                                <h2 class="count"><%=request.getAttribute("memberCount") %></h2>
                                <span>이용 고객</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-count text-center">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>
