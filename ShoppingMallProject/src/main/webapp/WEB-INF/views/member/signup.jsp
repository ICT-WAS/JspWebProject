<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
    <title>회원가입</title>
	<style>
		.login-form{
			border: 2px solid #ffc400;
		}
		input.error {
		    border: 2px solid #ff3f3f;
		    color: #ff3f3f;
		}
		.error_text{
			padding-bottom: 20px;
		}
		.btn-signup{
		   background-color: #ffc400;
	       color: #ffffff;
	       font-size: 17px;
	       font-weight: 600;
	       height: 50px;
	       margin: 20px 0 0;
	       padding: 0;
	       width: 100%;
	       border: 1px solid transparent;
	       cursor: pointer; 
		}
	</style>
	<!-- 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/JavaScript">
		$(document).ready(function() {
			defaultScript();
			var fail = "${fail}"; 
        	if (fail) {
            	alert(fail);
        	}
   	 	});
		function defaultScript() {
			
			function showErrorMsg(obj, msg) {
		        obj.attr("class", "error_text item_style");
		        obj.html(msg);
		        obj.show();
		    }
			
			// Id 시작
			let idFlag = false;
			
			$("#id").blur(function() {
		        idFlag = false;
		        checkId();
		    });
			
			
	        function checkId() {
	            let id = $("#id").val();
	            let oMsg = $("#idMsg");
	            let oDiv = $("#id");
	
	            if(idFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (id == "") {
	                showErrorMsg(oMsg,"아이디: 필수 정보입니다.");
	                oDiv.addClass("error");
	                return false;
	            }
	
	            let isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	            if (!isID.test(id)) {
	                showErrorMsg(oMsg,"아이디: 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	
	            idFlag = false;
	
	            $.ajax({
	                type:"GET",
	                url: "ShoppingMallProject/signup?m=checkId&id=" + id,
	                success : function(data) {
	                    let result = data.substr(4);
	
	                    if (result == "Y") {
	                        idFlag = true;
	                        oMsg.hide();
	                        oDiv.removeClass("error");
	                    } else {
	                        showErrorMsg(oMsg, "아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.");
	                        oDiv.addClass("error");
	                    }
	                }
	            });
	            return true;
	        }
	        // id 종료
	        
	        // 휴대폰 시작
	        let phoneFlag = false;
			
			$("#phoneNumber").blur(function() {
				phoneNumberFlag = false;
		        checkPhoneNumber();
		    });
			
			
	        function checkPhoneNumber() {
	            let phoneNumber = $("#phoneNumber").val();
	            let oMsg = $("#phoneNumberMsg");
	            let oDiv = $("#phoneNumber");
	
	            if(phoneNumberFlag) {
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
	        // 휴대폰 종료
	        
	        // 비밀번호 시작
	        let pwFlag = false;
			
			$("#password1, #password2").blur(function() {
				pwFlag = false;
		        checkPw();
		    });
			
	        function checkPw() {
	            let pw1 = $("#password1").val();
	            let pw2 = $("#password2").val();
	            let oMsg = $("#passwordMsg");
	            let oDiv1 = $("#password1");
	            let oDiv2 = $("#password2");
	            
	            if(pwFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (pw1 == "" || pw2 == "") {
	                showErrorMsg(oMsg,"비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
	                oDiv1.addClass("error");
	                oDiv2.addClass("error");
	                return false;
	            }
	
	            let isPw = /^[A-Za-z0-9`\-=\\\[\];,\./~!@#\$%\^&\*\(\)_\+|\{\}:<>\?]{8,16}$/;

	            if (!isPw.test(pw1) || !isPw.test(pw2)) {
	                showErrorMsg(oMsg,"비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
	                oDiv1.addClass("error");
	                oDiv2.addClass("error");
	                return false;
	            }else{
	            	oDiv1.removeClass("error");
	            	oDiv2.removeClass("error");
	            	oMsg.hide();
	           }
	            
	           if(pw1 != pw2){
	        	   showErrorMsg(oMsg,"비밀번호: 비밀번호가 일치하지 않습니다.");
	               oDiv1.addClass("error");
	               oDiv2.addClass("error");
	               return false;
	           }else{
	            	oDiv1.removeClass("error");
	            	oDiv2.removeClass("error");
	            	oMsg.hide();
	           }
	
	            return true;
	        }
	        // 비밀번호 종료
	        
	        // 닉네임 시작
	        let nickFlag = false;
			
			$("#nickname").blur(function() {
				nickFlag = false;
				checkNickName();
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
	        // 닉네임 종료
	        
	        // 이름 시작
	        let nameFlag = false;
			
			$("#name").blur(function() {
				nameFlag = false;
				checkName();
		    });
			
			
	        function checkName() {
	            let name = $("#name").val();
	            let oMsg = $("#nameMsg");
	            let oDiv = $("#name");
	
	            if(nameFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (name.length < 2 || name.length > 10) {
	                showErrorMsg(oMsg,"이름: 2글자에서 10글자 사이로 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	
	            return true;
	        }
	        // 이름 종료
	        
	        // 생일 시작
	        let birthFlag = false;
	        
			$("#birth").blur(function() {
				birthFlag = false;
				checkBirth();
		    });
			
	        function checkBirth() {
	            let birth = $("#birth").val();
	            let oMsg = $("#birthMsg");
	            let oDiv = $("#birth");
	
	            if(birthFlag) {
	                oMsg.hide();
	                return true;
	            }
	            
	            if (birth == ""){
	            	showErrorMsg(oMsg, "생일: 필수 정보입니다.");
	                oDiv.addClass("error");
	                return false;
	            }
	            
	            let today = new Date();
	            let minDate = new Date("1920-01-01");
	            let selectedDate = new Date(birth);
	            
	            if (selectedDate > today || selectedDate < minDate) {
	                showErrorMsg(oMsg, "생일: 1920-01-01 부터 오늘 까지 중 선택하세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oMsg.hide();
	                oDiv.removeClass("error");
	            }
	
	            return true;
	        }
	        // 생일 종료
	        
	        // 이메일 시작
	        let emFlag = false;
	        
			$("#email").blur(function() {
				emFlag = false;
				checkEmail();
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
	            }else{
	            	oMsg.hide();
	                oDiv.removeClass("error");
	            }
	
	            return true;
	        }
	        // 이메일 종료

	        
	        function validCheck(){
	        	idFlag = checkId();
	        	phoneFlag = checkPhoneNumber();
	        	pwFlag = checkPw();
	        	nickFlag = checkNickName();
	        	nameFlag = checkName();
	        	birthFlag = checkBirth();
	        	emFlag = checkEmail();
				
				if(idFlag && phoneFlag && pwFlag && nickFlag && nameFlag && birthFlag && emFlag){
					return true;
				}else{
					return false;
				}
			}
	        $(".btn-signup").click(function(event){
	        	event.preventDefault()
	        	let bool = validCheck();
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
	
    <div class="main-wrapper" >
    	<!-- 메인 컨텐츠 -->
    	<div class="uren-login-register_area" >
		      <div class="container-sm " >
		          <div class="row" >
		              <div class="col-sm-12 col-md-12 col-xs-12 ">
		                  <form method="post">
		                      <div class="login-form">
		                          <h4 class="login-title">회원가입</h4>
		                          <div class="row">
		                              <div class="col-md-6 col-12 mb--20">
		                                  <label>아이디*</label>
		                                  	<input class="signup" id="id" name="id" type="text" placeholder="아이디를 입력해주세요." maxlength="20">
		                                  <div class="error_text" id="idMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-6 col-12 mb--20">
		                                  <label>전화번호*</label>
		                                  <input class="signup" id="phoneNumber" name="phoneNumber" type="text" maxlength="11" placeholder="휴대폰 번호 / 숫자만 입력해주세요.">
		                                  <div class="error_text" id="phoneNumberMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-6">
		                                  <label>비밀번호*</label>
		                                  <input class="signup" id="password1" name="password1" type="password" placeholder="비밀번호를 입력해주세요." maxlength="16">
		                                  <div class="error_text" id="passwordMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-6">
		                                  <label>비밀번호 확인*</label>
		                                  <input class="signup" id="password2" name="password2" type="password" placeholder="비밀번호를 입력해주세요." maxlength="16">
		                              </div>
		                              <div class="col-md-6">
		                                  <label>닉네임*</label>
		                                  <input class="signup" id="nickname" name="nickname" type="text" placeholder="닉네임을 입력해주세요." maxlength="10">
		                                  <div class="error_text" id="nicknameMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-6">
		                                  <label>이름*</label>
		                                  <input class="signup" id="name" name="name" type="text" placeholder="이름을 입력해주세요.">
		                                  <div class="error_text" id="nameMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <%
									        LocalDate today = LocalDate.now();
									        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									        String formattedDate = today.format(formatter);
									  %>
		                              <div class="col-md-12">
		                                  <label>생년월일*</label>
		                                  <input class="signup" id="birth" name="birth" type="date" placeholder="생년월일을 선택해주세요" min="1920-01-01" max="<%= formattedDate %>">
		                                  <div class="error_text" id="birthMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-12">
		                                  <label>이메일*</label>
		                                  <input class="signup" id="email" name="email" type="email" placeholder="이메일을 입력해주세요.">
		                                  <div class="error_text" id="emailMsg" style="display:none;color:red;"></div>
		                              </div>
		                              
		                              
		                              <div class="col-md-3"></div>
		                              <div class="col-md-6">
		                              	<button class="uren-register_btn btn-signup" >회원가입하기</button>
		                              </div>
		                              <div class="col-md-3"></div>
		                          </div>
		                      </div>
		                  </form>
		              </div>
		          </div>
		      </div>
    	</div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>
