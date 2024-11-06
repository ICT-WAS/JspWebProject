<<<<<<< HEAD
<%@page import="com.shopping.dao.CategoryDao"%>
=======
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
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
<<<<<<< HEAD
		hideAllCategory();
		
		// parentId 없는 하위 선택 드롭박스 표시
		document.getElementById('0').style.display = 'block';
		
		document.getElementById("img").addEventListener("change", onImgChanged);
		
		// 가격 형변환
		
		
		// 폼 전송시 확인
		function checkValidation() {
			
			// 카테고리 미선택
			if(document.getElementById('categoryId').value == 'none') {
				 alert("카테고리를 선택하세요");
				 return false;
			}
			
			// 가격 숫자 형식이 아님
			
			
			// 재고 숫자 형식이 아님
			
			return true;
		}

		/* 

		[옵션 수정]
		옵션이름, 옵션가격, 재고

		[상품 수정]
		상품명, 이미지, 상세설명, 가격,
		재고, 브랜드, 카테고리


		<<결제시 옵션이 없는 상품 재고 확인 고려>> */

		// 재고, 가격 필드 유효성 검사 또는 형변환 필요
	});

	function hideAllCategory() {
		document.getElementById('categoryId').value = 'none';
		
		var categories = document.querySelectorAll('.category');
		categories.forEach(function(category) {
			category.style.display = 'none';
		});
	}

	function updateRootCategory() {
		hideAllCategory();

		var parentCategoryId = document.getElementById('rootCategory').value;
		var categoryDiv = document.getElementById('div' + parentCategoryId);
		var category = document.getElementById(parentCategoryId);
		
		if (categoryDiv != null) {
			const optionToSelect = category.querySelector('option[value="none"]');
			optionToSelect.selected = true;
			categoryDiv.style.display = 'block';
		}
	}
	
	function updateCategory() {
		var parentCategoryId = document.getElementById('rootCategory').value;
		var categoryId = document.getElementById(parentCategoryId).value;
		document.getElementById('categoryId').value = categoryId;
	}
	
	function onImgChanged() {
		var fileList = document.getElementById("fileList");
        fileList.innerHTML = ""; 
        
        var files = event.target.files;
        
        for (var i = 0; i < Math.min(files.length, 3); i++) {
            var file = files[i];
            
            // 이미지 파일인 경우 미리보기 표시
            if (file.type.startsWith("image/")) {
                var reader = new FileReader();
                
                reader.onload = (function(file) {
                    return function(e) {
                        // 파일 이름
                        var fileName = file.name;
                        
                        // 이미지 미리보기
                        var imgElement = document.createElement("img");
                        imgElement.src = e.target.result; // 읽은 이미지 데이터
                        imgElement.style.maxWidth = "100px"; // 미리보기 이미지 크기 제한
                        imgElement.style.margin = "5px"; // 간격 설정
                        
                        // 파일 이름과 이미지 미리보기 표시
                        var fileItem = document.createElement("div");
                        fileItem.appendChild(imgElement);
                        fileItem.appendChild(document.createTextNode(fileName));
                        fileList.appendChild(fileItem);
                    };
                })(file);
                
                reader.readAsDataURL(file); // 이미지 파일을 읽어 Data URL로 변환
            } else {
                var fileItem = document.createElement("div");
                fileItem.appendChild(document.createTextNode(file.name)); // 파일 이름만 표시
                fileList.appendChild(fileItem);
            }
        }
	}
	
</script>

<!-- style -->
<style>

table {
	table-layout: fixed;
	border-collapse: collapse; /* 테두리 겹침 방지 */
	width: 100%; /* 테이블 너비 조정 (선택 사항) */
}

th, td {
	border: none; /* 기본 테두리 제거 */
	padding: 8px; /* 셀 내부 여백 */
	s
}

.right-align {
	text-align: right;
}

.modal-body input[type="text"] {
	width: 90%;
}
=======
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
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
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
<<<<<<< HEAD
								<form action="/ShoppingMallProject/product/uploadServlet" method="POST" enctype="multipart/form-data" onsubmit="return checkValidation()">
=======
								<form method="POST">
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8 mt-3">
											<h3>상품 등록</h3>

											<div class="row">

												<!-- 카테고리 -->
<<<<<<< HEAD
												<div class="col-md-2 mt-3">
													<label for="category">카테고리</label>
												</div>

												<!-- 상위 카테고리 옵션 추가 -->
												<div class="col-md-4 mt-3">
													<div class="product-size_box">
														<select name="rootCategory" id="rootCategory"
															class="myniceselect nice-select"
															onchange="updateRootCategory()">
															<option value="0">상위 카테고리 선택</option>
=======
												<div class="col-md-4 mt-3">
													<label for="category">카테고리</label>
												</div>
												<div class="col-md-4 mt-3">
													<div class="product-size_box">
														<select name="${entry.key}Options" id="rootCategory"
															class="myniceselect nice-select" onchange="">
															<option value="옵션을 선택해주세요">상위 카테고리 선택</option>
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce

															<c:forEach var="category" items="${rootCategoryList}">
																<option value="${category.categoryId}">${category.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
<<<<<<< HEAD
												<!-- 상위 카테고리 옵션 추가 끝-->

												<!-- 하위 카테고리 옵션 추가-->
												<div class="col-md-4 mt-3">
													<div class="product-size_box">
														<div id="0" class="category">
															<select name="category" id="0"
																class="myniceselect nice-select">
																<option value="none">하위 카테고리 선택</option>
															</select>
														</div>

														<!-- rootCategoryId 카테고리의 하위 카테고리 드롭다운 생성-->
														<c:forEach var="rootCategoryId"
															items="${categoryMap.keySet()}">
															<div id="div${rootCategoryId }" class="category">
																<select name="category" id="${rootCategoryId }"
																	class="myniceselect nice-select"
																	onchange="updateCategory()">
																	<option value="none">하위 카테고리 선택</option>

																	<!-- rootCategoryId 카테고리의 하위 카테고리 목록 생성-->
																	<c:forEach var="category" items="${categoryMap.get(rootCategoryId)}">
																		<option value="${category.categoryId}" >${category.name}</option>
																	</c:forEach>
																</select>
															</div>
														</c:forEach>
													</div>
												</div>
												<!-- 하위 카테고리 옵션 추가 끝-->
												
												<input type="hidden" id="categoryId" name="categoryId">
=======
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
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
												<!-- 카테고리 끝-->

												<!-- 브랜드 -->
												<div class="col-md-4 mt-3">
													<label for="brand">브랜드</label>
												</div>
												<div class="col-md-8 mt-3">
<<<<<<< HEAD
													<input type="text" class="form-control" id="brand" name="brand" required maxlength="20">
=======
													<input type="text" class="form-control" id="brand">
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
												</div>
												<!-- 브랜드 끝-->

												<!-- 상품명 -->
												<div class="col-md-4 mt-3">
													<label for="product-name">상품명</label>
												</div>
												<div class="col-md-8 mt-3">
<<<<<<< HEAD
													<input type="text" class="form-control" id="productName" name="productName" required maxlength="50">
=======
													<input type="text" class="form-control" id="product-name">
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
												</div>
												<!-- 상품명 끝-->

												<!-- 이미지 -->
<<<<<<< HEAD
												<div class="col-md-12 mt-3">
													<label for="formFileMultiple" class="form-label">이미지</label>
													<input class="form-control" type="file"
														id="img" name="img" multiple accept="image/*">
													<p>최대 3개까지 선택 가능합니다.</p>
													<div id="fileList"></div>
=======
												<div class="col-md-4 mt-3">
													<label for="brand">이미지</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="file"><br> <input type="file"><br>
													<input type="file"><br>
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
												</div>
												<!-- 이미지 끝 -->

												<!-- 가격 -->
												<div class="col-md-4 mt-3">
													<label for="price">가격</label>
												</div>
												<div class="col-md-8 mt-3">
<<<<<<< HEAD
													<input type="text" class="form-control" id="price" name="price" required>
=======
													<input type="text" class="form-control" id="price">
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
												</div>
												<!-- 가격 끝 -->

												<!-- 재고 -->
												<div class="col-md-4 mt-3">
<<<<<<< HEAD
													<label for="quantity">재고</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="number" class="form-control" id="quantity" name="quantity" required>
=======
													<label for="option-name">재고</label>
												</div>
												<div class="col-md-8 mt-3">
													<input type="text" class="form-control" id="option-name">
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
												</div>
												<!-- 재고 끝-->


<<<<<<< HEAD
												<!-- 옵션 추가 버튼 -->
												<div class="col-md-12 mt-3">
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#myModal">옵션 추가</button>
												</div>
												<!-- 옵션 추가 버튼 끝-->
=======
												<!-- 옵션 수정 버튼 -->
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#myModal">옵션 수정</button>
												<!-- 옵션 수정 버튼 끝-->
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce

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
<<<<<<< HEAD
												<label for="description">상세설명</label>
												<textarea class="form-control" rows="20" id="description"
													name="description" required></textarea>
												<!-- 옵션 정보 끝 -->

												<!-- 등록 버튼 -->
												<div class="col-md-12 mt-3">
													<button type="submit" class="btn btn-warning">등록</button>
												</div>
=======
												<label for="detail">상세설명</label>
												<textarea class="form-control" rows="20" id="detail"
													name="text"></textarea>
												<!-- 옵션 정보 끝 -->

												<!-- 등록 버튼 -->
												<button type="submit" class="btn btn-warning">등록</button>
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
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
<<<<<<< HEAD
		
		<!-- 옵션 추가 모달 -->
=======

		<!-- 옵션 수정 모달 -->
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
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
<<<<<<< HEAD

						<table class="table">
							<tr>
								<th colspan="2">옵션명</th>
								<th>옵션가격</th>
								<th>재고</th>
							</tr>
							<tr>
								<td colspan="2"><input class="form-control" type="text" value="" /></td>
								<td><input type="text" class="form-control" value="" /></td>
								<td><input type="text" class="form-control" value="" /></td>
							</tr>
						</table>

						<div class="col-md-2 mt-3"></div>
						<div class="col-md-8 mt-3">
						<button type="button" class="btn btn-warning"
							onclick="onAddOptionButtonClicked">옵션 추가</button>
						</div>
						<div class="col-md-2 mt-3"></div>
=======
						<div class="col-md-12 mt-3"></div>
						<div class="col-md-2"></div>
						<div class="col-md-8 mt-3">
							<button type="button" class="btn btn-warning"
								onclick="onAddOptionButtonClicked">옵션 추가</button>
							<br> <label for="option-name">옵션명</label>
						</div>
						<div class="col-md-2"></div>
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
					</div>
				</div>
			</div>
		</div>
<<<<<<< HEAD


=======
>>>>>>> 51dd1424b061b9f4f6697effe481c757ea3e76ce
	</div>
	<ui:footer />
	<ui:js />
</body>
</html>