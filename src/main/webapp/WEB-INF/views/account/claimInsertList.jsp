<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${claimInsert==1 }">
	<script>
		alert('1:1문의가 등록되었습니다.');
	</script>
</c:if>
<c:if test="${claimInsert==0 }">
	<script>
		alert('1:1문의가 실패되었습니다.');
	</script>
</c:if>
<script type="text/javascript">
$(function(){
	var claimInsert = 1;
	if(claimInsert==1){
		$("#setting").css("display","none");
		$("#point").css("display","none");
		$("#inquiry").css("display","block");
		$("#menu1").removeClass('active_menu');
		$("#menu2").removeClass('active_menu');
		$("#faq").css("display","none");
		$("#ask").css("display","block");
		claimInsert=0;
	}
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
});
</script>

</head>
<body>
<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	<div id="container">
	  <div id="banner">
	    <img class="banner" src="${conPath }/img/banner_account.png">
	  </div>
	  <div class="menu">
	    <ul class="searchtab list-inline-item">
	      <li id="menu1">회원정보수정</li>
	      <li id="menu2">포인트 조회</li>
	      <li class="active_menu" id="menu3">관리자 문의</li>
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
	    
	    <div class="setting_view sub" id="pw">
	      <div class="row">
	        <div class="col-lg-4">
	        <img src="${conPath }/img/${findermembers.f_photo1!=null? findermembers.f_photo1:promembers.p_photo1 }" style="width:200px; height:auto;"> 
	        <p>
	        <label for="profile">프로필 사진 변경</label>
      		  <input type="file" class="form-control-file" id="profile" aria-describedby="fileHelp">
      		  <small id="fileHelp" class="form-text text-muted">현재 비밀번호를 입력해야 사진을 변경할 수 있습니다</small>	        
	        </p>
	        </div>
	        <div class="col-lg-8">
	         <p>이메일</p>
	         <p><input type="text" class="form-control width320" readonly="readonly" placeholder="${findermembers.f_email!=null? findermembers.f_email:promembers.p_email }"></p>
	         <p>현재 비밀번호</p>
	         <p> <input type="text" class="form-control width320" placeholder="현재 비밀번호 입력"></p>
	         <p>변경 비밀번호</p>
	         <p> <input type="text" class="form-control width320" placeholder="새로운 비밀번호"></p>
	         <p>변경 비밀번호 확인</p>
	         <p> <input type="text" class="form-control width320" placeholder="새로운 비밀번호 확인"></p>
	         <p><button type="button" class="btn btn-primary btn-lg btn-block width320">비밀번호/사진 변경</button></p>
	        </div>
	      </div>
	    </div>
	  
	    <div class="setting_view hidden sub" id="info">
	      <div class="row">
	        <div class="col-lg-4">
	           <img src="${conPath }/img/${findermembers.f_photo1!=null? findermembers.f_photo1:promembers.p_photo1 }" style="width:200px; height:auto;">
	          <p><small>현재 비밀번호를 꼭 입력하세요</small></p>	          
	        </div>
	        <div class="col-lg-8">
	           <p>현재 비밀번호</p>
	           <p> <input type="text" class="form-control width320" placeholder="현재 비밀번호 입력"></p>
	           <p>연락처 변경</p>
	           <p>
	            <select class="form-control inline" style="width:70px;">
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
	            <input type="text" class="form-control inline" style="width:60px;" value="${findermembers.f_tel2!=null? findermembers.f_tel2:promembers.p_tel2 }">
	            -
	            <input type="text" class="form-control inline" style="width:60px;" value="${findermembers.f_tel3!=null? findermembers.f_tel3:promembers.p_tel3 }">
	            </p>
	            <p>계좌번호</p>
	            <select class="form-control inline" style="width:120px;">
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
	            <input type="text" class="form-control inline" value="${findermembers.f_accountnum!=null? findermembers.f_accountnum:promembers.p_accountnum }">
	            <input type="text" class="form-control inline" style="width:80px;" placeholder="예금주명" value="회원이름">
	            <p><small>예금주명은 회원이름으로 저장됩니다</small></p>	            
	            <p> 거주지역</p>
	            <p>
	            <select class="form-control inline" style="width:120px;">	             
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
	            <p><button type="button" class="btn btn-primary btn-lg btn-block width320">기본정보 수정</button></p>
	        </div>
	      </div>	   
	    </div>
	    <div class="setting_view hidden sub" id="add_info">
	      <div class="row">	  
	        <div class="col-lg-6">
	        <c:if test="${not empty promembers }">
	         <div id="ppage_bg">
	          <c:if test="${not empty promembers.p_photo2 }">
	           <img src="${conPath }/img/${promembers.p_photo2}">
	          </c:if>
	         </div>
	         <div id="ppage_photo1">
	          <img src="${conPath }/img/${promembers.p_photo1!=null? promembers.p_photo1: findermembers.f_photo1}" style="width:60px;">
	         </div>
	         <div id="ppage_img">
	          <img src="${conPath }/img/mypage.png" style="width:400px; height:auto;">
	         </div>	 
	        </c:if>       
	        </div>     
	        <div class="col-lg-6">
	          <p>현재 비밀번호</p>
	          <p> <input type="text" class="form-control width320" placeholder="현재 비밀번호 입력"></p>
	          <p>알림말</p>
	          <p>
	           <input type="text" class="form-control width320" value="${promembers.p_message!=null? promembers.p_message:findermembers.f_message }">
	          </p>
	          <p>내 페이지 배경 이미지</p>
	          <p>
	           <label for="profile">배경 사진 변경</label>
      		    <input type="file" class="form-control-file" id="profile" aria-describedby="fileHelp" value="${promembers.p_photo2!=null? promembers.p_photo2:findermembers.f_photo2 }">
      		    <small id="fileHelp" class="form-text text-muted">현재 비밀번호를 입력해야 사진을 변경할 수 있습니다</small>	        
	          </p>	 
	          <p><button type="button" class="btn btn-primary btn-lg btn-block width320">수정하기</button></p>	                  
	        </div>
	      </div>	    
	    </div>	
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
	        <p> <input type="text" class="form-control width320" placeholder="현재 비밀번호 입력"></p>
	        <p><span class="big">정말 탈퇴하시겠습니까?</span></p> 
	        
	         <div class="custom-control custom-checkbox">
      			<input type="checkbox" class="custom-control-input" id="drop_check" checked="">
      			<label class="custom-control-label" for="drop_check">네. 저는 주의사항을 확인하였으며 탈퇴를 원합니다.</label>
    		</div>
    		<p></p>	            
    		<p><button type="button" class="btn btn-primary btn-lg btn-block width320">탈퇴하기</button></p>	 
	     </div>
	    </div>
	    
	    </div>  
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
	      <span class="big indigo">${findermembers.f_nickname!=null? findermembers.f_nickname:promembers.p_nickname }</span> 님의 포인트는 <span class="big indigo">${findermembers!=null? findermembers.f_point:promembers.p_point }</span> p입니다
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
	         <button class="btn btn-primary btn-sm">충전</button>
	       </div>
	       <div class="col-lg-4">
	       </div>     
	    </div>	 
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
	    </c:if>
	   </div>
	   <div class="col-lg-2">
	   </div>     
	 </div>	 
</div>
	  
	  <div id="inquiry" class="view hidden">
	   <ul class="ac_setting">
	      <li id="faq_li" >FAQ</li>
	      <li id="ask_li" class="active_f">1:1<br>문의</li>	     
	   </ul>
	   <div class="inquiry_view sub hidden" id="faq">
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
   <div class="inquiry_view sub" id="ask">
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
   		<div role="tabpanel" class="tab-pane" id="claimInsert">
   			<div class="claimInsertFormdiv" style="position:absolute;top:100px;">
				<form action="${conPath }/claimInsert.do">
					<span style="position: absolute;left:150px;top:4px;">이메일</span>
					<input type="text" name="cl_email" class="form-control width320" 
					disabled="disabled" style="margin-left:225px;margin-bottom:10px; width:400px;" value="${email }"/>
					<span style="position: absolute;left:150px;top:48px;">닉네임</span>
					<input type="text" name="cl_nickname" class="form-control width320"
					disabled="disabled" style="margin-left:225px;margin-bottom:10px; width:400px;" value="${nickname }"/>
					<select name="cl_cate" class="form-control inline" style="width:150px;position:absolute; left:125px;">
						<option>회원</option>
						<option>사이트</option>
					</select>
					<input type="text" name="cl_title" class="form-control width320" placeholder="문의 제목을 적어주세요"
					style="margin-left:305px;margin-bottom:10px;"/>
					<textarea name="cl_content" style="text-align:left;padding-left:5px;border-radius:10px;width:500px;height:250px;"
					placeholder="문의 내용을 적어주세요"></textarea>
					<input type="submit" class="btn btn-primary btn-lg btn-block width320" value="1:1문의 글 작성"
					style="width:245px;margin-left:125px;"/>
					<input type="reset" class="btn btn-primary btn-lg btn-block width320" value="글 다시작성"
					style="width:245px;margin-left:380px;position: absolute;bottom: 0px;"/>
				</form>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane active" id="claimList" style="position:absolute; top:100px;">
			<c:forEach var="list" items="${claimViewResult }">
				<div class="card bg-light mb-3" style="max-width:60rem;" id="accordion">
					<div class="card-header border">${list.cl_num }</div>
					<div class="card-body border">
						<p class="card-text">${list.cl_content }</p>
					</div>
				</div>
			</c:forEach>
		</div>
   	</div>
   </div>
  </div>
	  </div>
	</div>
	</div><!-- #container -->
	
</body>
</html>