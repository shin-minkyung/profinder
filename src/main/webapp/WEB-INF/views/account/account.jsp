<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더 - 계정관리 페이지</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/account.css" rel="stylesheet" type="text/css" />
<script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script>
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>
<script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
<script src="${conPath }/js/popper.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	$("#menu1").click(function(){
		$("#setting").css("display","block");
		$("#point").css("display","none");
		$("#inquiry").css("display","none");
		$("#menu2").removeClass('active_menu');
		$("#menu3").removeClass('active_menu');
		$(this).addClass('active_menu');
	});
	$("#menu2").click(function(){
		$("#setting").css("display","none");
		$("#point").css("display","block");
		$("#inquiry").css("display","none");
		$("#menu1").removeClass('active_menu');
		$("#menu3").removeClass('active_menu');
		$(this).addClass('active_menu');
	});
	$("#menu3").click(function(){
		$("#setting").css("display","none");
		$("#point").css("display","none");
		$("#inquiry").css("display","block");
		$("#menu1").removeClass('active_menu');
		$("#menu2").removeClass('active_menu');
		$(this).addClass('active_menu');
	});
	
	$("#pw_li").click(function(){
		$(".setting_view.sub").css("display","none");
		$("#pw").css("display","block");
		$("div#setting li").removeClass('active_f');
		$(this).addClass('active_f');
		
	});
	$("#info_li").click(function(){
		$(".setting_view.sub").css("display","none");
		$("#info").css("display","block");
		$("div#setting li").removeClass('active_f');
		$(this).addClass('active_f');
	});
	$("#add_info_li").click(function(){
		$(".setting_view.sub").css("display","none");
		$("#add_info").css("display","block");
		$("div#setting li").removeClass('active_f');
		$(this).addClass('active_f');
	});
	$("#drop_li").click(function(){
		$(".setting_view.sub").css("display","none");
		$("#drop").css("display","block");
		$("div#setting li").removeClass('active_f');
		$(this).addClass('active_f');
	});
	
	$("#faq_li").click(function(){
		$("#ask").css("display","none");		
		$("#faq").css("display","block");
		$("div#inquiry li").removeClass('active_f');
		$(this).addClass('active_f');
	});
	$("#ask_li").click(function(){
		$("#ask").css("display","block");		
		$("#faq").css("display","none");
		$("div#inquiry li").removeClass('active_f');
		$(this).addClass('active_f');
	});
});
$(document).ready(function() {
	$(' .card-header').on('click', function() {
		var content = $(this).siblings('.card-body');
		if (content.css('display') == 'none') {
			$('#accordion .card-body').slideUp();
			content.slideDown();
		} else {
			content.slideUp();
		}
	});
	var wing = '${wing}';
	if(wing==1){
		$("#setting").css("display","none");
		$("#point").css("display","block");
		$("#inquiry").css("display","none");
		$("#menu1").removeClass('active_menu');
		$("#menu3").removeClass('active_menu');
		$("#menu2").addClass('active_menu');
	}
	
	var addUpdateResult='${pwModifyResult}';
	if(addUpdateResult==1){
		
	}
});
function pwPhotoChk(){
	if($('#f_pw').val() != $('#f_pwChk').val()){
		alert("비밀번호 확인 비밀번호가 다릅니다");
		return false;
	}
	if($('#f_hyunPw').val().length == 0){
		alert("현재 비밀번호를 입력하셔야합니다");
		return false;
	}else if($('#f_hyunPw2').val() != $('#f_hyunPw').val()){
		alert("현재 비밀번호가 다릅니다");
		return false;
	}else if($('#f_pw').val().length==0){
		
		$('#f_pw').val($('#f_hyunPw').val());
		
	}else if($('#f_pw').val().length == 0){
		alert("변경 비밀번호를 입력하셔야합니다");
		return false;
	}else if($('#f_pwChk').val().length == 0){
		alert("변경 비밀번호 확인을 입력하셔야합니다");
		return false;
	}
	
	
}
function nomal(){
	var tel2 = /^[0-9]{3,4}/;
	var tel3 = /^[0-9]{4}/;
	if($('#hyunPw3').val().length == 0 ){
		alert("현재 비밀번호를 입력하셔야합니다.");
		return false;
	}else if($('#hyunPw3').val() != $('#hyunPw4').val()){
		alert("현재비밀번호가 틀립니다");
		return false;
	}else if(tel2.test($('#f_tel2').val()) == false || $('#f_tel2').val().length == 0){
		alert("전화번호를 확인해주세요");
		return false;
	}else if(tel3.test($('#f_tel3').val()) == false || $('#f_tel3').val().length == 0){
		alert("전화번호를 확인해주세요");
		return false;
	}
}
function addition(){
	if($('#hyunPw6').val().length == 0 ){
		alert("현재 비밀번호를 입력하셔야 합니다.");
		return false;
	}else if($('#hyunPw5').val() != $('#hyunPw6').val()){
		alert("현재비밀번호가 다릅니다");
		return false;
	}else if($('#f_message').val().length == 0){
		alert("알림말을 적어야합니다");
		return false;
	}
}
function drop(){
	if($('#hyunPw8').val().length == 0){
		alert("현재 비밀번호를 입력하셔야 합니다");
		return false;
	}else if($('#hyunPw7').val() != $('#hyunPw8').val()){
		alert("현재 비밀번호가 다릅니다");
		return false;
	}else if(!$('#drop_check').is(':checked')){
		alert("주의사항에 동의 하셔야 합니다");
		return false;
	}
}

</script>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	<c:if test="${not empty findermembers }">
		<jsp:include page="../wing/fpageRightWing.jsp"/>
	</c:if>
	<div id="container">
	  <div id="banner">
	    <img class="banner" src="${conPath }/img/banner_account.png">
	  </div>
	  <div class="menu">
	    <ul class="searchtab list-inline-item">
	      <li class="active_menu" id="menu1">회원정보수정</li>
	      <li id="menu2">포인트 조회</li>
	      <li id="menu3">관리자 문의</li>
	    </ul>
	  </div>
	 <div id="view_container">
	  <div id="setting" class="view">
	    <ul class="ac_setting">
	      <li id="pw_li" class="active_f">비밀<br>번호</li>
	      <li id="info_li">기본<br>정보</li>
	      <li id="add_info_li">부가<br>정보</li>
	      <li id="drop_li">회원<br>탈퇴</li>
	    </ul>
	    <form action="${conPath }/fmembersPwModify.do" method="post" name="pwfrm" enctype="multipart/form-data" onsubmit="return pwPhotoChk()">
	    <div class="setting_view sub" id="pw">
	      <div class="row">	      
	        <div class="col-lg-4">	        
	        <img src="${conPath }/profile/${findermembers.f_photo1!=null? findermembers.f_photo1:promembers.p_photo1 }" style="width:200px; height:auto;"> 
	        <p>
	        <label for="profile">프로필 사진 변경</label>
      		  <input type="file" class="form-control-file" name="f_photo" id="profile" aria-describedby="fileHelp">
      		  <small id="fileHelp" class="form-text text-muted">현재 비밀번호를 입력해야 사진을 변경할 수 있습니다</small>	        
	        </p>
	        </div>
	        <div class="col-lg-8">	        
		         <p>이메일</p>
		         	<input type="hidden" name="f_email" id="f_email1" value="${email }">
		         <p><input type="text" class="form-control width320" readonly="readonly" placeholder="${findermembers.f_email!=null? findermembers.f_email:promembers.p_email }"></p>
		         <p>현재 비밀번호</p>
		         	<input type="hidden" name="f_hyunPw2" id="f_hyunPw2" value='<c:if test="${findermembers != null }">${findermembers.f_pw }</c:if><c:if test="${promembers != null}">${promembers.p_pw }</c:if>'>
		         <p> <input type="password" class="form-control width320" placeholder="현재 비밀번호 입력" name="f_hyunPw" id="f_hyunPw"></p>
		         <p>변경 비밀번호</p>
		         <p> <input type="password" class="form-control width320" placeholder="새로운 비밀번호" name="f_pw" id="f_pw"></p>
		         <p>변경 비밀번호 확인</p>
		         <p> <input type="password" class="form-control width320" placeholder="새로운 비밀번호 확인" name="f_pwChk" id="f_pwChk"></p>
		         <p><input type="submit" class="btn btn-primary btn-lg btn-block width320" value="비밀번호/사진 변경" style="width:320px;"></p>	         
	        </div>	       
	      </div>
	    </div>
	    </form>	    
	    
	  	<form action="${conPath }/nomalUpdate.do" name="nomalfrm" onsubmit="return nomal()" method="post">
	    <div class="setting_view hidden sub" id="info">
	      <div class="row">
	        <div class="col-lg-4">
	           <img src="${conPath }/profile/${findermembers.f_photo1!=null? findermembers.f_photo1:promembers.p_photo1 }" style="width:200px; height:auto;">
	          <p><small>현재 비밀번호를 꼭 입력하세요</small></p>	          
	        </div>
	        <div class="col-lg-8">
	           <p>현재 비밀번호</p>
	           <input type="hidden" name="f_email" id="f_email2" value="${email }">
	           <input type="hidden" name="hyunPw3" id="hyunPw3" value="<c:if test="${findermembers != null }">${findermembers.f_pw }</c:if><c:if test="${promembers != null}">${promembers.p_pw }</c:if>">
	           <p> <input type="password" class="form-control width320" placeholder="현재 비밀번호 입력" name="hyunPw4" id="hyunPw4"></p>
	           <p>연락처 변경</p>
	           <p>
	            <select class="form-control inline" style="width:70px;" name="f_tel1" id="f_tel1">
	              <option>010</option>
	              <option>011</option>
	              <option>017</option>
	              <option>019</option>
	              <option>02</option>
	              <option>031</option>
	              <option>032</option>
	              <option>042</option>
	            </select>
	            -
	            <input type="text" class="form-control inline" style="width:60px;" value="${findermembers.f_tel2!=null? findermembers.f_tel2:promembers.p_tel2 }" name="f_tel2" id="f_tel2" maxlength="4">
	            -
	            <input type="text" class="form-control inline" style="width:60px;" value="${findermembers.f_tel3!=null? findermembers.f_tel3:promembers.p_tel3 }" name="f_tel3" id="f_tel3" maxlength="4">
	            </p>
	            <p>계좌번호</p>
	            <select class="form-control inline" style="width:120px;" name="f_bank">
	             <c:if test="${promembers.p_bank!=null }">
	             <option value="${promembers.p_bank }">${promembers.p_bank }</option>
	             </c:if>  
	             <c:if test="${findermembers.f_bank!=null }">
	             <option value="${findermembers.f_bank }">${findermembers.f_bank }</option>
	             </c:if>         	              
	              <option>우리은행</option>
	              <option>하나은행</option>
	              <option>국민은행</option>
	              <option>신한은행</option>
	              <option>농협</option>
	              <option>기업은행</option>
	            </select>
	            <input type="text" class="form-control inline" value="${findermembers.f_accountnum!=null? findermembers.f_accountnum:promembers.p_accountnum }" name="f_accountnum">
	            <input type="text" class="form-control inline" style="width:80px;" placeholder="예금주명" value="${name }" name="f_name" id="f_name">
	            <p><small>예금주명은 회원이름으로 저장됩니다</small></p>	            
	            <p> 거주지역</p>
	            <p>
	            <select class="form-control inline" style="width:120px;" name="f_area" id="f_area">	             
	              <option>서울</option>
	              <option>경기도</option>
	              <option>충청도</option>
	              <option>전라도</option>
	              <option>경상도</option>
	              <option>인천</option>
	              <option>대전</option>
	              <option>대구</option>
	              <option>광주</option>
	              <option>울산</option>
	              <option>제주</option>
	            </select>
	            </p>
	            <p><input type="submit" class="btn btn-primary btn-lg btn-block width320" value="기본정보 수정" style="width:320px;"></p>
	        </div>
	      </div>	   
	    </div>
	    </form>
	  
	    <form action="${conPath }/additionUpdate.do" method="post" enctype="multipart/form-data" name="additionfrm" onsubmit="return addition()">
		    <div class="setting_view hidden sub" id="add_info">
		      <div class="row">	  
		        <div class="col-lg-6">
		        <c:if test="${not empty promembers or not empty findermembers }">
		         <div id="ppage_bg" style="background-color:${promembers!=null? '#1a87b5':'#ac9bee'}">
		          <c:if test="${not empty promembers.p_photo2 or not empty findermembers.f_photo2}">
		           <img src="${conPath }/profile/${promembers.p_photo2!=null? promembers.p_photo2: findermembers.f_photo2}">
		          </c:if>
		         </div>
		         <div id="ppage_photo1">
		          <img src="${conPath }/profile/${promembers.p_photo1!=null? promembers.p_photo1: findermembers.f_photo1}" style="width:60px;">
		         </div>
		         <div id="ppage_img">
		          <img src="${conPath }/img/mypage.png" style="width:400px; height:auto;">
		         </div>	 
		        </c:if>       
		        </div>     
		        <div class="col-lg-6">
		          <p>현재 비밀번호</p>
		          	<input type="hidden" name="f_email" id="f_email3" value="${email }">
		          	<input type="hidden" name="hyunPw5" id="hyunPw5" value="<c:if test="${findermembers != null }">${findermembers.f_pw }</c:if><c:if test="${promembers != null}">${promembers.p_pw }</c:if>">
		          <p> <input type="password" class="form-control width320" placeholder="현재 비밀번호 입력" name="hyunPw6" id="hyunPw6"></p>
		          <p>알림말</p>
		          <p>
		           <input type="text" class="form-control width320" value="${promembers.p_message!=null? promembers.p_message:findermembers.f_message }" name="f_message" id="f_message">
		          </p>
		          <p>내 페이지 배경 이미지</p>
		          <p>
		           <label for="bg_photo">배경 사진 변경</label>
	      		    <input type="file" class="form-control-file" id="bg_photo" aria-describedby="fileHelp" value="${promembers.p_photo2!=null? promembers.p_photo2:findermembers.f_photo2 }" name="f_photo2" id="f_photo2">
	      		    <small id="fileHelp" class="form-text text-muted">현재 비밀번호를 입력해야 사진을 변경할 수 있습니다</small>	        
		          </p>	 
		          <p><input type="submit" class="btn btn-primary btn-lg btn-block width320" value="수정하기" style="width:320px;"></p>	                  
		        </div>
		      </div>	    
		    </div>	
	    </form>
	    <form action="${conPath }/dropUpdate.do" name="dropfrm" onsubmit="return drop()">
		    <div class="setting_view hidden sub" id="drop">
		    <div class="row">
		     <div class="col-lg-4">
		      <img src="${conPath }/img/bye.png" style="width:270px;opacity:0.3;">
		      <p>탈퇴 후 30일이 지나면 데이터는 영구히 삭제됩니다</p>
		      <c:if test="${not empty promembers }">
		      <p>탈퇴 전 정산신청하지 않은 포인트는 소멸됩니다. 탈퇴 후 청구할 수 없습니다.</p>
		      </c:if>
		      <c:if test="${not empty findermembers }">
		      <p>탈퇴 전 사용하지 않은 포인트는 소멸됩니다. 탈퇴 후 환불되지 않습니다.</p>
		      </c:if>
		     </div>
		     <div class="col-lg-8">
		        <p>현재 비밀번호</p>
		        <input type="hidden" name="f_email" id="f_email4" value="${email }">
		        <input type="hidden" name="hyunPw7" id="hyunPw7" value="<c:if test="${findermembers != null }">${findermembers.f_pw }</c:if><c:if test="${promembers != null}">${promembers.p_pw }</c:if>">
		        <p> <input type="password" class="form-control width320" placeholder="현재 비밀번호 입력" name="hyunPw8" id="hyunPw8"></p>
		        <p><span class="big">정말 탈퇴하시겠습니까?</span></p> 
		        
		         <div class="custom-control custom-checkbox">
	      			<input type="checkbox" class="custom-control-input" id="drop_check" checked="">
	      			<label class="custom-control-label" for="drop_check">네. 저는 주의사항을 확인하였으며 탈퇴를 원합니다.</label>
	    		</div>
	    		<p></p>	            
	    		<p><input type="submit" class="btn btn-primary btn-lg btn-block width320" value="탈퇴하기" style="width:320px;"></p>	 
		     </div>
		    </div>		    
		    </div> 
	    </form>  
	  </div>
	  
	  <div id="point" class="view hidden">	 
	    <div class="row">
	      <div class="col-lg-4">
	         <span class="big">포인트조회/충전</span>	       
	      </div>
	      <div class="col-lg-8">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-lg-4">
	      </div>
	      <div class="col-lg-8">
	      	<img src="${conPath }/img/coins.png" style="width:70px; height:auto;">	   
	        <img src="${conPath }/img/coins.png" style="width:150px; height:auto;">	 
	        <img src="${conPath }/img/coins.png" style="width:100px; height:auto;">	          
	      </div>
	    </div>
	    <div class="row">
	   	   <div class="col-lg-2">
	       </div>	      
	      <div class="col-lg-10">
	      <span class="big indigo">${findermembers.f_nickname!=null? findermembers.f_nickname:promembers.p_nickname }</span> 님의 포인트는 <span id="myPoint" class="big indigo">${loginfinder.f_point!=null? loginfinder.f_point: loginpro.p_point }</span> p입니다
	      <c:if test="${not empty findermembers }">
	      <p><small>환불은 1주일 내로 사용하지 않은 포인트에 한해 가능합니다.</small></p>
	      </c:if>
	      <c:if test="${not empty promembers }">
	      <p><small>정산신청은 마지막 신청일의 30일 후에 가능합니다</small></p>
	      </c:if>
	      </div>	      
	    </div> 
<!-- finder account login -->
   <c:if test="${not empty findermembers }">   
	    <div class="row">
	      <div class="col-lg-2"></div>
	      <div class="col-lg-2">
	     	충전금액 선택
	      </div>
	      <div class="col-lg-2">
	        <select class="form-control inline">
	         <option value="1000">1000</option>
	         <option value="2000">2000</option>
	         <option value="3000">3000</option>
	         <option value="4000">4000</option>
	         <option value="5000">5000</option>
	         <option value="6000">6000</option>
	         <option value="7000">7000</option>
	         <option value="8000">8000</option>
	         <option value="9000">9000</option>
	         <option value="10000">10000</option>
	         <option value="20000">20000</option>
	         <option value="30000">30000</option>
	         <option value="50000">50000</option>
	         <option value="100000">100000</option>
	        </select>	
	       </div>
	       <div class="col-lg-2">
	             <button class="btn btn-primary btn-sm" id="pointUp">충전</button>
	       </div>
	       <div class="col-lg-4" id="result">
	       </div>    
	    </div>
	   <script type="text/javascript">
 	$(document).ready(function(){
	 $("#pointUp").click(function(){
		 var point= $("#point option:selected").val();
		 var f_email='${loginfinder.f_email}';
		 alert(point+'p를 충전합니다');
		  $.ajax({
				url:'${conPath}/pointUp.do',	
				type:'post',
				datatype:'html',
				data:'f_email='+f_email+'&f_point='+point,
				success:function(data,status){
					var trimdata = data.trim();
					var newpoint=parseInt(trimdata);
					var msg=trimdata.substring(trimdata.indexOf(',')+1,trimdata.length);				
					$("#result").html(msg);
					$("#myPoint").html(newpoint);							
		     		}
			 	});
	 		});
 		});
		</script>	   	   	 
    </c:if>
<!-- promember login -->
	<div class="row">
	   <div class="col-lg-2"></div>
	   <div class="col-lg-2">
	        계좌번호 확인
	   </div>
	   <div class="col-lg-4">
	    ${promembers.p_bank!=null? promembers.p_bank:'입력된 계좌가 없습니다. 계좌 입력후 정산신청 가능합니다' }
	    ${promembers.p_accountnum!=null? promembers.p_accountnum:'계좌번호가 없습니다' }
	    <c:if test="${promembers.p_bank!=null }">
	          <p>예금주: ${promembers.p_accountnum!=null? promembers.p_nickname:'' }</p>
	    </c:if>
	   </div>
	   <div class="col-lg-2">
	    <c:if test="${promembers.p_bank!=null }">
	         <button class="btn btn-primary">정산신청</button>
	         <script type="text/javascript">
	         $(document).ready(function(){
	        	 $("#request").click(function(){
	        		 var proPoint='${loginpro.p_point}';
	        		 //alert(proPoint);
	        		 if(proPoint<10000){
	        			 alert('10000p 이상일 때 정산신청 가능합니다');
	        		 }else{
	        			 alert('신청완료 되었습니다. 관리자 확인후 입금됩니다');
	        		 }
	        	 });
	         });	         
	         </script>
	    </c:if>
	   </div>
	   <div class="col-lg-2">
	   </div>     
	 </div>	 
</div>	  
	  <div id="inquiry" class="view hidden">
	   <ul class="ac_setting">
	      <li id="faq_li" class="active_f">FAQ</li>
	      <li id="ask_li">1:1<br>문의</li>	     
	   </ul>
	   <div class="inquiry_view sub" id="faq">
<!-- FAQ --> 

<div id="accordion_tab">
<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" href="#members"
			aria-controls="all" role="tab" data-toggle="tab">회원 관련</a></li>
		<li class="nav-item"><a class="nav-link" href="#sell"
			aria-controls="members" role="tab" data-toggle="tab">판매관련</a></li>
		<li class="nav-item"><a class="nav-link" href="#buy"
			aria-controls="sell" role="tab" data-toggle="tab">구매관련</a></li>	
	</ul>
 </div><!-- accrdion_tab -->
 <div id="faq_accordion"> 
	<div id="myTabContent" class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="members">
			<c:forEach var="list" items="${faqViewResult }">
				<c:if test="${list.faq_catenum==1 }">
					<div class="card bg-light mb-3" style="max-width: 60rem;"
						id="accordion">
						<div class="card-header border">
							${list.faq_title }
						</div>
						<div class="card-body border">
							<p class="card-text">${list.faq_content }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
      <div role="tabpanel" class="tab-pane" id="sell">
			<c:forEach var="list" items="${faqViewResult }">
				<c:if test="${list.faq_catenum==2 }">
					<div class="card bg-light mb-3" style="max-width: 60rem;"
						id="accordion">
						<div class="card-header border">
							${list.faq_title }
						</div>
						<div class="card-body border">
							<p class="card-text">${list.faq_content }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div role="tabpanel" class="tab-pane" id="buy">
			<c:forEach var="list" items="${faqViewResult }">
				<c:if test="${list.faq_catenum==3 }">
					<div class="card bg-light mb-3" style="max-width: 60rem;"
						id="accordion">
						<div class="card-header">
							${list.faq_title }
						</div>
						<div class="card-body">
							<p class="card-text">${list.faq_content }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
</div>
   <div class="inquiry_view sub hidden" id="ask">
   	<div id="accordion_tab">
   		<ul class="nav nav-tabs">
   			<li class="nav-item active">
   				<a class="nav-link" href="#claimInsert"
   				 aria-controls="all" role="tab" data-toggle="tab" aria-expanded="true">1:1문의하기</a>
   			</li>
   			<li class="nav-item">
   				<a class="nav-link" href="#claimList" 
   				aria-controls="members" role="tab" data-toggle="tab" aria-expanded="false">1:1문의목록</a>
   			</li>
   		</ul>
   	</div>
   
   <div id="claim_accordion">
   	<div id="myTabContent" class="tab-content">
   		<div role="tabpanel" class="tab-pane active" id="claimInsert">
   			<div class="claimInsertFormdiv" style="position:absolute;top:100px;">
				<form action="${conPath }/claimInsert.do" method="post">
					<span style="position: absolute;left:150px;top:4px;">이메일</span>
					<input type="hidden" name="cl_email" value="${email }"/>
					<input type="hidden" name="cl_nickname" value="${nickname }"/>
					<input type="text"  class="form-control width320" 
					disabled="disabled" style="margin-left:225px;margin-bottom:10px; width:400px;" value="${email }"/>
					<span style="position: absolute;left:150px;top:48px;">닉네임</span>
					<input type="text" class="form-control width320"
					disabled="disabled" style="margin-left:225px;margin-bottom:10px; width:400px;" value="${nickname }"/>
					<select name="cl_cate" class="form-control inline" style="width:150px;position:absolute; left:125px;">
						<option>회원</option>
						<option>사이트</option>
						<option>기타</option>
					</select>
					<input type="text" name="cl_title" class="form-control width320" placeholder="문의 제목을 적어주세요"
					style="margin-left:305px;margin-bottom:10px;"/>
					<textarea name="cl_content" class="form-control" rows="3" style="text-align:left;width:500px;height:250px;margin-left:125px;margin-bottom:10px;"
					placeholder="문의 내용을 적어주세요"></textarea>
					<input type="submit" class="btn btn-primary btn-lg btn-block width320" value="1:1문의 글 작성"
					style="width:245px;margin-left:125px;"/>
					<input type="reset" class="btn btn-primary btn-lg btn-block width320" value="글 다시작성"
					style="width:245px;margin-left:380px;position: absolute;bottom: 0px;"/>
				</form>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="claimList" style="position:absolute; top:100px;">
			<c:forEach var="list" items="${claimViewResult }">
				<div class="card bg-light mb-3" style="max-width:60rem;" id="accordion">
					<div class="card-header border">
						<span>${list.cl_cate }</span>
						<span style="position:absolute;left:150px;">${list.cl_title }</span>
						<span style="position:absolute;right:6px;top:18px;font-size:0.5em;font-weight: bold;">${list.cl_date }</span>
						<c:if test="${list.cl_status == 0}">
							<span style="position: absolute;right: 5px;font-weight: bold;top:-10px;">처리중</span>
						</c:if>
						<c:if test="${list.cl_status == 1}">
							<span style="position: absolute;right: 5px;font-weight: bold;top:-10px;">처리완료</span>
						</c:if>
					</div>
					<div class="card-body border" id="cl_content${list.cl_num}">
						<p class="card-text">${list.cl_content }</p>
						<div class="btnDiv">
							<input type="button" id="modifyViewBtn${list.cl_num }" class="btn btn-primary btn-lg btn-block width320" value="수정" style="width:120px;margin-left:470px;"/>
							<input type="button" id="deleteBtn${list.cl_num }" class="btn btn-primary btn-lg btn-block width320" value="삭제" style="width:120px;position: absolute;top:0px;right:30px;margin-top:0px;"
							onclick="location.href='${conPath}/claimDelete.do?cl_num=${list.cl_num }&pageNum=${pageNum}&cl_email=${email }'"/>
						</div>
					</div>
				</div>
				<script>
					$(function(){
						$('#modifyViewBtn${list.cl_num}').click(function(){
							$.ajax({
								url:'${conPath}/claimModifyView.do',
								type:'post',
								datatype:'html',
								data:'cl_content=${list.cl_content}&cl_num=${list.cl_num}',
								success:function(data,status){
									$('#cl_content${list.cl_num}').html(data);
								}
							});
						});
					})
				</script>
			</c:forEach>
		<div class="claimPaging" style="position:absolute; top:400px;left:246px;">
		  <ul class="pagination">
		  	<c:if test="${paging.startPage>paging.blockSize }">
		    	<li class="page-item">
		      		<a class="page-link" href="${conPath }/claimList.do?pagNum=${paging.startPage+1}&cl_email=${email}">&laquo;</a>
		    	</li>
		    </c:if>
		    <c:if test="${paging.startPage<paging.blockSize }">
			    <li class="page-item disabled">
			    	<a class="page-link" href="#">&laquo;</a>
			    </li>
		    </c:if>
		    <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.currentPage==i }">
					<li class="page-item active">
						<a class="page-link">${i }</a>
					</li>
				</c:if>
				<c:if test="${paging.currentPage!=i }">
					<li class="page-item">
						<a class="page-link" href="${conPath }/claimList.do?pageNum=${i}&cl_email=${email}">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage>paging.pageCnt }">
				<li class="page-item disabled">
			    	<a class="page-link" href="#">&raquo;</a>
			    </li>
		    </c:if>
			<c:if test="${paging.endPage<paging.pageCnt }">
				<li class="page-item">
					<a class="page-link" href="${conPath }/claimList.do?pageNum=${paging.endPage+1}&cl_email=${email}">&raquo;</a>
				</li>
			</c:if>
		  </ul>
		</div>
		</div>
		
   	</div>
   </div>
  </div>
	  </div>
	</div>
	</div><!-- #container -->
	
</body>
</html>