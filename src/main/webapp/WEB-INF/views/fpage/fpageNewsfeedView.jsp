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
<link href="${conPath }/css/fpageNewsfeedView.css" rel="stylesheet" type="text/css"/>
<script>
	var didScroll = false;
	var ajaxCount = 5;
	$(window).scroll(function() {
		didScroll = true;
		
	});
	setInterval(function(){
		if(didScroll){
			ajaxAdd();
			didScroll = false;
		}
	},500);
function ajaxAdd(){
		
		var maxHeight = $(document).height();
		var currentScroll = $(this).scrollTop()+$(window).height();
		
		if (maxHeight < currentScroll+300) {
			ajaxCount++;
			$.ajax({
				url : '${conPath}/fpageNewsfeedAjax.do',
				type : 'post',
				datatype : 'html',
				data : 'f_email=${f_email}&r='+ajaxCount,
				success : function(data, status) {
					$(data).appendTo('.main_content');
				}
			});
		}
	} 
</script>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	
	<c:if test="${not empty promembers }">
<%-- 		<jsp:include page="../wing/ppageLeftWing.jsp"/>
 --%>		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty findermembers }">
	<%-- 	<jsp:include page="../wing/fpageLeftWing.jsp"/> --%>
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
								<li  style="border-bottom:4px solid #ac9bee;">
									<p>구독 소식</p>
									<p>&nbsp;</p>
								</li>
								<li>
									<p><a href="${conPath }/fpageBuyContentsView.do?f_email=${f_email}" style="color:black;text-decoration:none;">구매 컨텐츠</a></p>
									<p>${fpageContentsListCount}</p>
								</li>
								<li>
									<p><a href="${conPath }/fpageQuestionView.do?f_email=${f_email}" style="color:black;text-decoration:none;">작성 질문</a></p>
									<p>${fpageQuestionListCount }</p>
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
								<h3>소식에서 검색</h3>
							</li>
							<li>
								<input type="text" class="form-control" name="finder_newsfeed_search" id="main2-1_text"/>
								<input type="button" class="btn btn-secondary" value="검색" id="main2-1_btn"/>
							</li>
						</ul>
					</div><!-- main2-1 -->
					<div class="main2-2">
						<div class="main_content">
							<c:forEach var="newsfeed" items="${fpageNewsfeedList }">
								<div class="main_content_border">
									<div class="card border-light mb-3">
										<div class="card-body" style="margin:0;text-align:left;">
											<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeedList.p_email}">
												<img src="${conPath }/profile/${newsfeed.p_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
											</a>
											<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
												<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeed.p_email}" style="text-decoration: none;">${newsfeed.p_nickname}</a>
											</h4>
											<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${newsfeed.n_date}</h6>
											<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${newsfeed.cate_name}</h4>
											<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${newsfeed.n_title}</h4>
											<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${newsfeed.n_content}</p>
											
										</div>
										<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
											<div class="content_good">
												<span style="color:cornflowerblue;">${newsfeed.lcnt}</span>
												<span class="glyphicon glyphicon-thumbs-up"></span>
											</div>
											<div class="content_message">
												<span style="color:cornflowerblue;">${newsfeed.ccnt }</span>
												<span class="glyphicon glyphicon-comment"></span>
											</div>
											<!-- <div class="content_view">
												<span style="color:cornflowerblue;">23445</span>
												<span class="glyphicon glyphicon-eye-open"></span>
											</div> -->
											<div>
												<c:if test="${promembers.p_email eq newsfeed.p_email }">
													<span id="newsfeedModifyView${newsfeed.n_num }" class="newsfeedModifyView">수정하기</span>
													<span id="newsfeedDelete${newsfeed.n_num }" class="newsfeedDelete">삭제하기</span>
												</c:if>
												<span class="newsfeedReport">신고하기</span>
												<span style="color:cornflowerblue;position:absolute;right:20px;" id="commentViewBtn${newsfeed.n_num }" class="commentView">댓글보기</span>
											</div>
											<div id="comment_view${newsfeed.n_num }" style="display:none;">
												
											</div>
											<script>
												$(function(){
													$('#newsfeedModifyView${newsfeed.n_num }').click(function(){
														$.ajax({
															url:'${conPath}/newsfeedModifyView.do',
															type:'post',
															datatype:'html',
															data:'n_num=${newsfeed.n_num}&n_title=${newsfeed.n_title}&n_content=${newsfeed.n_content}&cate_num=${newsfeed.cate_num}',
															success:function(data,status){
																$('#newsfeedContent${newsfeed.n_num }').html(data);
															}
														});
													});
													$('#newsfeedDelete${newsfeedList.n_num }').click(function(){
														var deleteChk = confirm('정말로 삭제 하시겠습니까?');
														if(deleteChk==true){
															location.href='${conPath}/newsfeedDelete.do?n_num=${newsfeed.n_num}&p_email=${newsfeed.p_email}&pageNum=${paging.currentPage}';
														}
													});
													var count = 1;
													$('#commentViewBtn${newsfeed.n_num}').click(function(){
														if(count == 1){
															$('#commentViewBtn${newsfeed.n_num}').html('댓글접기');
															$('#comment_view${newsfeed.n_num}').show('fast');
															count = 0;
															$.ajax({
																url : '${conPath}/newsfeedCommentAjax.do',
																type : 'post',
																datatype : 'html',
																data : 'n_num=${newsfeed.n_num}',
																success : function(data, status) {
																	$('#comment_view${newsfeed.n_num}').html(data);
																}
															});
														}else{
															$('#commentViewBtn${newsfeed.n_num}').html('댓글보기');
															$('#comment_view${newsfeed.n_num}').hide('fast');
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
			</div><!-- main_wrap -->
		</div><!-- main_position -->
	</div><!-- main -->
</body>
</html>