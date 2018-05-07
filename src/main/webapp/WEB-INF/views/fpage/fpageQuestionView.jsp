<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/fpageBuyContentsView.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	<c:if test="${not empty promembers }">
		<%-- <jsp:include page="../wing/ppageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty findermembers }">
<%-- 		<jsp:include page="../wing/fpageLeftWing.jsp"/>
 --%>		<jsp:include page="../wing/fpageRightWing.jsp"/>
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
									<p><a href="${conPath }/fpageNewsfeedView.do?f_email=${f_email}" style="color:black;text-decoration:none;">구독 소식</a></p>
									<p>&nbsp;</p>
								</li>
								<li>
									<p><a href="${conPath }/fpageBuyContentsView.do?f_email=${f_email}" style="color:black;text-decoration:none;">구매 컨텐츠</a></p>
									<p>${fpageContentsListCount }</p>
								</li>
								<li style="border-bottom:4px solid #ac9bee;">
									<p><a href="${conPath }/fpageQuestionView.do?f_email=${f_email}" style="color:black;text-decoration:none;">작성 질문</a></p>
									<p> ${fpageQuestionListCount} </p>
								</li>
								<li>
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
								<h3>이 파인더</h3>
								<h3>질문에서 검색</h3>
							</li>
							<li>
								<input type="text" name="finder_contents_search" class="form-control" id="main2-1_text"/>
								<input type="button" value="검색" class="btn btn-secondary"id="main2-1_btn"/>
								
							</li>
						</ul>
					</div><!-- main2-1 -->
					<div class="main2-2">
						<div class="main_content">
							<c:forEach var="questionList" items="${fpageQuestionList }">
								<div class="main_content_border">
									<div class="card border-light mb-3">
										<div class="card-body" style="margin:0;text-align:left;">
											<a href="${conPath }/fpageQuestionView.do?f_email=${questionList.f_email}">
												<img src="${conPath }/profile/${questionList.f_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
											</a>
											<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
												<a href="${conPath }/fpageQuestionView.do?f_email=${questionList.f_email}" style="text-decoration:none;">${questionList.f_nickname} ▶  ${questionList.p_nickname }</a> 
											</h4> 
											<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${questionList.q_date}</h6>
											<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${questionList.cate_name}</h4>
											<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;" id="title${questionList.q_num }">${questionList.q_title}</h4>
											<p class="card-text" style="width:100%;text-align:left;padding-left:40px;" id="content${questionList.q_num }">${questionList.q_content}</p>
											
											<form action="${conPath }/questionModify.do" method="post">
												<input type="hidden" name="q_num" value="${questionList.q_num }">
												<p id="titleView${questionList.q_num }" style="display:none; text-align: left; margin-left:23px;">										
													<input type="text" name="q_title" value="${questionList.q_title}" required="required" style="margin-top: 15px; margin-left:-23px; text-align: left; font-size:16px; padding-left: 10px; width:909px;">
												</p>
												<div id="contentView${questionList.q_num }" style="display:none; text-align: left;">
													<textarea rows="10" cols="127" name="q_content" required="required" style="text-align: left; padding-left: 10px;">${questionList.q_content }</textarea>
													<p style="text-align:right; margin-ringt:20px;">
														<input type="submit" value="수정완료">
													</p>
												</div>
											</form>
										</div>
										<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
											<c:if test="${questionList.q_accept==1}">
												<span style="color:#E99B00; font-size: 1.3em; position: absolute; left: 22px;">
													<c:if test="${questionList.q_star==0 }"> 아직 평점을 남기지 않았습니다</c:if>												
													<c:if test="${questionList.q_star==1 }">		
												     <img src="${conPath }/img/q_star1.png">								  
													</c:if>
													<c:if test="${questionList.q_star==2 }">
													  <img src="${conPath }/img/q_star2.png">
													</c:if>
													<c:if test="${questionList.q_star==3 }">
													  <img src="${conPath }/img/q_star3.png">
													</c:if>
													<c:if test="${questionList.q_star==4 }">
													  <img src="${conPath }/img/q_star4.png">
													</c:if>
													<c:if test="${questionList.q_star==5 }">
													  <img src="${conPath }/img/q_star5.png">
													</c:if>
													<c:if test="${questionList.q_star!=0 }"><span>이 답변에 대한 질문자의 평점 ${questionList.q_star }점</span></c:if>
												</span>
											</c:if>
										<div class="qBtn_set">											
											<c:if test="${questionList.q_accept==0 }">
												<span id="modify${questionList.q_num }" style="cursor:pointer;">수정</span>
												<a href="${conPath }/questionDelete.do?q_num=${questionList.q_num}" style="text-decoration:none; color:#5e5e5e;">삭제</a>
												<button type="button" class="q_btn btn btn-warning disabled" style="color:white"> 대기중</button>												
											</c:if>
											<c:if test="${questionList.q_accept==1 }">												
												<button type="button" class="q_btn btn btn-success disabled"> 수락됨</button>
												<button type="button" class="q_btn btn btn-success" id="qanswerView${questionList.q_num }" >답변보기</button>												
											</c:if>
											<c:if test="${questionList.q_accept==2 }">
												<%-- <span id="modify${questionList.q_num }" style="cursor:pointer;">수정</span> --%>
												<a href="${conPath }/questionDelete.do?q_num=${questionList.q_num}" style="text-decoration:none; color:#5e5e5e;">삭제</a>
												<button type="button" class="q_btn btn btn-danger disabled">거절됨</button>												
											</c:if>	
										</div>
											<div id="qanswer_view${questionList.q_num }" style="display:none; margin-top:50px; text-align: left; position: relative;"></div>
											
											<script>
												$(function(){
													var count = 1;
													
													// 유료질문 수정
													$('#modify${questionList.q_num }').click(function(){
														if(count==1) {
															$('#title${questionList.q_num }').hide('fast');
															$('#titleView${questionList.q_num }').show('fast');															
															$('#content${questionList.q_num }').hide('fast');
															$('#contentView${questionList.q_num}').show('fast');
															$('#modify${questionList.q_num }').html('수정취소');
															$('#modify${questionList.q_num }').css('color', 'red');
															count=0;
														}else {
															$('#title${questionList.q_num }').show('fast');
															$('#titleView${questionList.q_num }').hide('fast');															
															$('#content${questionList.q_num }').show('fast');
															$('#contentView${questionList.q_num}').hide('fast');
															$('#modify${questionList.q_num }').html('수정');
															$('#modify${questionList.q_num }').css('color', 'black');
															count=1;
														}
													});
																								
													// 답변보기
													$('#qanswerView${questionList.q_num}').click(function(){
														if(count==1) {
															$('#qanswer_view${questionList.q_num}').show('fast');
															count = 0;
															$.ajax({
																url : 'qanswerListforFinder.do',
																type : 'get',
																data : 'q_num=${questionList.q_num}'+'&p_email=${questionList.p_email}',
																success : function(data, status) {
																	$('#qanswer_view${questionList.q_num}').html(data);
																	$('#qanswerView${questionList.q_num }').text("답변접기");																	
																}
															});
														}else {
															$('#qanswer_view${questionList.q_num}').hide('fast');
															$('#qanswerView${questionList.q_num }').text("답변보기");
															count = 1;
														}
													}); 
												});
											</script>										
										</div>
									</div>
								</div>
							</c:forEach>
						</div><!-- main_content -->
						
					</div><!-- main2-2 -->
				</div><!-- main2 -->
				<div class="main3">
				<div class="paging">
				 <ul class="pagination pagination-lg">
	 				<c:if test="${paging.startPage>paging.blockSize }">	  
					 <li class="page-item">
		 				<a class="page-link" href="${conPath }/fpageQuestionView.do?pageNum=${paging.startPage-1}&f_email=${finderInfo.f_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/fpageQuestionView.do?pageNum=${i}&f_email=${finderInfo.f_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/fpageQuestionView.do?pageNum=${paging.endPage+1}&f_email=${finderInfo.f_email}">&raquo;</a>
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