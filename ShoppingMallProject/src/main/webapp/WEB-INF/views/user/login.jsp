<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	<title>로그인</title>
	
	<!-- 스크립트 -->
	
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
<div class="container mt-3">
		<h3>로그인</h3>

		<form method="post" novalidate>
			<div class="mb-3 mt-3">
				<label for="uname" class="form-label">아이디:</label> <input
					type="text" class="form-control" id="uid"
					placeholder="" name="uid" required>
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호:</label> <input
					type="password" class="form-control" id="pwd"
					placeholder="" name="pswd" required>
				<div class="invalid-feedback">아이디 혹은 비밀번호가 일치하지 않습니다.</div>
			</div>
			<div class="form-check mb-3">
				<label class="form-check-label"> <input
					class="form-check-input" type="checkbox" name="remember">자동로그인
				</label>
				
				<a href="#">아이디/비밀번호 찾기</a>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
</div>
    </div>

	<ui:footer />
	<ui:js />
</body>
</html>