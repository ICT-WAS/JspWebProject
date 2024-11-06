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
			
			// before 시작
			let beforeFlag = false;
			
			$("#before").blur(function() {
				beforeFlag = false;
		        checkBefore();
		    });
			
			
	        function checkBefore() {
	            let before = $("#before").val();
	            let oMsg = $("#beforeMsg");
	            let oDiv = $("#before");
	
	            if(beforeFlag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (before == "") {
	                showErrorMsg(oMsg,"현재 비밀번호를 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	            return true;
	        }
	        // id 종료
	        let after1Flag = false;
			
			$("#after1").blur(function() {
				after1Flag = false;
		        checkAfter1();
		    });
			
			
	        function checkAfter1() {
	            let after1 = $("#after1").val();
	            let oMsg = $("#after1Msg");
	            let oDiv = $("#after1");
	
	            if(after1Flag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (after1 == "") {
	                showErrorMsg(oMsg,"변경할 비밀번호를 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	            
	            return true;
	        }
	        
			let after2Flag = false;
			
			$("#after2").blur(function() {
				after2Flag = false;
		        checkAfter2();
		    });
			
			
	        function checkAfter2() {
	            let after2 = $("#after2").val();
	            let oMsg = $("#after2Msg");
	            let oDiv = $("#after2");
	
	            if(after2Flag) {
	                oMsg.hide();
	                return true;
	            }
	
	            if (after2 == "") {
	                showErrorMsg(oMsg,"변경할 비밀번호를 입력해주세요.");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	            
	            let after1 = $("#after1").val();
	            if(after1 != after2){
	            	showErrorMsg(oMsg,"변경할 비밀번호가 일치하지 않습니다");
	                oDiv.addClass("error");
	                return false;
	            }else{
	            	oDiv.removeClass("error");
	            	oMsg.hide();
	            }
	            
	            return true;
	        }
	        
	        function validCheck(){
	        	beforeFlag = checkBefore();
	        	after1Flag = checkAfter1();
	        	after2Flag = checkAfter2();
				
				if(beforeFlag && after1Flag && after2Flag){
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
    	<div class="login-form">
	          <div class="row">
	          <form action="" method="post">
	          	<h4>비밀번호 변경</h4>
	          	<input id="id" name="id" type="hidden" value="${id}">
	              <div class="col-md-12">
	                  <label>현재 비밀번호</label>
	                  <input id="before" name="before" type="password" placeholder="현재 비밀번호를 입력해주세요." maxlength="16">
	              </div>
	              <div class="error_text" id="beforeMsg" style="display:none;color:red;"></div>
	              <div class="col-md-12">
	                  <label>변경 비밀번호</label>
	                  <input id="after1" name="after1" type="password" placeholder="변경할 비밀번호를 입력해주세요." maxlength="16">
	              </div>
	              <div class="error_text" id="after1Msg" style="display:none;color:red;"></div>
	              <div class="col-md-12">
	                  <label>변경 비밀번호 확인</label>
	                  <input id="after2" name="after2" type="password" placeholder="변경할 비밀번호를 입력해주세요." maxlength="16">
	              </div>
	              <div class="error_text" id="after2Msg" style="display:none;color:red;"></div>
	              <div class="col-md-3"></div>
	              <div class="col-md-6">
	              	<button class="uren-login_btn btn-login" >변경하기</button>
	              </div>
	              <div class="col-md-3"></div>
	          </form>
	          </div>
	      </div>
    </div>
	<ui:footer />
	<ui:js />
</body>
</html>
