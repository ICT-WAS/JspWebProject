<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="ui" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html class="no-js" lang="zxx">


<head>
<ui:css />
<meta charset="UTF-8">

<!-- 스크립트 -->
<style>
</style>

</head>

<body class="template-color-1">
	<ui:header />

	<div class="main-wrapper">
		<div class="tab-content myaccount-tab-content"
			id="account-page-tab-content">

			<!-- 대쉬보드겸 회원관리 창 -->
			<h3>회원 수정</h3>
			<div class="tab-pane fade show active" id="account-user-management"
				role="tabpanel" aria-labelledby="account-dashboard-tab">
				<div class="myaccount-dashboard">
					<table class="table table-bordered">
						<thead>
							<tr>

							</tr>
						</thead>
						<tbody>
							<!-- 정보 넣기 -->
							<form action="${pageContext.request.contextPath}/admin/update" method="post">
								<input type="hidden" name="memberId" value="${member.member_id}" />
								<div>
									<td><label>닉네임</label> <input type="text"
										name="memberNickname" value="${member.nickname}" required /></td>
								</div>
								<div>
									<td><label>이메일</label> <input type="email"
										name="memberEmail" value="${member.email}" required /></td>
								</div>
								<div>
									<td><label>전화번호</label><input type="text"
										name="memberPhoneNumber" value="${member.phoneNumber}"
										required /></td>
								</div>
								<!-- 수정하기 버튼 -->
								
								<td><button type="submit" name="status" value="1"
										class="uren-btn uren-btn_primary uren-btn_sm">수정하기</button></td>

								<!-- 회원 활성화 버튼 -->
								<c:if test="${member.status == 1 }">
								<td><button type="submit" name="status" value="0"
										class="uren-btn uren-btn_dark uren-btn_sm">회원 비활성화</button></td>
								</c:if>
								<c:if test="${member.status == 0 }">
								<td><button type="submit" name="status" value="1"
										class="uren-btn uren-btn_dark uren-btn_sm">회원 활성화</button></td>
								</c:if>
								
							</form>
							<!-- 정보 끝 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<ui:footer />
	<ui:js />
</body>
</html>
