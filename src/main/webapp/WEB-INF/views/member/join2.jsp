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
  	#backward{
  		line-height: 30px;
  	}
  	
  </style>
  <script>
  $(document).ready(function(){
		$('#cate').hide();
		
		$('#f').click(function(){
			$('#cate').hide();
		})
		$('#p').click(function(){
			$('#cate').show();
		})
		$('#e_email').keyup(function(){
			$.ajax({
				url : 'conFirmEmail.do',
				type : 'get',
				data : 'f_email='+$('#e_email').val().trim()+'&p_email='+$('#e_email').val().trim(),
				success : function(data, status){
					if($('#confirmEmail').html(data).text().trim() == 'fail'){
						$('#confirmEmail').html('이미 사용중인 이메일입니다')
						$('#chkEmail').val('fail');
					}else{
						$('#confirmEmail').html('사용가능한 이메일입니다')
						$('#chkEmail').val('success');
					}
				}
			});
		});
		$('#e_nickname').keyup(function(){
			$.ajax({
				url : 'finderConfirmNickName.do',
				type : 'get',
				data : 'f_nickname='+$('#e_nickname').val().trim()+'&p_nickname='+$('#e_nickname').val().trim(),
				success : function(data, status){
					if($('#confirmNickname').html(data).text().trim() == 'fail'){
						$('#confirmNickname').html('이미 사용중인 닉네임입니다')
						$('#chkNickname').val('fail');
					}else{
						$('#confirmNickname').html('사용가능한 닉네임입니다')
						$('#chkNickname').val('success');
					}
				}
			});
		});
		$('#e_pwChk').keyup(function(){
			if( $('#e_pw').val() == $('#e_pwChk').val()){
				$('#confirmPw').html('비밀번호가 일치합니다');
			}else{
				$('#confirmPw').html('비밀번호가 일치하지 않습니다');
			}
		});
		$('.mail').click(function(){
			var e_email = $('#e_email').val();
			var e_name = $('#e_name').val();
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(!regex.test(e_email)){
				alert('이메일을 재대로 입력하셔야 인증이 가능합니다');
			}else if(e_name == "" ){
				alert('이름을 입력하셔야 인증이 가능합니다');
			}else{
				$.ajax({
					url:'confirmRequest.do',
					type:'get',
					data:'e_email='+$('#e_email').val().trim()+'&e_name='+$('#e_name').val().trim(),
					success: function(data, status){
						$('#su').val(data.trim());
						setTimeout(function(){
							$('.mail').val('메일전송 완료');
						}, 1000);
						setTimeout(function(){
							$('.mail').val('인증번호 재요청');
						}, 5000);
					}
				});
			}
		});
		
	});	
	function chk(){
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var tel2 = /^[0-9]{3,4}/;
		var tel3 = /^[0-9]{4}/;
		if(frm.chkEmail.value == 'fail'){
			alert("이메일를 확인해주세요");
			frm.e_email.focus();
			return false;
		}else if(frm.chkNickname.value == 'fail'){
			alert("닉네임을 확인해주세요");
			frm.e_nickname.focus();
			return false;
		}else if(frm.e_name.value.length == 0){
			alert('이름을 작성하셔야 합니다')
			frm.e_name.focus();
			return false;
		}else if(frm.e_pw.value.length == 0){
			alert('비밀번호를 작성하셔야 합니다')
			frm.e_pw.focus();
			return false;
		}else if(frm.e_pwChk.value.length == 0){
			alert('확인용 비밀번호을 작성하셔야 합니다')
			frm.e_pwChk.focus();
			return false;
		}else if(frm.e_nickname.value.length == 0){
			alert('닉네임을 작성하셔야 합니다')
			frm.e_nickname.focus();
			return false;
		}else if(frm.e_tel2.value.length == 0 ){
			alert('전화번호를 작성하셔야 합니다')
			frm.e_tel2.focus();
			return false;
		}else if(frm.e_tel3.value.length == 0){
			alert('전화번호를 작성하셔야 합니다')
			frm.e_tel3.focus();
			return false;
		}else if(frm.e_message.value.length == 0){
			alert('알림말을 작성하셔야 합니다')
			frm.e_message.focus();
			return false;
		}else if(frm.confirm.value.length == 0){
			alert('인증번호을 작성하셔야 합니다')
			frm.confirm.focus();
			return false;
		}else if(frm.e_pw.value != frm.e_pwChk.value){
			alert("비밀번호를 확인해주세요");
			frm.e_pw.value = "";
			frm.e_pwChk.value = "";
			frm.e_pw.focus();
			return false;
		}else if(regex.test(frm.e_email.value) == false){
			alert("잘못된 이메일 형식입니다");
			frm.e_email.focus();
			return false;
		}else if(frm.e_pw.value.length < 3 || frm.e_pw.value.length > 13 || frm.e_pw.value.length == 0){
			alert('비밀번호는 4~12자 입니다.')
			frm.e_pw.value = "";
			frm.e_pwChk.value = "";
			frm.e_pw.focus();
			return false;
		}else if(tel2.test(frm.e_tel2.value) == false || frm.e_tel2.value.length == 0){
			alert("잘못된 전화번호입니다");
			frm.e_tel2.focus();
			return false;
		}else if(tel3.test(frm.e_tel3.value) == false || frm.e_tel3.value.length == 0){
			alert("잘못된 전화번호입니다");
			frm.e_tel3.focus();
			return false;
		}else if(frm.confirm.value != frm.su.value || frm.confirm.value.length == 0){
			alert("인증번호가 다릅니다");
			frm.confirm.focus();
			return false;
		}
	}
  </script>
</head>
<body>
				<div class="modal-header" style="width:100%;">
					<h5 class="modal-title">JOIN</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="join.do" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
				<div class="modal-body" style="padding: 40px 50px;">
					<input type="hidden" name="chkEmail" id="chkEmail">
					<input type="hidden" name="chkNickname" id="chkNickname">
					<input type="text" name="su" id="su">
				
						<div class="form-group has-success">
							<input type="radio"  name="member" id="f" value="f" checked="checked"> 파인더
							<input type="radio"  name="member" id="p" value="p"> 프로
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">이메일</label>
							<input type="text" name="e_email" id="e_email" class="form-control is-valid btn-block">
							<span id="confirmEmail"></span>
						</div>			
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">이름</label>
							<input type="text" name="e_name" id="e_name" class="form-control is-valid btn-block">
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">비밀번호</label>
							<input type="password" name="e_pw" id="e_pw" class="form-control is-valid btn-block">
						</div>	
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">비밀번호 확인</label>
							<input type="password" name="e_pwChk" id="e_pwChk" class="form-control is-valid btn-block">
							<span id="confirmPw"></span>
						</div>				
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">닉네임</label>
							<input type="text" name="e_nickname" id="e_nickname" class="form-control is-valid btn-block">
							<span id="confirmNickname"></span>
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">연락처</label>
							<select name="e_tel1">
								<option value="02">02</option>
								<option value="010">010</option>
							</select> 
							- <input type="text" name="e_tel2" id="e_tel2" maxlength="4">
							- <input type="text" name="e_tel3" id="e_tel3" maxlength="4">
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">계좌번호</label>
							<input type="text" name="e_accountnum" id="e_accountnum" class="form-control is-valid btn-block">
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">계좌은행</label>
							<input type="text" name="e_bank" id="e_bank" class="form-control is-valid btn-block">
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">거주지역</label>
							<select name="e_area">
								<option value="서울">서울</option>
								<option value="경기">경기</option>
							</select> 
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">프로필사진</label>
							<input type="file" name="e_photo1" id="e_photo1">
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">알림말</label>
							<input type="text" name="e_message" id="e_message" class="form-control is-valid btn-block">
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">추가이미지</label>
							<input type="file" name="e_photo2" id="e_photo2">
						</div>
						<div class="form-group has-success" id="cate">
							<label class="form-control-label" for="inputSuccess1">분류</label>
							<select name="cate_num" >
								<c:forEach items="${cate }" var="list">
									<option value="${list.cate_num }">${list.cate_name }</option>	
								</c:forEach>
							</select>
						</div>
						<div class="form-group has-success" style="text-align: left;">
							<label class="form-control-label" for="inputSuccess1">인증</label>
							<input type="text" name="confirm" class="form-control is-valid btn-block">
							<input type="button" value="인증번호요청하기" class="mail" class="form-control is-valid btn-block">
						</div>
					</div>
				<div class="modal-footer">
					<input type="submit" value="회원가입">
				</div>
			</form>
</body>
</html>