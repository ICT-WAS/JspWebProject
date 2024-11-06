<%@page import="com.shopping.model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	<style>
	input.error {
	    border: 2px solid #ff3f3f;
	    color: #ff3f3f;
	}
	.error_text{
		padding-bottom: 20px;
	}
	</style>
	<!-- 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/JavaScript">
	$(document).ready(function() {
		defaultScript();
	});
		function defaultScript() {
			function showErrorMsg(obj, msg) {
		        obj.attr("class", "error_text item_style");
		        obj.html(msg);
		        obj.show();
		    }
			
			let phoneFlag = false;
			
			$("#phoneNumber").blur(function() {
				phoneFlag = false;
		        phoneFlag = checkPhoneNumber();
		    });
			
			
	        function checkPhoneNumber() {
	            let phoneNumber = $("#phoneNumber").val();
	            let oMsg = $("#phoneNumberMsg");
	            let oDiv = $("#phoneNumber");
	
	            if(phoneFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (phoneNumber == "") {
	                showErrorMsg(oMsg,"전화번호: 필수 정보입니다.");
	                oDiv.addClass("error");
	                return false;
	            }
	
	            let isPhoneNumber = /^010\d{8}$/;
	            if (!isPhoneNumber.test(phoneNumber)) {
	                showErrorMsg(oMsg,"전화번호: 010으로 시작하는 11자리의 숫자만 입력 가능합니다.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	
	            return true;
	        }
			
let nickFlag = false;
			
			$("#nickname").blur(function() {
				nickFlag = false;
				nickFlag = checkNickName();
		    });
			
			
	        function checkNickName() {
	            let nickname = $("#nickname").val();
	            let oMsg = $("#nicknameMsg");
	            let oDiv = $("#nickname");
	
	            if(nickFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (nickname.length < 2 || nickname.length > 10) {
	                showErrorMsg(oMsg,"닉네임: 2글자에서 10글자 사이로 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }
	            if (nickname.includes("관리자")) {
	            	showErrorMsg(oMsg,"닉네임: 사용할 수 없는 단어가 포함되어 있습니다.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	
	            
	            return true;
	        }
	        
			let emFlag = false;
	        
			$("#email").blur(function() {
				emFlag = false;
				emFlag = checkEmail();
		    });
			
	        function checkEmail() {
	            let email = $("#email").val();
	            let oMsg = $("#emailMsg");
	            let oDiv = $("#email");
	
	            if(emFlag) {
	                oMsg.hide();
	                return true;
	            }
	            
	            if (email == "") {
	                showErrorMsg(oMsg,"이메일: 필수 정보입니다.");
	                oDiv.addClass("error");
	                return false;
	            }
	            
	            let isEm = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	            if(!isEm.test(email)){
	            	showErrorMsg(oMsg, "이메일: 양식을 지켜주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oMsg.hide();
	                oDiv.removeClass("error");
	            }
				
	            var emailList = [];
	            <%
	            	Member me = (Member)request.getAttribute("member");
	            	String before = me.getEmail();
	            %>
	            <% 
	                List<String> emailListFromRequest = (List<String>) request.getAttribute("emailList");
	                for (String email : emailListFromRequest) {
	                	if(!before.equals(email)){
	                    	out.print("emailList.push('" + email + "');");
	                	}
	                }
	            %>
	            if(emailList.includes(email)){
	            	showErrorMsg(oMsg, "이메일: 사용할 수 없는 이메일입니다. 다른 이메일를 입력해 주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oMsg.hide();
	                oDiv.removeClass("error");
	            }
	            
	            return true;
	        }
	        
			function validCheck(){
	            phoneFlag = checkPhoneNumber();
	            nickFlag = checkNickName();
	            emFlag = checkEmail();

	            return phoneFlag && nickFlag && emFlag;
	        }
	        $(".btn-login").click(function(event){
	        	event.preventDefault()
	        	let bool = validCheck();
	        	console.log("Validation Result:", bool);
	        	if(bool){
	        		$(this).closest('form').submit();
	        	}else{
	        		alert("유효하지 않은 입력입니다. 다시 확인해 주세요.");
	        	}
	        });
	 	}
	</script>
</head>

<body class="template-color-1">
	<ui:header />
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="row">
    	<div class="col-md-3"></div>
    	<div class="col-md-6">
    <form action="" method="post">
    	<div class="login-form">
	          <div class="row">

	          <h4 class="small-title">정보 수정</h4>
	          <input id="memberId" name="memberId" type="hidden" value="${member.member_id}">
              <div class="col-md-6 col-12 mb--20">
                  <label>전화번호</label>
                  <input id="phoneNumber" name="phoneNumber" type="text" value="${member.phoneNumber}" maxlength="11" >
                  <div class="error_text" id="phoneNumberMsg" style="display:none;color:red;"></div>
              </div>
              <div class="col-md-6">
                  <label>닉네임</label>
                  <input id="nickname" name="nickname" type="text" value="${member.nickname}" maxlength="10" >
                  <div class="error_text" id="nicknameMsg" style="display:none;color:red;"></div>
              </div>
              <div class="col-md-12">
                  <label>이메일</label>
                  <input id="email" name="email" type="email" value="${member.email}" >
                  <div class="error_text" id="emailMsg" style="display:none;color:red;"></div>
              </div>
<div class="col-md-3"></div>
	              <div class="col-md-6">
	              	<button class="uren-login_btn btn-login" >변경하기</button>
	              </div>
	              <div class="col-md-3"></div>
	      </div>
    	</div>
    </form>
    </div>
    <div class="col-md-3"></div>
</div>
</div>
	<ui:footer />
	<ui:js />
</body>
</html>
