<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body{
	background-color:#f4f4f4;
	
	}
  	.container{
  		color:white;
  	}
  	.item active, .item{
  		height:394px;
  		background-color: #158CBA;
  	}
  	.carousel-inner{
  		background-color: #158CBA;
  	}
  	h2{
  		font-size: 1.75em;
  		margin-top: 0;
  		
  	}
  </style>
  <script>
  $(document).ready(function(){
		$('#f_email').keyup(function(){
			$.ajax({
				url : 'conFirmEmail.do',
				type : 'get',
				data : 'f_email='+$('#f_email').val().trim()+'&p_email='+$('#f_email').val().trim(),
				success : function(data, status){
					if($('#finderConfirmEmail').html(data).text().trim() == 'fail'){
						$('#finderConfirmEmail').html('이미 사용중인 이메일입니다')
						$('#finderConfirmEmail').css('color', 'red');
						$('#finderChkEmail').val('fail');
					}else{
						$('#finderConfirmEmail').html('사용가능한 이메일입니다');
						$('#finderConfirmEmail').css('color', 'white');
						$('#finderChkEmail').val('success');
					}
				}
			});
		});
		$('#p_email').keyup(function(){
			$.ajax({
				url : 'conFirmEmail.do',
				type : 'get',
				data : 'f_email='+$('#p_email').val().trim()+'&p_email='+$('#p_email').val().trim(),
				success : function(data, status){
					if($('#proConfirmEmail').html(data).text().trim() == 'fail'){
						$('#proConfirmEmail').html('이미 사용중인 이메일입니다')
						$('#proConfirmEmail').css('color', 'red');
						$('#proChkEmail').val('fail');
					}else{
						$('#proConfirmEmail').html('사용가능한 이메일입니다');
						$('#proConfirmEmail').css('color', 'white');
						$('#proChkEmail').val('success');
					}
				}
			});
		});
		$('#f_nickname').keyup(function(){
			$.ajax({
				url : 'confirmNickName.do',
				type : 'get',
				data : 'f_nickname='+$('#f_nickname').val().trim()+'&p_nickname='+$('#f_nickname').val().trim(),
				success : function(data, status){
					if($('#finderConfirmNickname').html(data).text().trim() == 'fail'){
						$('#finderConfirmNickname').html('이미 사용중인 닉네임입니다');
						$('#finderConfirmNickname').css('color', 'red');
						$('#finderChkNickname').val('fail');
					}else{
						$('#finderConfirmNickname').html('사용가능한 닉네임입니다');
						$('#finderConfirmNickname').css('color', 'white');
						$('#finderChkNickname').val('success');
					}
				}
			});
		});
		$('#p_nickname').keyup(function(){
			$.ajax({
				url : 'confirmNickName.do',
				type : 'get',
				data : 'f_nickname='+$('#p_nickname').val().trim()+'&p_nickname='+$('#p_nickname').val().trim(),
				success : function(data, status){
					if($('#proConfirmNickname').html(data).text().trim() == 'fail'){
						$('#proConfirmNickname').html('이미 사용중인 닉네임입니다');
						$('#proConfirmNickname').css('color', 'red');
						$('#proChkNickname').val('fail');
					}else{
						$('#proConfirmNickname').html('사용가능한 닉네임입니다');
						$('#proConfirmNickname').css('color', 'white');
						$('#proChkNickname').val('success');
					}
				}
			});
		});
		$('#f_pwChk').keyup(function(){
			if( $('#f_pw').val() == $('#f_pwChk').val()){
				$('#finderConfirmPw').html('비밀번호가 일치합니다');
				$('#finderConfirmPw').css('color', 'white');
			}else{
				$('#finderConfirmPw').html('비밀번호가 일치하지 않습니다');
				$('#finderConfirmPw').css('color', 'red');
			}
		});
		$('#p_pwChk').keyup(function(){
			if( $('#p_pw').val() == $('#p_pwChk').val()){
				$('#proConfirmPw').html('비밀번호가 일치합니다');
				$('#proConfirmPw').css('color', 'white');
			}else{
				$('#proConfirmPw').html('비밀번호가 일치하지 않습니다');
				$('#proConfirmPw').css('color', 'red');
			}
		});
		$('#finderMail').click(function(){
			var email = $('#f_email').val().trim();
			var name = $('#f_name').val().trim();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(!regex.test(email)){
				alert('이메일을 재대로 입력하셔야 인증이 가능합니다');
			}else if(name == "" ){
				alert('이름을 입력하셔야 인증이 가능합니다');
			}else{
				$.ajax({
					url:'confirmRequest.do',
					type:'get',
					data:'e_email='+email+'&e_name='+name,
					success: function(data, status){
						$('#findermailConfirm').val(data.trim());
						setTimeout(function(){
							$('#finderMail').val('메일전송 완료');
						}, 1000);
						setTimeout(function(){
							$('#finderMail').val('인증번호 재요청');
						}, 5000);
					}
				});
			}
		});
		$('#proMail').click(function(){
			var email = $('#p_email').val().trim();
			var name = $('#p_name').val().trim();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(!regex.test(email)){
				alert('이메일을 재대로 입력하셔야 인증이 가능합니다');
			}else if(name == "" ){
				alert('이름을 입력하셔야 인증이 가능합니다');
			}else{
				$.ajax({
					url:'confirmRequest.do',
					type:'get',
					data:'e_email='+email+'&e_name='+name,
					success: function(data, status){
						$('#proMailConfirm').val(data.trim());
						setTimeout(function(){
							$('#proMail').val('메일전송 완료');
						}, 1000);
						setTimeout(function(){
							$('#proMail').val('인증번호 재요청');
						}, 5000);
					}
				});
			}
		});
		
	});	
	function finderChk(){
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var tel2 = /^[0-9]{3,4}/;
		var tel3 = /^[0-9]{4}/;
		if(finderfrm.finderChkEmail.value == 'fail'){
			alert("이메일를 확인해주세요");
			finderfrm.f_email.focus();
			return false;
		}else if(finderfrm.finderChkNickname.value == 'fail'){
			alert("닉네임을 확인해주세요");
			finderfrm.f_nickname.focus();
			return false;
		}else if(finderfrm.f_name.value.length == 0){
			alert('이름을 작성하셔야 합니다')
			finderfrm.f_name.focus();
			return false;
		}else if(finderfrm.f_pw.value.length == 0){
			alert('비밀번호를 작성하셔야 합니다')
			finderfrm.f_pw.focus();
			return false;
		}else if(finderfrm.f_pwChk.value.length == 0){
			alert('확인용 비밀번호을 작성하셔야 합니다')
			finderfrm.f_pwChk.focus();
			return false;
		}else if(finderfrm.f_nickname.value.length == 0){
			alert('닉네임을 작성하셔야 합니다')
			finderfrm.f_nickname.focus();
			return false;
		}else if(finderfrm.f_tel2.value.length == 0 ){
			alert('전화번호를 작성하셔야 합니다')
			finderfrm.f_tel2.focus();
			return false;
		}else if(finderfrm.f_tel3.value.length == 0){
			alert('전화번호를 작성하셔야 합니다')
			finderfrm.f_tel3.focus();
			return false;
		}else if(finderfrm.f_message.value.length == 0){
			alert('알림말을 작성하셔야 합니다')
			finderfrm.f_message.focus();
			return false;
		}else if(finderfrm.finderConfirm.value.length == 0){
			alert('인증번호을 작성하셔야 합니다')
			finderfrm.confirm.focus();
			return false;
		}else if(finderfrm.f_pw.value != finderfrm.f_pwChk.value){
			alert("비밀번호를 확인해주세요");
			finderfrm.f_pw.value = "";
			finderfrm.f_pwChk.value = "";
			finderfrm.f_pw.focus();
			return false;
		}else if(regex.test(finderfrm.f_email.value) == false){
			alert("잘못된 이메일 형식입니다");
			finderfrm.f_email.focus();
			return false;
		}else if(finderfrm.f_pw.value.length < 3 || finderfrm.f_pw.value.length > 13 || finderfrm.f_pw.value.length == 0){
			alert('비밀번호는 4~12자 입니다.')
			finderfrm.f_pw.value = "";
			finderfrm.f_pwChk.value = "";
			finderfrm.f_pw.focus();
			return false;
		}else if(tel2.test(finderfrm.f_tel2.value) == false || finderfrm.f_tel2.value.length == 0){
			alert("잘못된 전화번호입니다");
			finderfrm.f_tel2.focus();
			return false;
		}else if(tel3.test(finderfrm.f_tel3.value) == false || finderfrm.f_tel3.value.length == 0){
			alert("잘못된 전화번호입니다");
			finderfrm.f_tel3.focus();
			return false;
		}else if(finderfrm.finderConfirm.value != finderfrm.findermailConfirm.value || finderfrm.finderConfirm.value.length == 0){
			alert("인증번호가 다릅니다");
			finderfrm.confirm.focus();
			return false;
		}
	}
	function proChk(){
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var tel2 = /^[0-9]{3,4}/;
		var tel3 = /^[0-9]{4}/;
		if(profrm.proChkEmail.value == 'fail'){
			alert("이메일를 확인해주세요");
			profrm.p_email.focus();
			return false;
		}else if(profrm.proChkNickname.value == 'fail'){
			alert("닉네임을 확인해주세요");
			profrm.p_nickname.focus();
			return false;
		}else if(profrm.p_name.value.length == 0){
			alert('이름을 작성하셔야 합니다')
			profrm.p_name.focus();
			return false;
		}else if(profrm.p_pw.value.length == 0){
			alert('비밀번호를 작성하셔야 합니다')
			profrm.p_pw.focus();
			return false;
		}else if(profrm.p_pwChk.value.length == 0){
			alert('확인용 비밀번호을 작성하셔야 합니다')
			profrm.p_pwChk.focus();
			return false;
		}else if(profrm.p_nickname.value.length == 0){
			alert('닉네임을 작성하셔야 합니다')
			profrm.p_nickname.focus();
			return false;
		}else if(profrm.p_tel2.value.length == 0 ){
			alert('전화번호를 작성하셔야 합니다')
			profrm.p_tel2.focus();
			return false;
		}else if(profrm.p_tel3.value.length == 0){
			alert('전화번호를 작성하셔야 합니다')
			profrm.p_tel3.focus();
			return false;
		}else if(profrm.p_message.value.length == 0){
			alert('알림말을 작성하셔야 합니다')
			profrm.p_message.focus();
			return false;
		}else if(profrm.proconfirm.value.length == 0){
			alert('인증번호을 작성하셔야 합니다')
			profrm.confirm.focus();
			return false;
		}else if(profrm.p_pw.value != profrm.p_pwChk.value){
			alert("비밀번호를 확인해주세요");
			profrm.p_pw.value = "";
			profrm.p_pwChk.value = "";
			profrm.p_pw.focus();
			return false;
		}else if(regex.test(profrm.p_email.value) == false){
			alert("잘못된 이메일 형식입니다");
			profrm.p_email.focus();
			return false;
		}else if(profrm.p_pw.value.length < 3 || profrm.p_pw.value.length > 13 || profrm.p_pw.value.length == 0){
			alert('비밀번호는 4~12자 입니다.')
			profrm.p_pw.value = "";
			profrm.p_pwChk.value = "";
			profrm.p_pw.focus();
			return false;
		}else if(tel2.test(profrm.p_tel2.value) == false || profrm.p_tel2.value.length == 0){
			alert("잘못된 전화번호입니다");
			profrm.p_tel2.focus();
			return false;
		}else if(tel3.test(profrm.p_tel3.value) == false || profrm.p_tel3.value.length == 0){
			alert("잘못된 전화번호입니다");
			profrm.p_tel3.focus();
			return false;
		}else if(profrm.proconfirm.value != profrm.proMailConfirm.value || profrm.proconfirm.value.length == 0){
			alert("인증번호가 다릅니다");
			profrm.confirm.focus();
			return false;
		}
	}
  </script>
</head>
<body>
<div class="container" style="width: 598px; background: #158CBA; margin:  0; border: none; height: 394px;
">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
 <!--    Indicators
    <ol class="carousel-indicators" style="left: 50%;">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
      <li data-target="#myCarousel" data-slide-to="7"></li>
    </ol> -->

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="background: #158CBA; left: -14px; top:-20px; width:598px;">

      <div class="item active">
        <h2 style="position: absolute; top: 24px; left: 70px; font-size: 35px;">회원가입을 시작합니다</h2>
        <h3 style="position: absolute; top: 80px; left: 125px; font-size: 27px;"><img src="${conPath }/img/profinder_textlogo.png" style="width:140px; height: 50px;"> 는 전문적인</h3>
        <h3 style="position: absolute; top: 142px; left: 125px; font-size: 27px;"><b>컨텐츠</b>나<b>서비스</b>를</h3>
        <h3 style="position: absolute; top: 190px; left: 125px; font-size: 27px;"><b>공유, 거래</b>하는</h3>
        <h3 style="position: absolute; top: 240px; left: 125px; font-size: 27px;">커뮤니티 입니다</h3>
        <span style="position: absolute; top: 170px; left: 555px;">
	        <a href="#myCarousel" role="button" data-slide="next">
		      <img src="${conPath }/img/icon_forward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
	    <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>

      <div class="item">
      	<span class="backward" style="position: absolute; top: 170px; left: 15px;">
	      	<a href="#myCarousel" role="button" data-slide="prev">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
      	<h3 style="position: absolute; top: 58px; left: 90px; font-size: 27px;">PRO회원은</h3>
      	<h3 style="position: absolute; top: 113px; left: 90px; font-size: 27px;"><b style="color: lightyellow;">직업인</b>으로서</h3>
      	<h3 style="position: absolute; top: 171px; left: 90px; font-size: 27px;">전문적인 컨텐츠를 공유/판매하고</h3>
      	<h3 style="position: absolute; top: 228px; left: 90px; font-size: 27px;">자신을 홍보합니다.</h3>
      	<span style="position: absolute; top: 170px; left: 555px;">
	        <a href="#myCarousel" data-slide="next">
		      <img src="${conPath }/img/icon_forward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
	    <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>
    
      <div class="item">
      	<span class="backward" style="position: absolute; top: 170px; left: 15px;">
	      	<a href="#myCarousel" data-slide="prev">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
      	<h3 style="position: absolute; top: 72px; left: 90px; font-size: 27px;">FINDER 회원은</h3>
      	<h3 style="position: absolute; top: 130px; left: 90px; font-size: 27px;">전문적인 컨텐츠나 직업인을</h3>
      	<h3 style="position: absolute; top: 190px; left: 90px; font-size: 27px;">찾는 <b style="color: lightyellow;">개인 사용자</b>입니다.</h3>
      	<span style="position: absolute; top: 170px; left: 555px;">
	        <a href="#myCarousel" data-slide="next">
		      <img src="${conPath }/img/icon_forward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
	    <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>

      <div class="item">
      	<span class="backward" style="position: absolute; top: 170px; left: 15px;">
	      	<a href="#myCarousel" data-slide="prev">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
      	<h3 style="position: absolute; top: 41px; left: 90px; font-size: 27px;">온라인에서는 컨텐츠를 공유하거나</h3>
      	<h3 style="position: absolute; top: 92px; left: 90px; font-size: 27px;">거래하고</h3>
      	<h3 style="position: absolute; top: 150px; left: 95px; font-size: 27px;"><img src="${conPath }/img/banner_join_online.png" style="width:415px; height: 120px;"></h3>
      	<span style="position: absolute; top: 170px; left: 555px;">
	        <a href="#myCarousel" data-slide="next">
		      <img src="${conPath }/img/icon_forward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
	    <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>
      
      <div class="item">
     	 <span class="backward" style="position: absolute; top: 170px; left: 15px;">
	      	<a href="#myCarousel" data-slide="prev">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
      	<h3 style="position: absolute; top: 64px; left: 90px; font-size: 27px;">오프라인으로는</h3>
      	<h3 style="position: absolute; top: 116px; left: 90px; font-size: 27px;">원하는 PRO를 고용할 수 있습니다.</h3>
      	<h3 style="position: absolute; top: 178px; left: 245px; font-size: 27px;"><img src="${conPath }/img/banner_join_offline.png" style="width:90px; height: 70px;"></h3>
      	<span style="position: absolute; top: 170px; left: 555px;">
	        <a href="#myCarousel" data-slide="next">
		      <img src="${conPath }/img/icon_forward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
	    <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>
      
      <div class="item">
      	<span class="backward" style="position: absolute; top: 170px; left: 15px;">
	      	<a href="#myCarousel" data-slide="prev">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
        <h3 style="position: absolute; top: 75px; left: 90px; font-size: 27px;">어느 회원으로</h3>
        <h3 style="position: absolute; top: 120px; left: 90px; font-size: 27px;">가입하시겠습니까?</h3>
        <span style="position: absolute; top: 220px; left: 140px; font-size: 27px;"><a href="joinView.do" data-target="#myCarousel" data-slide-to="7" style="color:white;">PRO</a></span>
        <span style="position: absolute; top: 220px; left: 360px; font-size: 27px;"><a href="joinView.do" data-target="#myCarousel" data-slide-to="6" style="color:white;">FINDER</a></span>
        <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>
       <div class="item" style="height: 980px;">
      	<span class="backward" style="position: absolute; top: 482px; left: 15px;">
	      	<a href="#myCarousel" data-slide-to="5">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
        <h3 style="position: absolute; top: 10px; left: 216px;">Finder 회원가입</h3>
        <form action="finderJoin.do" method="post" enctype="multipart/form-data" name="finderfrm" onsubmit="return finderChk()">
        	<input type="hidden" name="finderChkEmail" id="finderChkEmail">
			<input type="hidden" name="finderChkNickname" id="finderChkNickname">
			<input type="hidden" name="findermailConfirm" id="findermailConfirm">
        	<div class="form-group has-success" style="text-align: left; position: absolute; top: 55px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">이메일</label>
				<input type="text" name="f_email" id="f_email" class="form-control is-valid btn-block" style="border-color: white;">
				<span id="finderConfirmEmail" style="float: right;"></span>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 121px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">이름</label>
				<input type="text" name="f_name" id="f_name" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 187px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">비밀번호</label>
				<input type="password" name="f_pw" id="f_pw" class="form-control is-valid btn-block" style="text-align: left; border-color: white;">
			</div>	
			<div class="form-group has-success"style="text-align: left; position: absolute; top: 251px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">비밀번호 확인</label>
				<input type="password" name="f_pwChk" id="f_pwChk" class="form-control is-valid btn-block" style="text-align: left; border-color: white;">
				<span id="finderConfirmPw" style="float: right;"></span>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 316px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">닉네임</label>
				<input type="text" name="f_nickname" id="f_nickname" class="form-control is-valid btn-block" style="text-align: left; border-color: white;">
				<span id="finderConfirmNickname" style="float: right;"></span>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 381px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">연락처</label><br>
				<select name="f_tel1" style="color: black; height: 25px;">
					<option value="02">02</option>
					<option value="010">010</option>
				</select> 
				- <input type="text" name="f_tel2" id="f_tel2" maxlength="4" style="width:188px; border-radius: 5px; height: 30px; color: black;">
				- <input type="text" name="f_tel3" id="f_tel3" maxlength="4" style="width:188px; border-radius: 5px; height: 30px; color: black;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 450px; left: 78px; width: 450px;" >
				<label class="form-control-label" for="inputSuccess1">계좌번호</label>
				<input type="text" name="f_accountnum" id="f_accountnum" class="form-control is-valid btn-block " style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 519px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">계좌은행</label>
				<input type="text" name="f_bank" id="f_bank" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 587px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">거주지역</label>
				<select name="f_area" style="color: black; width:60px; height: 25px;">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
				</select> 
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 626px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">프로필사진</label>
				<input type="file" name="f_photo1" id="f_photo1">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 685px; left: 78px; width: 450px;" >
				<label class="form-control-label" for="inputSuccess1">알림말</label>
				<input type="text" name="f_message" id="f_message" class="form-control is-valid btn-block"  style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 751px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">추가이미지</label>
				<input type="file" name="f_photo2" id="f_photo2">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 810px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">인증</label>
				<input type="text" name="finderConfirm" class="form-control is-valid btn-block" style="border-color: white;">
				<input type="button" value="인증번호요청하기" id="finderMail" class="form-control is-valid btn-block" style="color: black; border-color: white;">
			</div>
			<div style="text-align: left; position: absolute; top: 927px; left: 442px;">
				<input type="submit" value="회원가입" style="color: black; width:85px; height: 43px;">
			</div>
        </form>
        <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div><div class="item" style="height: 1130px;">
      	<span class="backward" style="position: absolute; top: 520px; left: 15px;">
	      	<a href="#myCarousel" data-slide-to="5">
		      <img src="${conPath }/img/icon_backward.png" style="width:27px; height: 60px; cursor: pointer;">
		    </a>
	    </span>
        <h3 style="position: absolute; top: 10px; left: 216px;">PRO 회원가입</h3>
        <form action="proJoin.do" method="post" enctype="multipart/form-data" name="profrm" onsubmit="return proChk()">
        	<input type="hidden" name="proChkEmail" id="proChkEmail">
			<input type="hidden" name="proChkNickname" id="proChkNickname">
			<input type="hidden" name="proMailConfirm" id="proMailConfirm">
        	<div class="form-group has-success" style="text-align: left; position: absolute; top: 55px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">이메일</label>
				<input type="text" name="p_email" id="p_email" class="form-control is-valid btn-block" style="border-color: white;">
				<span id="proConfirmEmail" style="float: right;"></span>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 121px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">이름</label>
				<input type="text" name="p_name" id="p_name" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 187px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">비밀번호</label>
				<input type="password" name="p_pw" id="p_pw" class="form-control is-valid btn-block" style="text-align: left; border-color: white;">
			</div>	
			<div class="form-group has-success"style="text-align: left; position: absolute; top: 251px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">비밀번호 확인</label>
				<input type="password" name="p_pwChk" id="p_pwChk" class="form-control is-valid btn-block" style="text-align: left; border-color: white;">
				<span id="proConfirmPw" style="float: right;"></span>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 316px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">닉네임</label>
				<input type="text" name="p_nickname" id="p_nickname" class="form-control is-valid btn-block" style="text-align: left; border-color: white;">
				<span id="proConfirmNickname" style="float: right;"></span>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 381px; left: 78px; width:450px;">
				<label class="form-control-label" for="inputSuccess1">연락처</label><br>
				<select name="p_tel1" style="color: black; height: 25px;">
					<option value="02">02</option>
					<option value="010">010</option>
				</select> 
				- <input type="text" name="p_tel2" id="p_tel2" maxlength="4" style="width:188px; border-radius: 5px; height: 30px; color: black;">
				- <input type="text" name="p_tel3" id="p_tel3" maxlength="4" style="width:188px; border-radius: 5px; height: 30px; color: black;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 450px; left: 78px; width: 450px;" >
				<label class="form-control-label" for="inputSuccess1">계좌번호</label>
				<input type="text" name="p_accountnum" id="p_accountnum" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 519px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">계좌은행</label>
				<input type="text" name="p_bank" id="p_bank" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 587px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">거주지역</label>
				<select name="p_area" style="color: black; width:60px; height: 25px;">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
				</select> 
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 626px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">프로필사진</label>
				<input type="file" name="p_photo1" id="p_photo1">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 685px; left: 78px; width: 450px;" >
				<label class="form-control-label" for="inputSuccess1">알림말</label>
				<input type="text" name="p_message" id="p_message" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 751px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">추가이미지</label>
				<input type="file" name="p_photo2" id="p_photo2">
			</div>
			<div style="text-align: left; position: absolute; top: 821px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">분류</label>
				<select name="cate_num" style="width:130px; height: 29px; color: black;">
					<c:forEach items="${cate }" var="list">
						<option value="${list.cate_num }">${list.cate_name }</option>	
					</c:forEach>
				</select>
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 858px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">인증</label>
				<input type="text" name="proconfirm" class="form-control is-valid btn-block">
				<input type="button" value="인증번호요청하기" id="proMail" class="form-control is-valid btn-block" style="color: black; border-color: white;">
			</div>
			<div class="form-group has-success" style="text-align: left; position: absolute; top: 960px; left: 78px; width: 450px;">
				<label class="form-control-label" for="inputSuccess1">스펙</label>
				<input type="text" name="p_spec" id="p_spec" class="form-control is-valid btn-block" style="border-color: white;">
			</div>
			<div style="text-align: left; position: absolute; top: 1045px; left: 442px;">
				<input type="submit" value="회원가입" style="color: black; width:85px; height: 43px;">
			</div>
        </form>
        <span data-dismiss="modal" style="position:absolute; left: 555px; top: 4px;" aria-hidden="true">
			<img src="${conPath }/img/icon_x.png" style="width:40px; height: 40px; cursor: pointer;">
		</span>
      </div>
    </div>
  </div>
</div>
</body>
</html>