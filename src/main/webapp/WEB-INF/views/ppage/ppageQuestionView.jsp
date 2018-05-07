<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더 - 질문</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/ppageContent.css" rel="stylesheet" type="text/css"/>
<script>

	function chk() {
		if(frm.cate_num.value == '0') {
			alert('분야를 선택해주세요.');
			return false;
		}
		if(frm.f_email.value.length == 0){
			alert('로그인이 필요한 작업입니다');
			return false;
		}
	}	
	
	$(document).ready(function(){
		$("#main2-6_subBtn").click(function(){
			location.reload();
		});
	});
</script>
</head>
<body>
	<c:if test="${questionAcceptUpdate }==1">
		<script>
			alert('질문 수락을 하셨습니다!')
		</script>
	</c:if>
	<c:if test="${questionAcceptUpdate }==0">
		<script>
			alert('질문 수락에 실패하셨습니다!')
		</script>
	</c:if>
	
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	
	<c:if test="${not empty promembers and promembers.p_email==ppageInfo.p_email}">
<%-- 		<jsp:include page="../wing/ppageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty findermembers }">
<%-- 		<jsp:include page="../wing/fpageLeftWing.jsp"/> --%>
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
								<li style="border-bottom:4px solid #158CBA;">
									<p>답변 질문</p>
									<p>${ppageQuestionListCount }</p>
								</li>
								<li>
									<p><a href="${conPath }/ppageJjimView.do?p_email=${p_email }">찜</a></p>
									<p>${jjimCnt }</p>
								</li>
							</ul>
						</div><!-- main1-2-3 -->
					</div><!-- main1-2 -->
				</div><!-- main1 -->
				
				<c:if test="${not empty findermembers or not empty promembers and empty promembers}">
					<div class="main2">
						<div class="main2-1">
							<h3 style="text-align:left;">이 프로에게</h3>
							<h3 style="text-align:left;">질문하기</h3>
						</div><!-- main2-1 -->
						<div class="main2-2">
							<h5 style="text-align:left;">질문을 받은 프로는 답변을 수락 또는 거절할 수 있습니다.</h5>
							<h5 style="text-align:left;">답변 수락/거절 전에 질문작성자가 질문을 철회할 수 있습니다.</h5>							
						</div><!-- main2-2 -->
						<form action="${conPath }/questionInsert.do " method="post" name="frm" onsubmit="return chk()">
							<div class="main2-3">
								<select name="cate_num" class="form-control"> 
									<option value="0">분야선택</option>
									<c:forEach var="category" items="${categorySelect }">
										<option value="${category.cate_num }">${category.cate_name }</option>
									</c:forEach>
								</select>
							</div><!-- main2-3 -->
							<div class="main2-4">
								<input type="text" class="form-control" name="q_title" placeholder="질문 제목을 입력하세요." id="con_title" />
							</div><!-- main2-4 -->
							<div class="main2-5">
								<textarea rows="10" class="form-control" cols="134" name="q_content" id="con_content"
								placeholder="이 프로의 전문지식이 필요한 질문을 입력하세요. 프로가 수락할 경우 답변을 받아볼 수 있습니다."></textarea>
							</div><!-- main2-5 -->
							<div class="main2-6">
								<input type="hidden" name="q_price" value="500">
								<input type="hidden" name="f_email" value="${findermembers.f_email }" />
								<input type="hidden" name="p_email" value="${p_email }"/>
								<input type="submit" value="질문하기" id="main2-6_subBtn"/>
							</div><!-- main2-6 -->
						</form>
					
					</div><!-- main2 -->
				</c:if>
				
				<div class="main3">
					<div class="main3-1">
						<ul>
							<li>
								<h3>이 프로</h3>
								<h3>질문에서 검색</h3>
							</li>
							<li>
								<input type="text" name="pro_question_search" class="form-control" id="main3-1_text"/>
								<input type="button" value="검색" class="btn btn-secondary" id="main3-1_btn"/>				
							</li>
						</ul>
					</div><!-- main3-1 -->
					<div class="main3-2">
						<div class="main_content">
							<c:forEach var="questionList" items="${ppageQuestionList }">
								<div class="main_content_border">
									<div class="card border-light mb-3">										
										<div class="card-body" style="margin:0;text-align:left;">	
											<a href="${conPath }/fpageQuestionView.do?f_email=${questionList.f_email}">									   
												<img src="${conPath }/profile/${questionList.f_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
											</a>
											<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
												<a href="${conPath }/fpageQuestionView.do?f_email=${questionList.f_email}" style="text-decoration:none;">${questionList.f_nickname}님이 ${ppageInfo.p_nickname }님께 질문</a>
											</h4>
											<h6 class="con_date" style="position:absolute;top:45px;left:72px;">${questionList.q_date}</h6>
											<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${questionList.cate_name}</h4>
											<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${questionList.q_title}</h4>
											<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${questionList.q_content}</p>											
										</div>
										<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">	
										<c:if test="${questionList.q_accept==1}">											  
											<span class="q_star" style="color:#E99B00; font-size: 1.3em; " >
											<c:if test="${questionList.q_star!=0 }">
											  ${questionList.f_nickname }님이 남긴 평점: 
											  	<span>${questionList.q_star }점</span>											
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
											</c:if>	
											<c:if test="${questionList.q_star==0 }">
											 ${questionList.f_nickname }님이 평점을 남기지 않았습니다
											</c:if>												
											</span>
										</c:if>
											
											<div class="qBtn_set">										
												<c:if test="${promembers.p_email eq p_email }">																								
													<c:if test="${questionList.q_accept==0}">					
														<button type="button" class="q_btn btn btn-outline-success" id="questionAccept${questionList.q_num}">수락</button> 
														<button type="button" class="q_btn btn btn-outline-danger" onclick="location.href='${conPath}/questionReject.do?q_num=${questionList.q_num}&p_email=${p_email }'">거절</button>
													</c:if>
													<c:if test="${questionList.q_accept==1 }">
														<button type="button" class="q_btn btn btn-success disabled">수락함</button>
														<button type="button" class="q_btn btn btn-success" id="qanswerView${questionList.q_num }" >답변보기</button>
													</c:if>
													<c:if test="${questionList.q_accept==2 }">
														<button type="button" class="q_btn btn btn-danger disabled">거절함</button>
													</c:if>												
												</c:if>								
											<c:if test="${promembers.p_email != p_email}">
												<c:if test="${questionList.q_accept==0 }">
													<button type="button" class="q_btn btn btn-success disabled">답변 대기중</button>
												</c:if>
												<c:if test="${questionList.q_accept==1 }">
														<button type="button" class="q_btn btn btn-success" id="qanswerView${questionList.q_num }" >답변보기</button>
												</c:if>
												<c:if test="${questionList.q_accept==2 }">
														<button type="button" class="q_btn btn btn-danger disabled">답변 거절</button>													
												</c:if>
											</c:if>											
											</div>
											<div id="qanswer_view${questionList.q_num }" style="display:none; margin-top:50px; text-align: left; position: relative;"></div>
											
											<script>
												$(function(){
													var count = 1;
													
													// 수락버튼 눌렀을시 답변쓰는창이 뜨게하는 ajax
													$('#questionAccept${questionList.q_num}').click(function(){
														if(count==1) {
															$('#qanswer_view${questionList.q_num}').show('fast');
															count = 0;
															$.ajax({
																url : 'qanswerList.do',
																type : 'get',
																data : 'q_num=${questionList.q_num}'+'&p_email=${ppageInfo.p_email}',
																success : function(data, status) {
																	$('#qanswer_view${questionList.q_num}').html(data);
																	$('#questionAccept${questionList.q_num}').text('수락 취소');
																	/* alert(data); */
																}
															});
														}else {
															$('#qanswer_view${questionList.q_num}').hide('fast');
															$('#questionAccept${questionList.q_num}').text('수락');
															count = 1;
														}
													});

													// 답변보기
													$('#qanswerView${questionList.q_num}').click(function(){
														if(count==1) {
															$('#qanswer_view${questionList.q_num}').show('fast');
															count = 0;
															$.ajax({
																url : 'qanswerList.do',
																type : 'get',
																data : 'q_num=${questionList.q_num}'+'&p_email=${ppageInfo.p_email}',
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
					</div>
				</div><!-- main3 -->
				<div class="main4">
				<div class="paging">
					 <ul class="pagination pagination-lg">
	 				<c:if test="${paging.startPage>paging.blockSize }">	  
					 <li class="page-item">
		 				<a class="page-link" href="${conPath }/ppageQuestionView.do?pageNum=${paging.startPage-1}&p_email=${p_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/ppageQuestionView.do?pageNum=${i}&p_email=${p_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/ppageQuestionView.do?pageNum=${paging.endPage+1}&p_email=${p_email}">&raquo;</a>
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
	<script src="${conPath }/js/npm.js"></script>
	<script src="${conPath }/js/popper.min.js"></script> --%>
</body>
</html>