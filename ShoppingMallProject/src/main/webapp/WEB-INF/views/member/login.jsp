<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
	
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <ui:css />
    <meta charset="UTF-8">
	
	<!-- 스크립트 -->
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
		.btn-login{
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
	                showErrorMsg(oMsg,"아이디를 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	            return true;
	        }
	        // id 종료
	        let pwFlag = false;
			
			$("#pw").blur(function() {
		        pwFlag = false;
		        checkPw();
		    });
			
			
	        function checkPw() {
	            let pw = $("#pw").val();
	            let oMsg = $("#pwMsg");
	            let oDiv = $("#pw");
	
	            if(pwFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (pw == "") {
	                showErrorMsg(oMsg,"비밀번호를 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	            
	            return true;
	        }
	        
	        function validCheck(){
	        	idFlag = checkId();
	        	pwFlag = checkPw();
				
				if(idFlag && pwFlag){
					return true;
				}else{
					return false;
				}
			}
	        
	        $(".btn-login").click(function(event){
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
	
    <div class="main-wrapper">
    	<!-- 메인 컨텐츠 -->
    	<div class="uren-login-register_area" >
		      <div class="container-sm " >
		          <div class="row" >
		              <div class="col-sm-12 col-md-12 col-xs-12 ">
		                  <form method="post">
		                      <div class="login-form">
		                          <h4 class="login-title">로그인</h4>
		                          <div class="row">
		                              <div class="col-md-12 col-12 mb--20">
		                                  <label>아이디*</label>
		                                  	<input id="id" name="id" type="text" placeholder="아이디를 입력해주세요." maxlength="20">
		                                  	<div class="error_text" id="idMsg" style="display:none;color:red;"></div>
		                              </div>
		                              <div class="col-md-12 col-12 mb--20">
		                                  <label>비밀번호*</label>
		                                  	<input id="pw" name="pw" type="password" placeholder="비밀번호를 입력해주세요." maxlength="16">
		                                  	<div class="error_text" id="pwMsg" style="display:none;color:red;"></div>
		                              </div>
		                              
		                              <div class="col-md-3"></div>
		                              <div class="col-md-6">
		                              	<button class="uren-login_btn btn-login" >로그인</button>
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
