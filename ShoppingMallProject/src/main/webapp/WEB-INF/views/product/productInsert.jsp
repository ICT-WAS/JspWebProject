<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="ui" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<ui:css />
<meta charset="UTF-8">

<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%
Map<Long, List<Category>> categoryMap = (Map<Long, List<Category>>) request.getAttribute("categoryMap");
List<Category> categoryList = new ArrayList<Category>();
%>
<script>
	$(document).ready(function() {
		$('#rootCategory').change(function() {
			var selectedValue = $(this).val();
			console.log(selectedValue);

			// 하위 카테고리 목록 바인딩

			/* [카테고리 등록]
			상위카테고리 선택

			[상품 등록]
			상품명, 이미지, 상세설명, 가격,
			재고, 브랜드, 판매상태, 카테고리

			[옵션 등록]
			옵션이름, 옵션가격, 재고

			===========================

			[옵션 수정]
			옵션이름, 옵션가격, 재고

			[상품 수정]
			상품명, 이미지, 상세설명, 가격,
			재고, 브랜드, 카테고리


			<<결제시 옵션이 없는 상품 재고 확인 고려>> */

			// 재고, 가격 필드 유효성 검사 또는 형변환 필요
			// 이미지 업로드 필드 추가
			// 옵션 등록 버튼 추가
			// 폼 보내기 버튼 추가
			// 상품 저장
		});
	});
</script>


<!-- style -->
<style>
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
								<form method="POST">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8 mt-3">
											<h3>상품 등록</h3>

											<div class="row">

												<!-- 카테고리 -->
												<div class="col-md-4 mt-3">
													<label for="category">카테고리</label>
												</div>
												<div class="col-md-4 mt-3">
													<div class="product-size_box">
														<select name="${entry.key}Options" id="rootCategory"
															class="myniceselect nice-select" onchange="">
															<option value="옵션을 선택해주세요">상위 카테고리 선택</option>

															<c:forEach var="category" items="${rootCategoryList}">
																<option value="${category.categoryId}">${category.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-md-4 mt-3">
													<div class="product-size_box">
														<select name="${entry.key}Options" id="category"
															class="myniceselect nice-select">
															<option value="옵션을 선택해주세요">하위 카테고리 선택</option>

															<c:forEach var="category" items="<%=categoryList%>">
																<option value="옵션을 선택해주세요">${category.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<!-- 카테고리 끝-->

												<!-- 브랜드 -->
												<div class="col-md-4 mt-3">
													<label for="brand">브랜드</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="text" class="form-control" id="brand">
												</div>
												<!-- 브랜드 끝-->

												<!-- 상품명 -->
												<div class="col-md-4 mt-3">
													<label for="product-name">상품명</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="text" class="form-control" id="product-name">
												</div>
												<!-- 상품명 끝-->

												<!-- 이미지 -->
												<div class="col-md-4 mt-3">
													<label for="brand">이미지</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="file"><br> <input type="file"><br>
													<input type="file"><br>
												</div>
												<!-- 이미지 끝 -->

												<!-- 가격 -->
												<div class="col-md-4 mt-3">
													<label for="price">가격</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="text" class="form-control" id="price">
												</div>
												<!-- 가격 끝 -->

												<!-- 재고 -->
												<div class="col-md-4 mt-3">
													<label for="option-name">재고</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="text" class="form-control" id="option-name">
												</div>
												<!-- 재고 끝-->


												<!-- 옵션 수정 버튼 -->
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#myModal">옵션 수정</button>
												<!-- 옵션 수정 버튼 끝-->

												<!-- 옵션 정보 -->
												<table class="table">
													<tr>
														<td colspan="2">옵션명</td>
														<td>옵션가</td>
														<td>남은 수량</td>
													</tr>
													<tr>
														<td colspan="2">옵션이름</td>
														<td>+3,000</td>
														<td>00</td>
													</tr>
												</table>

												<!-- 상세설명 -->
												<label for="detail">상세설명</label>
												<textarea class="form-control" rows="20" id="detail"
													name="text"></textarea>
												<!-- 옵션 정보 끝 -->

												<!-- 등록 버튼 -->
												<button type="submit" class="btn btn-warning">등록</button>
												<!-- 등록 버튼 끝 -->

											</div>
											<div class="col-md-2"></div>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- 옵션 수정 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">옵션 추가</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- 옵션 -->
						<div class="col-md-12 mt-3"></div>
						<div class="col-md-2"></div>
						<div class="col-md-8 mt-3">
							<button type="button" class="btn btn-warning"
								onclick="onAddOptionButtonClicked">옵션 추가</button>
							<br> <label for="option-name">옵션명</label>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<ui:footer />
	<ui:js />
</body>
</html>