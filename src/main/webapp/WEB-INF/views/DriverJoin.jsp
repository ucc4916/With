<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>기사 회원가입</title><title>With</title><title>With</title>
    <link href="resources/boot/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/boot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="resources/boot/css/style.css" media="screen" title="no title" charset="utf-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#a{
text-align:center;
}
</style>
<script>
var EmailTest;
var hangul;
var idcheck;
var Password;
Password = 0;
idcheck = 0;
hangul = 0;
console.log("1단계 idcheck"+idcheck);

/* JSON() JavaScript Object Notation */
function idOverlap() {
	var hangultest;
	hangultest = hangul;
		$.ajax({
			type : "post",
			url : "idOverlap", 
			data : {"id" : frm.Id.value},
			dataType : "text", //retrun Type
			success : function(data){
				if(data=="1" && hangultest == 1){
					alert("이 아이디는 사용 가능합니다.");
					idcheck = 1; 
				}else{
					alert("이 아이디는 사용 할 수 없습니다.");
					idcheck = 2; 
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
		});
	}
	

 $(function(){
	 var PasswordCheck;
  $('#Password').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#CheckPassword').keyup(function(){
   if($('#Password').val()!=$('#CheckPassword').val()){
	   $('font[name=check1]').empty();
	   $('font[name=check]').text('');
    $('font[name=check]').html("암호가 일치하지 않습니다.");
    PasswordCheck = 0;
   }else{
	$('font[name=check]').empty();
    $('font[name=check1]').text('');
    $('font[name=check1]').html("암호가 일치합니다.");
    PasswordCheck = 1;
   }
   Password = PasswordCheck;
  }); //#chpass.keyup
 });

 $(function(){
	 var hangul1;
	 hangul1 = 2;
	 $('#inputNumber').keyup(function(){
 	$('font[name=check2]').text('');
	   var lang = document.getElementById('inputNumber').value;
       var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
       if(check.test(lang)){
    	   $('font[name=check2]').text('');
    	    $('font[name=check2]').html("한글은 사용할 수 없습니다.");
    	    hangul1 = 0;
    	    console.log(hangul1);
       }else{
    	   hangul1 = 1;
   	    console.log(hangul1);
       }
       hangul = hangul1;
});
 });
 
 
 function EmailOverlap() {
	 $.ajax({
		type : "post",
		url : "EmailOverlap", 
		data : {"Email" : frm.Email.value},
		dataType : "text", //retrun Type
		success : function(data){
			if(data=="1"){
				EmailTest = 1;
				console.log("Email이 있는가?"+EmailTest);
			}else{
				EmailTest = 0;
				console.log("Email이 있는가?"+EmailTest);
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
	});
	 PassWordCheck();
	}
 
function PassWordCheck() {
	var Email;
	EmailResult = EmailTest;
	var idcheck1;
	var hangul1;
	hangul1 = hangul; 
	idcheck1 = idcheck;
		var Password = document.getElementById("Password").value; 
		var CheckPassword = document.getElementById("CheckPassword").value; 
		//EmailResult == 1 이메일 일치 Password == CheckPassword 비밀번호 일치
		//중복체크 idcheck1
		console.log(EmailResult);
		console.log(Password);
		console.log(CheckPassword);
		console.log(idcheck1);
		console.log(hangul1)
		if(Password != CheckPassword){
			alert("비밀번호를 다시 확인해주시기 바랍니다.");
			event.stopPropagation();
			console.log(idcheck);
		}
		else if(EmailResult == 1 && Password == CheckPassword && idcheck1 == 1 && hangul1){
			alert("회원가입을 위해 등록한 이메일에 인증번호를 전송하였습니다.");	
			document.getElementById('frm').submit();
		}
		
		else if(EmailResult == 0){
			alert("이미 가입된 이메일입니다.");	
		}
		
		else if(Password1 = 0){
			alert("비밀번호가 공백입니다.");	
		}
		
		else if(idcheck1==0){
				alert("아이디 중복확인을 해주시기 바랍니다.");
				event.preventDefault();
			}
		else if(idcheck==2 || hangul1==0){
				alert("사용할 수 없는 아이디입니다.");
			event.preventDefault();	
			}
}
<!-- document.getElementById('frm').submit(); -->
	
</script>
  </head>
  <body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home"><img src="resources/KakaoTalk_20180918_160253898.png" width="80px" height="30px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <%
	String id = (String)session.getAttribute("id");
%>
       <% if(id != null){ %>
<li><a href="Logout">로그아웃</a></li>
<% }else {%>
<li><a href="Login">로그인</a></li>
<li><a href="UserJoin">사용자 회원가입</a></li>
<li><a href="DriverJoin">기사 회원가입</a></li>
 <%} %> 
 <c:if test="${LoginMember.passuser == 2}">

<li><a href="DriverMyPage">마이페이지 기사용</a></li>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<li><a href="UserMyPage">마이페이지 유저용</a></li>
</c:if>
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="RoomList">방목록보기</a></li>
            <li><a href="#">예약가능한 방목록보기</a></li>
            
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>

<br>
<br>
<br>


      <article class="container">
        <div class="col-md-12">
        <div class="page-header">
    	    <h1 id="a">회원가입 <small>Driver</small></h1>
        </div>
        <form class="form-horizontal" action="CheckDriver" method="get" id=frm>
       
          <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">아이디</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="text" class="form-control" id="inputNumber" placeholder="아이디를 입력해주세요"  name="Id" required autofocus/>
                                <span class="input-group-btn">
                               
                <button class="btn btn-success" type="button" onclick="idOverlap()">중복확인<i class="fa fa-edit spaceLeft"></i></button>
              </span>                  
                </div>          
              </div>
                        <font name="check2" size="2" color="red"></font> 
        </div>
         
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="Password" type="password" placeholder="비밀번호를 입력해주세요" name="Password" required autofocus>
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호 재확인</label>
        <div class="col-sm-6">
       
          <input class="form-control" id="CheckPassword" type="password" placeholder="비밀번호를 입력해주세요" name="CheckPassword" required autofocus>
        <p class="help-block"></p>
        <font name="check" size="2" color="red"></font> 
		<font name="check1" size="2" color="blue"></font> 
        </div>
        </div>
        
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">이름</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="text" placeholder="이름을 입력해주세요" name="Name" required autofocus>
                <p class="help-block">ex)홍길동</p>
             </div>
          </div>
        <div class="form-group">
            <!-- <label class="col-sm-3 control-label" for="inputName">성별</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="성별을 입력해주세요" name="Gender" required autofocus>
            <p class="help-block">ex)남자,여자</p>
          </div> -->
        </div>
         <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">휴대폰번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="tel" placeholder="-없이 입력해 주세요" name="Tel" required autofocus>
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="email" name="Email" required autofocus>
        <p class="help-block">ex)aaa@aaa.aaa</p>
        </div>
        </div>
              <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">주소</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="text" name="Address" required autofocus>
        <p class="help-block">ex)인천시 인천구 인천동 11-11</p>
        </div>
        </div>
       
          
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="button" onclick="EmailOverlap()">회원가입<i class="fa fa-check spaceLeft"></i></button>
            
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>

