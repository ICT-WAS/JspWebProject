<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	<title>아이디/비밀번호 찾기</title>
	
	<!-- 스크립트 -->
	
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="container mt-3">

		<input type="button" value="아이디 찾기">
		<input type="button" value="비밀번호 찾기">

		<h3>비밀번호 찾기</h3>

		<div class="form-check">
  		<input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>이메일로 찾기
  		<label class="form-check-label" for="radio1"></label>
  		
  		<input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">휴대전화번호로 찾기
  		<label class="form-check-label" for="radio2"></label>
		</div>
		
		<form method="post" novalidate>
			<div class="mb-3 mt-3">
				<label for="uname" class="form-label">아이디:</label> <input
					type="text" class="form-control" id="uid"
					placeholder="" name="uid" required>
			</div>
			<div class="mb-3 mt-3">
				<label for="uname" class="form-label">이메일:</label> <input
					type="text" class="form-control" id="uid"
					placeholder="" name="uid" required>
			</div>
			<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
		</form>
		</div>
    </div>

	<ui:footer />
	<ui:js />
</body>
</html>