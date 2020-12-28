
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="/aHayera/js/jquery.validate.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/mypage_util.css">
<link rel="stylesheet" type="text/css" href="css/mypage_modify.css">

<style>


</style>



<script type="text/javascript">

$(function(){
 

    $.validator.addMethod("regex", function(value, element, regexpr) {   //validate 시작함수
      if( regexpr.test(value) ){
         
         return true;
      
      }else{
      
         return false;
      }

   }, "Please enter a valid pasword.");
    
     
     
    $('#frm').validate({
        rules: {
         
          password_new:{
             required:true,
             minlength:8,
             regex : /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
          },
          password_new_ch:{
             equalTo: "#password_new",
             required:true
             
          }
          },
     
      messages:{
         
         password_new:{
            regex:"문자,숫자, 특수문자로 입력해주세요.",
            required:"필수 입력사항입니다.",
            minlength : "8자리 이상 입력하세요."
            
         },
         password_new_ch:{
            equalTo : "새비밀번호와 일치하지 않습니다",
            required:"필수 입력사항입니다."
         },
  
      }
   });
   
   
   
   $('#password').focusout(function () {
      
      
       $.ajax({
          url:"before_pw.do",
          contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
          success : function (before_pw) {
             
             if($('#password').val()!= before_pw){
                $('#password').val("");     //비밀번호가 맞지 않는 경우 초기화 해줌
                alert("현재 비밀번호를 입력하세요");
                
             }   else{
                alert("성공");
             }   
         },
         err : function (err) {
            console.log(err)
         }
       })   

   }) //현재 비밀번호 확인
 
   $('#password_new').focusout(function(){
       var password_new = $('#password_new').val();
   
      console.log($('#password_new').val().length);
      
     if($('#password_new').val().length < 8 ) {
      
     //   alert("8이하면 걍 삭제되줄수 없니?")
        $('#password_new').val(""); 
           
        return; 
       
        } 

   }) //8이하인 경우 삭제 됨
   
    $('#password_new_ch').focusout(function(){
       var password_new = $('#password_new').val();
       var password_new_ch = $('#password_new_ch').val();

     if(password_new!=password_new_ch) {
 
    
       $('#password_new').val(""); 
       $('#password_new_ch').val(""); 
       
       return; 
       
       }
    })	//새비번과 새비번확인 

    
   $('#last_btn').click(function () {
      
      $.ajax({
         url:"change_pop.do",
         contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
         data: {
            'password_new': $('#password_new').val(),
            'password_new_ch' : $('#password_new_ch').val()
         },
         success : function (result) { //1
           
        	alert(result+"성공");
            window.close()
            
         },
         err : function (err) {
            console.log(err)
         }
            
      })
         
      
   })//새 비밀번호 비교 확인

    
      $('#no_pw_btn').click(function () {
         
         //alert("취소")
         window.close()
         
      })
      
      
})


</script>
</head>


<body>

   <div class="main">
      <div class="container tim-container category_main"
         style="max-width: 300px; padding-top: 20px">
   
            <form id="frm"  method="get" action="updateMypage.do">
               <table>
                  <p class="costomer">
                  <div class="wrap-input100 validate-input"
                     data-validate="Repeat Password is required">
                     <span class="label-input100">현재 비밀번호</span>
                     <input class="input100" name="password"  type="password" id='password' password/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 validate-input"
                     data-validate="Name is required">
                     <span class="label-input100">새 비밀번호</span>
                     <input class="input100" name="password_new" id="password_new" type="password" password_new/>
                     <span class="focus-input100"></span>
                  </div>
                  
                  <div class="wrap-input100 validate-input"
                     data-validate="Name is required">
                     <span class="label-input100">새 비밀번호 확인</span>
                     <input class="input100" name="password_new_ch" id="password_new_ch" type="password" password_new_ch />               
                     <span class="focus-input100"></span>
                  </div>
                  
                  
                  
                  </p>
               </table>
            </form>

<!-- 현재 비밀번호 <input name="password"  type="text" id='password'/><br/>
새 비밀번호 <input name="password_new" id="password_new" type="text"/><br/>
새 비밀번호 확인 <input name="password_new_ch" id="password_new_ch" type="text"/><br/> -->
<br>
<br>
<br>

<input type="button" id="last_btn" value="변경">
<input type="button" id="no_pw_btn" value="취소">





</body>
</html>