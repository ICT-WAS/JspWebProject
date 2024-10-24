<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	<title>회원가입</title>
	
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
         
            
            // 비밀번호 일치 확인
            if(document.getElementById('pwd').value !== document.getElementById('pwd-check').value) {
            	isValid = false;
            	document.getElementById('pwd-check').classList.add('is-invalid'); // 유효하지 않으면 클래스를 추가
            } else {
            	document.getElementById('pwd-check').classList.remove('is-invalid'); // 유효하지 않으면 클래스를 추가
            }

            if (isValid) {
            	form.submit();
            }
        });
    });
    </script>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
            }
        }).open();
    }
</script>
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="container mt-3">
		<h3>회원가입</h3>

		<form method="post" id="myForm" novalidate>
			<div class="mb-3 mt-3">
				<label for="name" class="form-label"><span class="required">*</span>이름:</label> <input type="text"
					class="form-control" id="name" name="name" required minlength=2 maxlength=10>
				<div class="invalid-feedback">이름은 2자 이상 10자 이하로 입력해주세요.</div>
			</div>
			<div class="mb-3 mt-3">
				<div class="row">
					<label for="id" class="form-label"><span style="color: red;">*</span>아이디:</label>
					<div class="col-sm-9">
						 <input type="text" class="form-control" id="id" name="id" required>
						 <div class="invalid-feedback">중복 확인을 체크해주세요.</div>
					</div>
					<div class="col-sm-3">
						<button type="button" class="btn btn-primary">중복확인</button>
					</div>
					
				</div>
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label"><span class="required">*</span>비밀번호:</label> <input
					type="password" class="form-control" id="pwd" name="pwd" required minlength=6 maxlength=20>
				<div class="invalid-feedback">비밀번호는 6자 이상 20자 이하로 입력해주세요.</div>
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label"><span style="color: red;">*</span>비밀번호 확인:</label> <input
					type="password" class="form-control" id="pwd-check" name="pwd-check" required>
				<div class="valid-feedback">비밀번호가 일치합니다.</div>
				<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
			</div>
			<div class="mb-3 mt-3">
				<label for="email" class="form-label"><span style="color: red;">*</span>이메일:</label> <input
					type="text" pattern=".+@+." class="form-control" id="email" name="email" required>
				<div class="invalid-feedback">올바른 이메일 형식이 아닙니다.</div>
			</div>
			
			<div class="mb-3 mt-3">
				<label for="phone-number" class="form-label"><span style="color: red;">*</span>전화번호:</label> 
				<div class="row">
				  <div class="col">
				  <input type="text" class="form-control" id="phone-number1" name="phone-number1" required pattern="[0-9]{3}">
				</div>
				  <div class="col">
				  <input type="text" class="form-control" id="phone-number2" name="phone-number2" required pattern="[0-9]{4}">
				</div>
				<div class="col">
				<input type="text" class="form-control" id="phone-number3" name="phone-number3" required pattern="[0-9]{4}">
				</div>
			</div>
			<div class="row mb-3 mt-3">
			<label for="address" class="form-label">주소:</label>
			    <div class="col">
			      <input type="text" id="sample4_postcode" class="form-control" placeholder="우편번호" name="postcode">
			    </div>
			    <div class="col">
			      <input type="text" id="sample4_roadAddress" class="form-control" placeholder="도로명 주소" name="roadAddress">
			    </div>
			    <div class="col">
			      <input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="주소 검색">
			    </div>
			</div>
			<div class="row mb-3 mt-3">
				<div class="col">
			      <input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세 주소" name="detailAddress">
			    </div>
			</div>
			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox" id="agree" name="agree" required>
				<label class="form-check-label"
					for="myCheck">이용 약관에 동의합니다.</label>
			</div>
			<button type="submit" class="btn btn-primary">가입</button>
		</form>
	</div>
    </div>

	<ui:footer />
	<ui:js />
</body>
</html>