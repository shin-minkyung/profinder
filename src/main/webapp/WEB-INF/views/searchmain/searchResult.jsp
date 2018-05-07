<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더 - 검색메인페이지</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/searchmain.css" rel="stylesheet" type="text/css" />
<script>
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
});

</script>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
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
		   <!--  -->	     	
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
		         <button type="button" class="btn btn-primary btn-lg btn-block" id="searchProBtn">찾기</button>		         
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
		</div>
<div id="allview">
<!-- PRO Search Result -->
  <div id="box_wrap">
	<c:if test="${p_area!=null }">	
	 <c:if test="${fn:length(searched)!=0 }">
	 <div class="msg">
	 	<span class="label">지역 : ${p_area }, 분야:
	 	    <c:forEach var="ca" items="${cate }">
		        <c:if test="${ca.cate_num== cate_num}">
		              ${ca.cate_name }
		         </c:if>
		    </c:forEach>
	 	, 검색결과 ${cnt }개</span>
	 </div>
	  <c:forEach var="pro" items="${searched }">
	    <div class="block inline">
		    <div class="photo" style="margin-left:10px;">
		       <a href="${conPath }/ppageNewsfeedView.do?p_email=${pro.p_email}">
		        <img src="${conPath }/profile/${pro.p_photo1}" width="60px";height="auto";/>
		       </a>
		    </div> 
		    <div style="position:absolute; top:70px; left:60px;">
		     <h4>
		      <a href="${conPath }/ppageNewsfeedView.do?p_email=${pro.p_email}">
		    	${pro.p_name }
		      </a>
		    </h4>
		    </div>     
		       <ul style="position:absolute; top:100px; left:20px;" class="vertical-list">
		         <li>지역 ${pro.p_area }</li>		         
		         <li>분야
		            <c:forEach var="c" items="${cate }">
		               <c:if test="${c.cate_num== pro.cate_num}">
		                 ${c.cate_name }
		               </c:if>
		            </c:forEach>
		         </li>
		         <li>포인트 수입 ${pro.p_point }</li>
		       </ul>		      
		         <div class="go">
		         <a href="${conPath }/ppageNewsfeedView.do?p_email=${pro.p_email}">
		           <img src="${conPath }/img/icon_arrow.png">
		         </a>
		         </div>
		</div>	 
	  </c:forEach>
	  </c:if>
	  <c:if test="${fn:length(searched)==0  }">
	    <p>검색결과가 없습니다.</p>
	  </c:if>
	</c:if><!-- PRO Search Result ends-->
	
	<c:if test="${searchWord!=null && que==null}">
	 <c:if test="${fn:length(searched)!=0 }">
	    <div class="msg">
	 	<span class="label">키워드 : ${searchWord }, 분야:
	 	    <c:forEach var="ca2" items="${cate }">
		        <c:if test="${ca2.cate_num== cate_num}">
		              ${ca2.cate_name }
		         </c:if>
		    </c:forEach>
	 	, 검색결과 ${cnt }개</span>
	 	</div>
	   <c:forEach var="con" items="${searched }">
	     <div class="block inline">
			<div class="photo" style="margin-left:10px;font-size:2em;color:white;background-color:#23bbc0;">
			 ${fn:substringAfter(con.con_file1,'.') }
			</div>
			<div style="position: absolute; top: 70px; left: 60px;">			
			  <h4>
			   <a href="${conPath }/ppageContentView.do?p_email=${con.p_email}">
			  ${con.con_title }
			   </a>
			  </h4>			 
			</div>
			 <ul style="position: absolute; top: 120px; left: 20px;"
			  	class="vertical-list">
				<li>다운로드 ${con.con_download }</li>
				<li>가격 ${con.con_price }</li>
				<li>분야
			       <c:forEach var="c" items="${cate }" varStatus="status">					  				  
					 <c:if test="${cate[status.index].cate_num==con.cate_num }">
					 	${cate[status.index].cate_name }
					  </c:if>
				   </c:forEach>
				</li>
			   </ul>
			<div class="go">
			 <a href="${conPath }/ppageContentView.do?p_email=${con.p_email}">
				<img src="${conPath }/img/icon_arrow.png">
		     </a>
			</div>
		</div>	    	     
	   </c:forEach>
	 </c:if>
	 <c:if test="${fn:length(searched)==0 }">
	     <p><span class="label">컨텐츠 검색결과가 없습니다.</span></p>
	 </c:if>   
	</c:if><!-- CONTENTS Search Result ends -->
	
	<c:if test="${que!=null }">
	  <c:if test="${fn:length(searched)!=0  }">
	   <div class="msg">
	 	<span class="label">키워드 : ${searchWord }, 검색결과 ${cnt }개</span>
	 	</div>
	   <c:forEach var="que" items="${searched }">
	   	 <div class="block inline">
		    <div class="photo" style="margin-left:10px;">
		         <img src="${conPath }/img/icon_question.png" style="width:60px; height:auto;">
		     </div> 
		     <div style="position:absolute; top:70px; left:20px;">
		       <h4>
		         <c:choose>
		           <c:when test="${fn:length(que.q_title)>10 }">
		            <a href="${conPath }/ppageQuestionView.do?p_email=${que.p_email}">
		             <c:out value="${fn:substring(que.q_title,0,9) }"></c:out>...
		            </a>
		           </c:when>
		         <c:otherwise>
		          <a href="${conPath }/ppageQuestionView.do?p_email=${que.p_email}">
		          ${que.q_title }
		          </a>
		         </c:otherwise>		        
		         </c:choose>
		         </h4>
		      </div>     
		      <ul style="position:absolute; top:100px; left:20px;" class="vertical-list">
		         <li>분야 
		           <c:forEach var="c" items="${cate }" varStatus="status">					  				  
					 <c:if test="${cate[status.index].cate_num==que.cate_num }">
					 	${cate[status.index].cate_name }
					  </c:if>
				   </c:forEach>
		         </li>
		         <li>답변평점 ${que.q_star }</li>
		      </ul>
		       <div class="q_content">
		        <c:choose>
		         <c:when test="${fn:length(que.q_content)>15 }">
		           <c:out value="${fn:substring(que.q_content,0,14)}"></c:out>......
		         </c:when>
		         <c:otherwise>
		         ${que.q_content }
		         </c:otherwise>		       
		        </c:choose>
		       </div>		      
		         <div class="go">
		         <a href="${conPath }/ppageQuestionView.do?p_email=${que.p_email}">
		           <img src="${conPath }/img/icon_arrow.png">
		         </a>
		         </div>
		       </div>
	   </c:forEach>
	  </c:if>
	  <c:if test="${fn:length(searched)==0  }">
	 	<p><span class="label">질문 검색결과가 없습니다.</span></p>
	  </c:if>
	</c:if>	<!-- QUESTION Search Result ends -->
	
   <div class="paging">
	<ul class="pagination pagination-lg">
	 <c:if test="${paging.startPage>paging.blockSize }">	  
		<li class="page-item">
		   <c:if test="${p_area!=null }">
		 	<a class="page-link" href="${conPath }/searchProforSM?pageNum=${paging.startPage-1}&p_area=${p_area}&cate_num=${cate_num}">&laquo;</a>
		    </c:if>
		    <c:if test="${searchWord!=null && que==null }">
		 	 <a class="page-link" href="${conPath }/searchConforSM?pageNum=${paging.startPage-1}&searchWord=${searchWord}&cate_num=${cate_num}">&laquo;</a>
		    </c:if>
		    <c:if test="${que!=null }">
		 	 <a class="page-link" href="${conPath }/searchQueforSM?pageNum=${paging.startPage-1}&searchWord=${searchWord}">&laquo;</a>
		    </c:if>		 		 
		</li>
	 </c:if>
	 <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.currentPage == i }">
			<li class="page-item active"> 
			  <a class="page-link"><b>${i }</b></a> 
			</li>
		</c:if>
		<c:if test="${paging.currentPage != i }">
		  <li class="page-item">
		   <c:if test="${p_area!=null }">
			<a class="page-link" href="${conPath }/searchProforSM.do?pageNum=${i}&p_area=${p_area}&cate_num=${cate_num}">${i }</a>
		   </c:if>
		   <c:if test="${searchWord!=null && que==null }">
		     <a class="page-link" href="${conPath }/searchConforSM.do?pageNum=${i}&searchWord=${searchWord}&cate_num=${cate_num}">${i }</a>
		   </c:if>
		   <c:if test="${que!=null }">
		     <a class="page-link" href="${conPath }/searchQueforSM.do?pageNum=${i}&searchWord=${searchWord}">${i }</a>
		   </c:if>		
		   </li>	     
		</c:if>
	 </c:forEach>
	 <c:if test="${paging.endPage<paging.pageCnt }">
		<li class="page-item">		  
		     <c:if test="${p_area!=null }">
		      <a class="page-link" href="${conPath }/searchProforSM.do?pageNum=${paging.endPage+1}&p_area=${p_area}&cate_num=${cate_num}">&raquo;</a>
		     </c:if>
		     <c:if test="${searchWord!=null && que==null}">
		       <a class="page-link" href="${conPath }/searchConforSM.do?pageNum=${paging.endPage+1}&searchWord=${searchWord}&cate_num=${cate_num}">&raquo;</a>
		     </c:if>
		      <c:if test="${que!=null }">
		       <a class="page-link" href="${conPath }/searchQueforSM.do?pageNum=${paging.endPage+1}&searchWord=${searchWord}">&raquo;</a>
		     </c:if>		      
		</li>
	 </c:if>
	</ul>
   </div><!-- paging ends -->
  </div>   
 </div>
 </div>	
</body>
</html>