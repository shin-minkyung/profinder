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
<title>프로파인더 - 이 프로를 찜한 회원</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/ppageContent.css" rel="stylesheet" type="text/css"/>
<script>
	
</script>
</head>
<body>		
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	
	<c:if test="${not empty promembers and promembers.p_email==ppageInfo.p_email}">
		<%-- <jsp:include page="../wing/ppageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty findermembers }">
	<%-- 	<jsp:include page="../wing/fpageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/fpageRightWing.jsp"/>
		<jsp:include page="../wing/jjimWing.jsp"/>
	</c:if>	
	<div id="main">
		<div class="main_position">
			<div class="main_wrap">
				<div class="main1">
				   <c:if test="${ppageInfo.p_photo2!=null }">
					 <div class="main1-1-bg" style="background-image:url('${conPath}/profile/${ppageInfo.p_photo2 }');">
				   </c:if>
				  <c:if test="${ppageInfo.p_photo2==null }">
				     <div class="main1-1">
				   </c:if>					
						<div class="main1-1-1">
							<img src="${conPath }/profile/${ppageInfo.p_photo1 }" alt="사진"/>
						</div><!-- main1-2-1 -->
					</div><!-- main1-1 -->
					<div class="main1-2">
						
						<div class="main1-2-1">
							<h1>${ppageInfo.p_nickname}</h1>
							<p>${ppageInfo.p_tel1 }-${ppageInfo.p_tel2 }-${ppageInfo.p_tel3 }</p>
							<p>${ppageInfo.p_area }</p>
							<p>${ppageInfo.p_spec }</p>
						</div><!-- main1-2-1 -->
						<div class="main1-2-2">
							<p>${ppageInfo.p_message }</p>
						</div><!-- main1-2-2 -->
						<div class="main1-2-3">
							<ul>
								<li>
									<p><a href="${conPath }/ppageNewsfeedView.do?p_email=${p_email}" style="color:black;text-decoration:none;">올린 소식</a></p>
									<p>${ppageNewsfeedListCount }</p>
								</li>
								<li>
									<p><a href="${conPath }/ppageContentView.do?p_email=${p_email}" style="color:black;text-decoration:none;">등록 컨텐츠</a></p>
									<p>${ppageContentsListCount }</p>
								</li>
								<li>
									<p><a href="${conPath }/ppageQuestionView.do?p_email=${p_email}" style="color:black;text-decoration:none;">답변 질문</a></p>
									<p>${ppageQuestionListCount }</p>
								</li>
								<li style="border-bottom:4px solid #158CBA;">
									<p>찜</p>
									<p>${jjimCnt }</p>
								</li>
							</ul>
						</div><!-- main1-2-3 -->
					</div><!-- main1-2 -->
				</div><!-- main1 -->				
				<div class="main2">
					<div class="main2-1">
					    <div class="jjim_sub">
							<h3 style="text-align:left;">${ppageInfo.p_nickname }님을</h3>
							<h3 style="text-align:left;">찜한 사람들</h3>
					    </div>
						</div><!-- main2-1 -->
						<div class="main2-2">
						  <div class="jjim_expl">
						   <c:if test="${fn:length(jjimList)!=0 }">
							${ppageInfo.p_nickname}님을 찜한 <span class="big">${jjimCnt }</span>명의 파인더 회원들입니다.<br>
							프로필 사진을 클릭하면 해당 파인더의 페이지로 이동합니다.
						   </c:if>
						   <c:if test="${fn:length(jjimList)==0 }">
						    ${ppageInfo.p_nickname }님을 찜한 회원이 없습니다
						   </c:if>
						  </div>
						</div><!-- main2-2 -->
					<div class="main2-3">
					 <div id="jjim_wrap">
					  <c:if test="${fn:length(jjimList)!=0 }">					 
					  <c:forEach var="jjim" items="${jjimList }">
					    <div class="jjim">
					     <a href="${conPath }/fpageNewsfeedView.do?f_email=${jjim.f_email}">				    
					      <img src="${conPath }/profile/${jjim.f_photo1}" style="width:120px;">
					     </a>					    					   
					    ${jjim.f_nickname }<br>
					    <%-- ${jjim.f_email }--%>
					    </div>					    
					  </c:forEach>					  			
					  </c:if>
					  <c:if test="${fn:length(jjimList)==0 }">
					    <h3 style="position:relative; top:100px; left:350px">찜 회원 목록이 없습니다.</h3>
					  </c:if>	  
					 </div>
				    </div>				
									
					</div><!-- main2 -->	
				<div class="main3">
					<div class="main3-1">
						
					</div><!-- main3-1 -->
					<div class="main3-2">
						<div class="main_content">
							
						</div><!-- main_content -->
					</div>
				</div><!-- main3 -->
				<div class="main4">
			 	<div class="paging">
				 <ul class="pagination pagination-lg">
	 				<c:if test="${paging.startPage>paging.blockSize }">	  
					 <li class="page-item">
		 				<a class="page-link" href="${conPath }/ppageJjimView.do?pageNum=${paging.startPage-1}&p_email=${p_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/ppageJjimView.do?pageNum=${i}&p_email=${p_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/ppageJjimView.do?pageNum=${paging.endPage+1}&p_email=${p_email}">&raquo;</a>
				   </li>
	 			  </c:if>
				</ul>
   			  </div>				
			</div>
		  </div><!-- main_wrap -->
		</div><!-- main_position -->
	</div><!-- main -->
<%-- 	<script src="${conPath }/js/bootstrap.js"></script>
	<script src="${conPath }/js/bootstrap.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
	<script src="${conPath }/js/ga.js"></script>
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/popper.min.js"></script> --%>
</body>
</html>