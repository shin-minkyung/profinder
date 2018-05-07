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
<title>프로파인더 - 검색메인페이지</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/searchmain.css" rel="stylesheet" type="text/css" />
<script>
var clickidx = [];
var clickclass=[];
var startCount;
var endCount;
var current_cate;
var dourl;
var placeid;
$(function(){
	$("#menu1").click(function(){
		$("#search_pro").css("display","block");
		$("#search_contents").css("display","none");
		$("#search_question").css("display","none");
		$("#menu2").removeClass('active_m');
		$("#menu3").removeClass('active_m');
		$(this).addClass('active_m');
	});
	$("#menu2").click(function(){
		$("#search_pro").css("display","none");
		$("#search_contents").css("display","block");
		$("#search_question").css("display","none");
		$("#menu1").removeClass('active_m');
		$("#menu3").removeClass('active_m');
		$(this).addClass('active_m');
	});
	$("#menu3").click(function(){
		$("#search_pro").css("display","none");
		$("#search_contents").css("display","none");
		$("#search_question").css("display","block");
		$("#menu1").removeClass('active_m');
		$("#menu2").removeClass('active_m');
		$(this).addClass('active_m');
	});
	
	
	$(".toppro").click(function(){		
		$("div.menu li").removeClass('active_m');
		$(this).addClass('active_m');
		$("#tab_wrap1").css("display","block");
		$("#tab_wrap2").css("display","none");
		$("#tab_wrap3").css("display","none");
		clickclass.push('pro');
	});
	$(".topcontents").click(function(){	
		$("div.menu li").removeClass('active_m');
		$(this).addClass('active_m');
		$("#tab_wrap2").css("display","block");
		$("#tab_wrap1").css("display","none");
		$("#tab_wrap3").css("display","none");
		clickclass.push('con');
			
	});
	$(".topquestion").click(function(){			
		$("div.menu li").removeClass('active_m');
		$(this).addClass('active_m');
		$("#tab_wrap3").css("display","block");
		$("#tab_wrap1").css("display","none");
		$("#tab_wrap2").css("display","none");
		clickclass.push('que');
	});	
	
	
	$(".pro").click(function(){
		current_cate=$(this).index();
		//alert('this is searchmain.jsp');
		$("div#tab li").removeClass('active_f');
		$(this).addClass('active_f');
		clickidx.push(current_cate);
		startCount = 1;
		endCount = 6;				
		$.ajax({
			url:'${conPath}/topPros.do',	
			type:'post',
			datatype:'html',
			data:'startRow='+1+'&endRow='+6+'&cate_num='+(current_cate+1),
			success:function(data,status){
				$('#block_wrap').html(data);
			}
		});
	});
	
	$(".con").click(function(){
		current_cate=$(this).index();
		clickidx.push(current_cate);
		$("div#tab2 li").removeClass('active_f');
		$(this).addClass('active_f');		
		startCount = 1;
		endCount = 6;
		$.ajax({
			url:'${conPath}/topContents.do',	
			type:'post',
			datatype:'html',
			data:'startRow='+1+'&endRow='+6+'&cate_num='+(current_cate+1),
			success:function(data,status){
				$('#block_wrap2').html(data);
			}
		});
	});
	
// top question section	
	$(".que").click(function(){
		current_cate=$(this).index();
		clickidx.push(current_cate);				
		$("div#tab3 li").removeClass('active_f');
		$(this).addClass('active_f');		
		startCount = 1;
		endCount = 6;
		$.ajax({
			url:'${conPath}/topQuestions.do',	
			type:'post',
			datatype:'html',
			data:'startRow='+1+'&endRow='+6+'&cate_num='+(current_cate+1),
			success:function(data,status){
				$('#block_wrap3').html(data);
			}
		});
	});
});

//Ajax forward button
$(function(){
	startCount = 1;
	endCount = 6;
	$('.arrow.forward').click(function(){
		var lastidx = clickidx.pop();
		clickidx.push(lastidx);
		var lastclass = clickclass.pop();
		clickclass.push(lastclass);
		//alert('분야클릭횟수'+clickidx.length+'\n'+'배열:'+clickidx.toString()+'현재클라스: '+lastclass+' 현재분야:'+lastidx);		
		startCount += 6;
		endCount += 6;		
		if(lastclass==null || lastclass=='pro'){
			dourl='${conPath}/topPros.do';
			placeid='#block_wrap';
		}else if(lastclass=='con'){
			dourl='${conPath}/topContents.do';
			placeid='#block_wrap2';
		}else if(lastclass=='que'){
			dourl='${conPath}/topQuestions.do';
			placeid='#block_wrap3';
		}		
		if(lastidx==null){
			lastidx=0;
		}			
			$.ajax({			
				url:dourl,			
				type:'post',
				datatype:'html',
				data:'startRow='+startCount+'&endRow='+endCount+'&cate_num='+(lastidx+1),
				success:function(data,status){
					if(data.trim().length!=0){											
						$(placeid).html(data);
					}else{
						alert('더 이상 목록이 없습니다');
						startCount -= 6;
						endCount -= 6;
					}					
				}
			});		
	});
		
	$('.arrow.backward').click(function(){
		var lastidx = clickidx.pop();
		clickidx.push(lastidx);
		var lastclass = clickclass.pop();
		clickclass.push(lastclass);
		startCount -= 6;
		endCount -= 6;	
		if(lastclass==null || lastclass=='pro'){
			dourl='${conPath}/topPros.do';
			placeid='#block_wrap';
		}else if(lastclass=='con'){
			dourl='${conPath}/topContents.do';
			placeid='#block_wrap2';
		}else if(lastclass=='que'){
			dourl='${conPath}/topQuestions.do';
			placeid='#block_wrap3';
		}		
		if(lastidx==null){
			lastidx=0;
		}
		if(startCount<0){//startCount is below 0
		 	startCount=1;
			endCount=6;		
			  $.ajax({
					url:dourl,	
					type:'post',
					datatype:'html',
					data:'startRow='+startCount+'&endRow='+endCount+'&cate_num='+(lastidx+1),
					success:function(data,status){
						$(placeid).html(data);
					}
				});			
		 }else{			
				$.ajax({
					url:dourl,	
					type:'post',
					datatype:'html',
					data:'startRow='+startCount+'&endRow='+endCount+'&cate_num='+(lastidx+1),
					success:function(data,status){
						$(placeid).html(data);
					}
				});					
		}//else	
	});
});

//search
$(document).ready(function(){
	$("#searchProBtn").click(function(){
		var area = $("#area").val();
		var cate_num = $("#cate").val();
		//alert(area+','+cate);
		if(area=="none"){
			alert('지역을 선택해주세요');
		}else if(cate_num==-1){
			alert('분야를 선택해주세요');
		}else{
			location.href='${conPath}/searchProforSM.do?cate_num='+cate_num+'&p_area='+area;
		}
	});
	$("#searchConBtn").click(function(){
		var cate_num2 = $("#cate2").val();
		var keywordCon=$("#searchConWord").val();
		//alert(keywordCon+','+cate_num2);		
		if(cate_num2==-1){
			alert('분야를 선택해주세요');			
		}else if(keywordCon==""){
			alert('컨텐츠 검색 키워드를 입력해주세요');
		}else{
			location.href='${conPath}/searchConforSM.do?cate_num='+cate_num2+'&searchWord='+keywordCon;	
		}
	});
	$("#searchQueBtn").click(function(){
		var keywordQue=$("#searchQueWord").val();
		//alert(keywordQue);
		if(keywordQue==""){
			alert('질문 검색 키워드를 입력해주세요');
		}else{
			location.href='${conPath}/searchQueforSM.do?searchWord='+keywordQue;	
		}
	});
	
	var key='${key}';
	//alert('key'+key);
	if(key==1){
		$("div.menu li").removeClass('active_m');
		$(".topcontents").addClass('active_m');
		$("#tab_wrap2").css("display","block");
		$("#tab_wrap1").css("display","none");
		$("#tab_wrap3").css("display","none");
		clickclass.push('con');
	}else if(key==2){
		$("div.menu li").removeClass('active_m');
		$(".topquestion").addClass('active_m');
		$("#tab_wrap3").css("display","block");
		$("#tab_wrap1").css("display","none");
		$("#tab_wrap2").css("display","none");
		clickclass.push('que');
	}
});

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
		  <img class="banner" src="${conPath }/img/searchhome_banner_1000.png">
		</div>
		<div class="menu">
			<ul class="searchtab" class="list-inline-item">			
				<li class="nonmenu">무엇을<br>찾으시나요?</li>
				<li class="active_m" id="menu1">프로</li>
				<li id="menu2">컨텐츠</li>
				<li id="menu3">질문</li>				
			</ul>			
		</div>
		<div id="search">	
		   <div id="search_pro" class="search">	
		     <!-- temp part -->
		     <div class="row">
		       <div class="col-lg-11">
		       <%-- <a href="${conPath }/autoJjim.do">자동찜하기</a>
		         <a href="${conPath }/insert100Pros.do">프로자동넣기</a>
		         <a href="${conPath }/insert100Finders.do">파인더자동넣기</a>
		         <a href="${conPath }/contentsAutoInsert200.do">콘텐츠 200개 자동입력</a> 
		         <a href="${conPath }/questionAutoInsert.do">질문자동넣기</a>
		         <a href="${conPath }/qAnswerAutoInsert.do">답변자동넣기</a>
		         <a href="${conPath }/questionAutolike.do">질문자동좋아요</a>
		         <a href="${conPath }/contentsAutolike.do">컨텐츠자동좋아요</a>
		         <a href="${conPath }/newsfeedAutolike.do">뉴스피드자동좋아요</a>
		         <a href="${conPath }/newsfeedAutoInsert.do">뉴스피드자동넣기</a>
		          <a href="${conPath }/ppageNewsfeedAutoInsert.do">ppage뉴스피드자동넣기</a>
		          <a href="${conPath }/ppageContentsAutoInsert.do">ppage컨텐츠자동넣기</a>
		          <a href="${conPath }/ppageQuestionAutoInsert.do">ppage질문자동넣기</a>
		          <a href="${conPath }/fboardAutoInsert.do">fboard자동넣기</a> --%>
		       </div>
		     </div>	 		     
		     <!-- temp part ends -->	   	
		     <div class="row">
		       <div class="col-lg-4">
		      <label for="area"><span class="label">지역</span></label>
		       </div>
		       <div class="col-lg-7">
      		   <select class="form-control inline" id="area">
      		      <option value="none">지역선택</option>
        		  <option value="서울">서울</option>
         	 	  <option value="경기도">경기도</option>
        		  <option value="충청도">충청도</option>
        		  <option value="전라도">전라도</option>
        		  <option value="경상도">경상도</option>
	 	       </select>  
	 	       </div>
		      </div>
		      <div class="row">
		        <div class="col-lg-4">
		       <label for="area"><span class="label">분야</span></label>
		        </div>
		        <div class="col-lg-7">
        		  <select class="form-control inline" id="cate">
        		      <option value="-1">분야선택</option>
        		    <c:forEach var="a" items="${cate }">
        		      <option value="${a.cate_num }">${a.cate_name }</option>
        		    </c:forEach>        		        		   
	 	         </select>
	 	        </div>
		      </div>
		      <div class="row">
		       <div class="col-lg-4">
		       </div>
		       <div class="col-lg-7">
		         <input type="button" class="btn btn-primary btn-lg btn-block" id="searchProBtn" value="찾기"/>		         
		       </div>
		      </div>
		    </div><!-- #searchPro ENDS-->
		     <div id="search_contents" class="search">	
		       <div class="row">
		         <div class="col-lg-4">
		           	<span class="label">분야</span>
		         </div>
		         <div class="col-lg-7">
		           <select class="form-control inline" id="cate2">
		              <option value="-1">분야선택</option>
        		    <c:forEach var="a" items="${cate }">
        		      <option value="${a.cate_num }">${a.cate_name }</option>
        		    </c:forEach>        		        		   
	 	         </select>
		         </div>
		       </div>		     	
		      <div class="row">
		        <div class="col-lg-4">	
		         <span class="label">키워드</span>	      
		       </div>
		       <div class="col-lg-7">		       	
      		  	 <input type="text" class="form-control" id="searchConWord" placeholder="컨텐츠제목 /내용 검색">
	 	       </div>
		      </div>
		      <div class="row">
		        <div class="col-lg-4">		     
		        </div>
		        <div class="col-lg-7">
        		<button type="button" class="btn btn-primary btn-lg btn-block" id="searchConBtn">찾기</button>	
	 	        </div>
		      </div>		     
		    </div><!-- #searchContents ENDS-->
		    <div id="search_question" class="search">
		      <div class="row">
		        <div class="col-lg-4">	
		         <span class="label">키워드</span>	      
		       </div>
		       <div class="col-lg-7">
      		  	 <input type="text" class="form-control" id="searchQueWord" placeholder="질문 제목 /내용 검색">
	 	       </div>
		      </div>
		      <div class="row">
		        <div class="col-lg-4">		     
		        </div>
		        <div class="col-lg-7">
        		<button type="button" class="btn btn-primary btn-lg btn-block" id="searchQueBtn">찾기</button>	
	 	        </div>
		      </div>
		    </div><!-- #searchQuestion ENDS-->  
		</div><!--  -->
	<div id="allview">
	  <div class="menu">
		 <ul class="searchtab" class="list-inline-item">			
			<li class="nonmenu plain">분야별<br>추천목록</li>
			<li class="active_m toppro">프로</li>
			<li class="topcontents">컨텐츠</li>
			<li class="topquestion">질문</li>				
		</ul>			
	 </div>
<!-- #tab_wrap1 -->
		 <div id="tab_wrap1">
		  <div id="tab">
		    <ul>
		     <li class="active_f edu pro">교육</li>
		     <li class="biz pro">비즈니스</li>
		     <li class="living pro">생활과학</li>
		     <li class="design pro">디자인</li>
		     <li class="develop pro">개발</li>
		     <li class="beauty pro">건강/미용</li>
		     <li class="party pro">이벤트</li>
		     <li class="etc pro">기타</li>
		    </ul>	  
		  </div>
		  <div id="allview_container">		  
		   <div class="arrow backward">
		      <span class="triangle_back"></span>
		   </div>
		   <div class="arrow forward">
		      <span class="triangle_for"></span>
		   </div>
		    <div id="block_wrap">
		     <c:forEach var="topEduPro6" items="${topEduPro6 }">	  		    
		      <div class="block inline">
		          <div class="photo" style="margin-left:10px;">
		            <img src="${conPath }/profile/${topEduPro6.p_photo1}" width="60px";height=auto;/>
		          </div> 
		          <div style="position:absolute; top:70px; left:60px;"><h4>${topEduPro6.p_nickname }</h4>
		          </div>     
		       <ul style="position:absolute; top:100px; left:20px;" class="vertical-list">
		         <li>지역 ${topEduPro6.p_area }</li>
		         <li>찜 ${topEduPro6.jjimCnt }</li>
		         <li>분야 ${topEduPro6.cate_num==1? '교육':'분류오류' }</li>
		       </ul>		      
		         <div class="go">
		         <a href="${conPath }/ppageNewsfeedView.do?p_email=${topEduPro6.p_email}">
		           <img src="${conPath }/img/icon_arrow.png">
		         </a>
		         </div>
		       </div> 		    
		    </c:forEach>
		   </div>
		  </div>
		 </div><!-- #tab_wrap1 ends-->
		 
<!-- #tab_wrap2 -->
		 <div id="tab_wrap2">
		  <div id="tab2">
		    <ul>
		     <li class="active_f edu con">교육</li>
		     <li class="biz con">비즈니스</li>
		     <li class="living con">생활과학</li>
		     <li class="design con">디자인</li>
		     <li class="develop con">개발</li>
		     <li class="beauty con">건강/미용</li>
		     <li class="party con">이벤트</li>
		     <li class="etc con">기타</li>
		    </ul>	  
		  </div>
		  <div id="allview_container">		  
		   <div class="arrow backward">
		      <span class="triangle_back"></span>
		   </div>
		   <div class="arrow forward">
		      <span class="triangle_for"></span>
		   </div>
		    <div id="block_wrap2">
		    <c:forEach var="topEduCon6" items="${topEduCon6 }">
				<div class="block inline">
					<div class="photo" style="margin-left:10px;font-size:2em;color:white;background-color:#23bbc0;">
					${fn:substringAfter(topEduCon6.con_file1,'.') }
					</div>
					<div style="position: absolute; top: 70px; left: 60px;">
						<h4>${topEduCon6.con_title }</h4>
					</div>
					<ul style="position: absolute; top: 100px; left: 20px;"
						class="vertical-list">
						<li>다운로드 ${topEduCon6.con_download }</li>
						<li>가격 ${topEduCon6.con_price }</li>
						<li>분야
						  <c:choose>
					   		<c:when test="${topEduCon6.cate_num==1 }">
					     	교육
					  		</c:when>
					  		<c:when test="${topEduCon6.cate_num==2 }">
					  	         비즈니스
					  		</c:when>
					  	  </c:choose>
						</li>
					</ul>
					<div class="go">
					  <a href="${conPath }/ppageContentView.do?p_email=${topEduCon6.p_email}">
						<img src="${conPath }/img/icon_arrow.png">
					  </a>
					</div>
				</div>
			</c:forEach>
		   </div>
		  </div>
		 </div><!-- #tab_wrap2 ends-->

<!-- #tab_wrap3 -->	
		 <div id="tab_wrap3">
		  <div id="tab3">
		    <ul>
		     <li class="active_f edu que">교육</li>
		     <li class="biz que">비즈니스</li>
		     <li class="living que">생활과학</li>
		     <li class="design que">디자인</li>
		     <li class="develop que">개발</li>
		     <li class="beauty que">건강/미용</li>
		     <li class="party que">이벤트</li>
		     <li class="etc que">기타</li>
		    </ul>	  
		  </div>
		  <div id="allview_container">		  
		   <div class="arrow backward">
		      <span class="triangle_back"></span>
		   </div>
		   <div class="arrow forward">
		      <span class="triangle_for"></span>
		   </div>
		    <div id="block_wrap3">
		     <c:forEach var="topEduQue6" items="${topEduQue6 }">	  		    
		      <div class="block inline">
		          <div class="photo" style="margin-left:10px;">
		            <img src="${conPath }/img/icon_question.png" style="width:60px; height:auto;">
		          </div> 
		          <div style="position:absolute; top:70px; left:20px;">
		          <h4>
		          <c:choose>
		            <c:when test="${fn:length(topEduQue6.q_title)>15 }">
		              <c:out value="${fn:substring(topEduQue6.q_title,0,14) }"></c:out>...
		            </c:when>
		            <c:otherwise>
		            ${topEduQue6.q_title }
		            </c:otherwise>		          
		          </c:choose>
		          </h4>
		          </div>     
		       <ul style="position:absolute; top:100px; left:20px;" class="vertical-list">
		         <li>좋아요${topEduQue6.likecnt }</li>
		         <li>분야 ${topEduQue6.cate_num==1? '교육':'분류오류' }</li>
		         <li>답변평점 ${topEduQue6.q_star }</li>
		       </ul>
		       <div class="q_content">
		        <c:choose>
		         <c:when test="${fn:length(topEduQue6.q_content)>26 }">
		           <c:out value="${fn:substring(topEduQue6.q_content,0,25)}"></c:out>......
		         </c:when>
		         <c:otherwise>
		         ${topEduQue6.q_content }
		         </c:otherwise>		       
		        </c:choose>
		       </div>		      
		         <div class="go">
		           <a href="${conPath }/ppageQuestionView.do?p_email=${topEduQue6.p_email}">
		           <img src="${conPath }/img/icon_arrow.png">
		           </a>
		         </div>
		       </div> 		    
		    </c:forEach>
		   </div>
		  </div>
		 </div><!-- #tab_wrap3 -->
	  </div>
	</div>	
</body>
</html>