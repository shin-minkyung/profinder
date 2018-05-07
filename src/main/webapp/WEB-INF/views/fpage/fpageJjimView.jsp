<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/fpageBuyContentsView.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	<c:if test="${not empty promembers }">
<%-- 		<jsp:include page="../wing/ppageLeftWing.jsp"/>
 --%>		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty findermembers }">
		<%-- <jsp:include page="../wing/fpageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/fpageRightWing.jsp"/>
	</c:if>
	<div id="main">
		<div class="main_position">
			<div class="main_wrap">			
				<div class="main1">
				  <c:if test="${finderInfo.f_photo2!=null }">
				    <div class="main1-1-bg" style="background-image:url('${conPath}/profile/${finderInfo.f_photo2 }');">
				  </c:if>
				  <c:if test="${finderInfo.f_photo2==null }">
				    <div class="main1-1">
				  </c:if>					
						<div class="main1-1-1">
							<img src="${conPath }/profile/${finderInfo.f_photo1}" alt="사진" style="width:200px;"/>
						</div><!-- main1-1-1 -->
					</div><!-- main1-1 -->
					<div class="main1-2">
						
						<div class="main1-2-1">
							<h1>${finderInfo.f_nickname}</h1>
							<p></p>
							<p>${finderInfo.f_area }</p>
							<p></p>
							<p></p>
						</div><!-- main1-2-1 -->
						<div class="main1-2-2">
							<p>${finderInfo.f_message }</p>
						</div><!-- main1-2-2 -->
						<div class="main1-2-3">
							<ul>
								<li>
									<p><a href="${conPath }/fpageNewsfeedView.do?f_email=${finderInfo.f_email}" style="color:black;text-decoration:none;">구독 소식</a></p>
									<p>&nbsp;</p>
								</li>
								<li>
									<p><a href="${conPath }/fpageBuyContentsView.do?f_email=${finderInfo.f_email}" style="color:black;text-decoration:none;">구매 컨텐츠</a></p>
									<p>${fpageContentsListCount }</p>
								</li>
								<li>
									<p><a href="${conPath }/fpageQuestionView.do?f_email=${finderInfo.f_email}" style="color:black;text-decoration:none;">작성 질문</a></p>
									<p> ${fpageQuestionListCount} </p>
								</li>
								<li style="border-bottom:4px solid #ac9bee;">
									<p><a href="${conPath }/fpageJjimView.do?f_email=${finderInfo.f_email}"  style="color:black;text-decoration:none;">찜한프로</a></p>
									<p>${myJjimCnt }</p>
								</li>
							</ul>
						</div><!-- main1-2-3 -->
					</div><!-- main1-2 -->
				</div><!-- main1 -->
				<div class="main2">
					<div class="main2-1">
						<ul>
							<li>
								<h3>${finderInfo.f_nickname }님이</h3>
								<h3>찜한 프로회원들</h3>
							</li>
							<li>
								${finderInfo.f_nickname }님이 찜한  ${myJjimCnt }명의 프로회원입니다.
								프로필 사진을 클릭하면 해당 프로회원 페이지로 이동합니다.
							</li>
						</ul>
					</div><!-- main2-1 -->
					<div class="main2-2">
						<div class="main_content">
						  <div id="jjim_wrap">
						   <c:if test="${fn:length(myjjimList)!=0 }">					 
					  		<c:forEach var="jjim" items="${myjjimList }">
					       <div class="jjim">
					        <a href="${conPath }/ppageNewsfeedView.do?p_email=${jjim.p_email}">				    
					        <img src="${conPath }/profile/${jjim.p_photo1}" style="width:120px; height:120px;">
					        </a>					    					   
					    	<p>${jjim.p_nickname }</p>
					       </div>	 				    
					  	   </c:forEach>					  			
					  	   </c:if>
					  	   <c:if test="${fn:length(myjjimList)==0 }">
					    	<h3 style="position:relative; top:100px; left:350px">찜 회원 목록이 없습니다.</h3>
					  	   </c:if>
					   	  </div>
						</div><!-- main_content -->
					</div><!-- main2-2 -->
				</div><!-- main2 -->
				<div class="main3">
				<div class="paging">
				 <ul class="pagination pagination-lg">
	 				<c:if test="${paging.startPage>paging.blockSize }">	  
					 <li class="page-item">
		 				<a class="page-link" href="${conPath }/fpageJjimView.do?pageNum=${paging.startPage-1}&f_email=${finderInfo.f_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/fpageJjimView.do?pageNum=${i}&f_email=${finderInfo.f_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/fpageJjimView.do?pageNum=${paging.endPage+1}&f_email=${finderInfo.f_email}">&raquo;</a>
				   </li>
	 			  </c:if>
				</ul>
   			  </div>
					
				</div>
			</div><!-- main_wrap -->
		</div><!-- main_position -->
	</div><!-- main -->
</body>
</html>