<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
			background: #ffc400;
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
	            console.log("pw1:" + pw1);
	            console.log("pw2:" + pw2);
	            
	            if(pwFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (pw1 == "" || pw2 == "") {
	                showErrorMsg(oMsg,"비밀번호: 필수 정보입니다.");
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
		                                  <input class="signup" id="password1" name="password1" type="password" placeholder="비밀번호를 입력해주세요.">
		                                  <div class="error_text" id="passwordMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-6">
		                                  <label>비밀번호 확인*</label>
		                                  <input class="signup" id="password2" name="password2" type="password" placeholder="비밀번호를 입력해주세요.">
		                              </div>
		                              <div class="col-md-6">
		                                  <label>닉네임*</label>
		                                  <input class="signup" id="nickname" name="nickname" type="text" placeholder="닉네임을 입력해주세요.">
		                              </div>
		                              <div class="col-md-6">
		                                  <label>이름*</label>
		                                  <input class="signup" id="name" name="name" type="text" placeholder="이름을 입력해주세요.">
		                              </div>
		                              <div class="col-md-12">
		                                  <label>생년월일*</label>
		                                  <input class="signup" id="birth" name="birth" type="date" placeholder="생년월일을 선택해주세요">
		                              </div>
		                              <div class="col-md-12">
		                                  <label>이메일*</label>
		                                  <input class="signup" id="email" name="email" type="email" placeholder="이메일을 입력해주세요.">
		                              </div>
		                              
		                              
		                              <div class="col-md-3"></div>
		                              <div class="col-md-6">
		                              	<button class="uren-register_btn btn-signup">회원가입하기</button>
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
