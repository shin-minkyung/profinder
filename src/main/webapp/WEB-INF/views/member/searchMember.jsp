<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script>
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>
<script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
<script src="${conPath }/js/popper.min.js" type="text/javascript"></script>
<style>
@font-face{font-family:'Nanum Gothic'; src:url('${conPath}/font/nanum_gothic_ultralight.ttf')}
body{
	font-family:'Nanum Gothic';
	font-size:1.1em;
	background-color: #f4f4f4;
}
#container{
	width:410px;
	height:490px;
	border:1px solid #d3d3de;	
	background-color:#fff;
	margin:25px auto;	
}
.searchtab{
	padding-left:0;
}
.active_menu{
	border-bottom:7px solid #4e6fbc;
	line-height:60px;
}
.menu li{
	float:left;
	list-style:none;
	line-height:60px;
	width:160px;
	text-align: center;
	font-size:1.3em;
}
#ID{
	display:block;
	width:400px;
	height:40px;
}
#PW{
	display:block;
	width:400px;
	height:40px;
}
#searchID{
	font-size:1em;
	padding:15px;
}
#searchPW{
	font-size:1em;
	padding:15px;
}
.tel_input{
	width:65px;
	display:inline-block;
}
.go_btn{
	width:350px;
	height:70px;
}
.ok{
	color:green;
}
.incorrect{
	color:red;
}

</style>
<script>
	$(function() {
		$('#menu1').click(function(){
			$('#searchID').css("display","block");
			$('#searchPW').css("display","none");
			$('#menu2').removeClass('active_menu');
			$(this).addClass('active_menu');
		});
		$('#menu2').click(function(){
			$('#searchID').css("display","none");
			$('#searchPW').css("display","block");
			$('#menu1').removeClass('active_menu');
			$(this).addClass('active_menu');
		});
		
		$('#searchIDBtn').click(function(){
			var name = $('#id_name').val();
			var tel1 = $('#id_tel1').val();
			var tel2 = $('#id_tel2').val();
			var tel3 = $('#id_tel3').val();
			$.ajax({
				url:'searchMemberId.do',
				type: 'get',
				data : 'f_name='+name+'&f_tel1='+tel1+'&f_tel2='+tel2+'&f_tel3='+tel3+
					'&p_name='+name+'&p_tel1='+tel1+'&p_tel2='+tel2+'&p_tel3='+tel3,
				success : function(data, status){
					$('#ID').html(data);
				}
			});
		});
		$('#searchPWBtn').click(function(){
			var email = $('#pw_email').val();
			var tel1 = $('#pw_tel1').val();
			var tel2 = $('#pw_tel2').val();
			var tel3 = $('#pw_tel3').val();
			$.ajax({
				url : 'searchMemberPw.do',
				type : 'get',
				data : 'f_email='+email+'&f_tel1='+tel1+'&f_tel2='+tel2+'&f_tel3='+tel3+
				'&p_email='+email+'&p_tel1='+tel1+'&p_tel2='+tel2+'&p_tel3='+tel3,
				success : function(data, status){
					$('#PW').html(data);
				}
			})
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div class="menu">
			<ul class="searchtab list-inline-item">
				<li class="active_menu" id="menu1">아이디 찾기</li>
				<li id="menu2">비밀번호 찾기</li>
			</ul>
		</div>
		<div id="searchID">
			<div class="row">
				<div class="col-lg-4">					
				</div>
				<div class="col-lg-8">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<span id="ID"></span>
				</div>
				<div class="col-lg-8">
					<p>전화번호</p>	
					<p><input type="text" name="id_tel1" class="tel_input form-control" id="id_tel1" placeholder=""> -
					<input type="text" name="id_tel2" class="tel_input form-control" id="id_tel2" placeholder=""> -
					<input type="text" name="id_tel3" class="tel_input form-control" id="id_tel3" placeholder=""></p>
					<p>이름</p>
					<p><input type="text" name="id_name" class="name_input form-control" id="id_name" placeholder="이름을 입력해주세요"></p>
					<p><input type="button" class="go_btn btn btn-secondary" id="searchIDBtn" value="아이디찾기"></p>
				</div>
			</div>
		</div>
		<div id="searchPW" style="display: none;">
			<div class="row">
				<div class="col-lg-4">
				
				</div>
				<div class="col-lg-8">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<span id="PW"></span>
				</div>
				<div class="col-lg-8">
					<p>이메일</p>
					<p><input type="text" name="pw_email"  class="form-control" id="pw_email" placeholder="이메일을 입력해주세요"></p>
					<p>전화번호</p>	
					<p><input type="text" name="pw_tel1"  class="tel_input form-control" id="pw_tel1" placeholder="010"> -
					<input type="text" name="pw_tel2"  class="tel_input form-control" id="pw_tel2" placeholder="0000"> -
					<input type="text" name="pw_tel3"  class="tel_input form-control" id="pw_tel3" placeholder="0000"></p>
					<p><input type="button" class="go_btn btn btn-secondary" name="searchPWBtn" id="searchPWBtn" value="비밀번호 찾기"></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>