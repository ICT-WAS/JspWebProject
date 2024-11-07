<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="ui" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

<script type="text/javascript">
	$(document).ready(function() {
		$('#btn-add-category').click(onAddCategoryButtonClicked);
		
		const table = document.querySelector('#option-table'); 
		table.querySelectorAll('tr').forEach(row => {
			$('.option-modify').click(onOptionModifyButtonClicked);
		    });
	});
	
	// 옵션 추가
	function onOptionModifyButtonClicked() {
		
		console.log('모달열기');
		var optionModal = new bootstrap.Modal(document.getElementById('optionModal'));
	    optionModal.show();
		
		var row = $(this).closest('tr');
        var productId = row.find('td').eq(0).text(); 
		console.log(productId);
		$.ajax({
            type: "POST",
            url: "/ShoppingMallProject/get-optionList",
            data: {
            	productId: productId
            },
            success: function(data) {
				const tbody = document.querySelector('#option-table');
                console.log(data);

                const rows = tbody.querySelectorAll('tr');
				
				// 각 tr을 순회하면서 특정 클래스를 가진 tr을 제외하고 삭제
				rows.forEach(row => {
				    if (!row.classList.contains('special-row')) {
				        row.remove();  // 특정 클래스를 가진 tr은 제외하고 삭제
				    }
				});

                // 받은 데이터를 테이블에 동적으로 추가
                data.forEach(option => {
            		console.log(option.optionName);
            		
                    const tr = document.createElement('tr');  // 새로운 행(tr) 생성

                 // 각 항목을 <td>로 생성하고, <input>을 추가
                    const tdOptionName = document.createElement('td');
                    const inputOptionName = document.createElement('input');  // <input> 요소 생성
                    inputOptionName.type = 'text';  // 텍스트 입력 타입 설정
                    inputOptionName.value = option.optionName;  // optionName 값을 input의 value로 설정
                    inputOptionName.classList.add('form-control');  // 부트스트랩 스타일을 적용 (선택 사항)
                    tdOptionName.appendChild(inputOptionName);  // <td>에 <input> 추가

                    const tdAdditionalPrice = document.createElement('td');
                    const inputAdditionalPrice = document.createElement('input');  // <input> 요소 생성
                    inputAdditionalPrice.type = 'number';  // 숫자 입력 타입 설정
                    inputAdditionalPrice.value = option.additionalPrice;  // additionalPrice 값을 input의 value로 설정
                    inputAdditionalPrice.classList.add('form-control');  // 부트스트랩 스타일을 적용 (선택 사항)
                    tdAdditionalPrice.appendChild(inputAdditionalPrice);  // <td>에 <input> 추가

                    const tdOptionStockquantity = document.createElement('td');
                    const inputOptionStockquantity = document.createElement('input');  // <input> 요소 생성
                    inputOptionStockquantity.type = 'number';  // 숫자 입력 타입 설정
                    inputOptionStockquantity.value = option.optionStockquantity;  // optionStockquantity 값을 input의 value로 설정
                    inputOptionStockquantity.classList.add('form-control');  // 부트스트랩 스타일을 적용 (선택 사항)
                    tdOptionStockquantity.appendChild(inputOptionStockquantity);  // <td>에 <input> 추가

                    // <tr>에 <td>들을 추가
                    tr.appendChild(tdOptionName);
                    tr.appendChild(tdAdditionalPrice);
                    tr.appendChild(tdOptionStockquantity);
                    
                    tbody.appendChild(tr);
                });
            },
            error: function(xhr) {
                if (xhr.status === 404) {
                    alert("오~류 : 404");
                } else if (xhr.status === 400) {
                    alert("오~류 : 400");
                } else {
                    alert("오~류 : ?");
                }
            }
        });
	}
	
	// 카테고리 추가
	function onAddCategoryButtonClicked() {
		
		var categoryName = document.getElementById('addCategoryName').value;
		
		// 이름이 비어있으면 안됨
		if(categoryName == null || categoryName === "") {
			console.log('이름이 비어있음');
			return;
		}
		
		// 이미 존재하는 카테고리인지 검사(TODO:)
		
		
		var parentCategoryId = parseInt(document.getElementById('addCategory').value);
		var parentCategoryLevel = 1;
		
		var categoryLevel = parentCategoryId == "none" ? 1 : parentCategoryLevel + 1 ;
		categoryName = parentCategoryId == "none" ? null : categoryName;
		
		console.log(categoryName);
		
		const data = {
				parentCategoryId: parentCategoryId,
                categoryName: categoryName,
                categoryLevel: categoryLevel
            };

            // Fetch API로 POST 요청 보내기
            fetch('/ShoppingMallProject/add-category', {
                method: 'POST', // HTTP 메소드: POST
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data) 
            })
            .then(response => {
            	  if (!response.ok) {  // 응답이 성공적이지 않은 경우
            	    throw new Error('Network response was not ok');
            	  }
            	  return response.json();  // JSON 형태로 응답을 파싱
            	})
            	.then(data => {
            	  console.log('Success:', data);  // 서버에서 반환한 데이터 처리
            	  
            	  // 
            	  $('.addCategoryModal-close').trigger('click');
            	  $('.modal-backdrop').hide();
            	  alert("성공적으로 저장되었습니다.");
            	  
            	})
            	.catch(error => {
            	  console.error('Error:', error);  // 오류 처리
            	});
	}
	</script>


<style>
table {
	border-collapse: collapse; /* 테두리 겹침 방지 */
	width: 100%; /* 테이블 너비 조정 (선택 사항) */
}

th, td {
	border: none; /* 기본 테두리 제거 */
	padding: 8px; /* 셀 내부 여백 */
	s
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
												</select> <input type="text" placeholder="검색어를 입력하세요">
												<button class="header-search_btn" type="submit">검색</button>
											</form>
										</div>
									</div>

									<div class="col-md-2"></div>
									<div class="col-md-3">
										<a href="/ShoppingMallProject/product/add"
											class="btn btn-warning btn-lg">상품 등록</a>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#addCategoryModal">카테고리
											추가</button>
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
													<td><input type="button"
														value="옵션 수정" class="button-modify option-modify"></td>
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

		<!-- 카테고리 추가 모달 -->
		<div class="modal fade" id="addCategoryModal" tabindex="-1"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">카테고리 추가</h5>
						<button type="button" class="close addCategoryModal-close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6 mt-3">
								<div class="product-size_box">
									<select name="addCategory" id="addCategory"
										class="myniceselect nice-select">
										<option value="none">상위 카테고리 없음</option>

										<c:forEach var="category" items="${rootCategoryList}">
											<option value="${category.categoryId}">${category.name}
												></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-6 mt-3">
								<input type="text" class="form-control" id="addCategoryName"
									required maxlength="20">
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 mt-3"></div>
							<div class="col-md-8 mt-3">
								<button type="button" class="btn btn-warning"
									id="btn-add-category">카테고리 추가</button>
							</div>
							<div class="col-md-2 mt-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 카테고리 추가 모달 끝 -->

		<!-- 옵션 수정 모달 -->
		<div class="modal fade" id="optionModal" tabindex="-1"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">옵션 추가</h5>
						<button type="button" class="close addOptionModal-close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- 옵션 -->

						<table class="table" id="option-table">
							<tr class="special-row">
								<th>옵션아이디</th>
								<th>옵션명</th>
								<th>옵션가격</th>
								<th>재고</th>
							</tr>
							<tr class="special-row">
								<td><input class="form-control" type="hidden"
									value="" /></td>
								<td><input class="form-control" type="text"
									value="" /></td>
								<td><input type="text" class="form-control" value="" /></td>
								<td><input type="text" class="form-control" value="" /></td>
							</tr>
						</table>

						<div class="col-md-2 mt-3"></div>
						<div class="col-md-8 mt-3">
							<button type="button" class="btn btn-warning" id="btn-add-option">옵션
								수정</button>
						</div>
						<div class="col-md-2 mt-3"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 옵션 수정 모달 끝 -->

	</div>
	<ui:footer />
	<ui:js />
</body>
</html>