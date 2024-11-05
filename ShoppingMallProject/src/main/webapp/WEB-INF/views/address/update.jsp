<%@page import="com.shopping.model.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	<style>
	.park{
		background-color: #ffc400;
	    color: #ffffff;
	    font-size: 17px;
	    font-weight: 600;
	    height: 40px;
	    padding: 0;
	    width: 100%;
	    border: 1px solid transparent;
	    cursor: pointer;
	}
	</style>
	<!-- 스크립트 -->
	<script>
		document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('myForm');

        form.addEventListener('submit', function (event) {
            event.preventDefault();

            // 유효성 검사
            if (form.checkValidity() === false) {
                event.stopPropagation(); // 유효하지 않으면 이벤트 중지
            } else {
                // 유효한 경우의 동작 (예: 서버로 데이터 전송)
                console.log('Form is valid!');
            }
            
            // 중복검사도 필요
            
            const inputs = form.querySelectorAll('input');

            let isValid = true;

            inputs.forEach(input => {
                if (!input.checkValidity()) {
                    input.classList.add('is-invalid'); // 유효하지 않으면 클래스를 추가
                    isValid = false;
                } else {
                    input.classList.remove('is-invalid'); // 유효하지 않을 경우 클래스를 제거
                }
            });
            
         // 아이디 영문, 숫자만 가능하게
         	
         	let isPhoneNumber = /^010\d{8}$/;
            if (!isPhoneNumber.test(document.getElementById('phoneNumber').value)) {
                isValid = false;
                document.getElementById('phoneNumber').classList.add('is-invalid');
            }
            
            if (document.getElementById('postalCode').value == "") {
                isValid = false;
                document.getElementById('postalCode').classList.add('is-invalid');
                document.getElementById('roadNameAddress').classList.add('is-invalid');
            }

            if (isValid) {
            	form.submit();
            }
        });
    });
    </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postalCode').value = data.zonecode;
                document.getElementById("roadNameAddress").value = roadAddr;
            }
        }).open();
    }
</script>
</head>

<body class="template-color-1">
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="container mt-3">
		<h3>배송지 입력</h3>
	<%
		Address address = (Address)request.getAttribute("address");
	%>
		<form action="/ShoppingMallProject/address/update" method="post" id="myForm" novalidate>
		<input type="hidden" id="addressId" name="addressId" value="${address.addressId}">
			<div class="mb-3 mt-3">
				<label for="alias" class="form-label"><span class="required">*</span>배송지 명칭:</label> <input type="text"
					class="form-control" id="alias" name="alias" value="${address.alias}" required minlength=1 maxlength=10>
				<div class="invalid-feedback">배송지 명칭은 1자 이상 10자 이하로 입력해주세요.</div>
			</div>
			<div class="mb-3 mt-3">
				<label for="recipientName" class="form-label"><span class="required">*</span>수령인:</label> <input type="text"
					class="form-control" id="recipientName" name="recipientName" value="${address.recipientName}" required minlength=2 maxlength=10>
				<div class="invalid-feedback">수령인은 2자 이상 10자 이하로 입력해주세요.</div>
			</div>
			<div class="mb-3 mt-3">
				<label for="phoneNumber" class="form-label"><span class="required">*</span>전화번호:</label> <input type="text"
					class="form-control" id="phoneNumber" name="phoneNumber" value="${address.phoneNumber}" required minlength=11 maxlength=11>
				<div class="invalid-feedback">전화번호는 010으로 시작하는 11자리의 숫자만 입력 가능합니다.</div>
			</div>
			<div class="row mb-3 mt-3">
			<label for="address" class="form-label">주소:</label>
			    <div class="col">
			      <input type="text" id="postalCode" class="form-control" placeholder="우편번호" value="${address.postalCode}" name="postalCode" readonly="readonly" required>
			      <div class="invalid-feedback">배송지를 선택해주세요.</div>
			    </div>
			    <div class="col">
			      <input type="text" id="roadNameAddress" class="form-control" placeholder="도로명 주소" value="${address.roadNameAddress}" name="roadNameAddress" readonly="readonly" required>
			      
			    </div>
			    <div class="col">
			      <input type="button" class="park" onclick="sample4_execDaumPostcode()" value="주소 검색">
			    </div>
			    
			</div>
			<div class="row mb-3 mt-3">
				<div class="col">
			      <input type="text" id="detailAddress" class="form-control" value="${address.detailAddress}" placeholder="상세 주소" name="detailAddress">
			    </div>
			</div>
			<button type="submit" class="park">배송지 저장하기</button>
		</form>
	</div>
    </div>
	<ui:js />
</body>
</html>
