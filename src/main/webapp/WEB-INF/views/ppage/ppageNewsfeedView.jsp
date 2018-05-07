<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더 - 뉴스피드</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="${conPath }/css/sumbootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="${conPath }/js/summernote-ko-KR.js"></script>
<!-- <script src="https://ssl.google-analytics.com/ga.js"></script> -->
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/ppageNewsfeed.css" rel="stylesheet" type="text/css"/>
<script>
$(document).ready(function(){
	$('#content').summernote({
		width:945,
		height:400,
		minHeight:null,
		maxHeight:null,
		focus:true,
		lang:'ko-KR'
	});
});
</script>
<style>
	.note-editable{
		text-align:left;
	}
	.note-editable p,.note-editable h1,.note-editable h2,.note-editable h3,.note-editable h4,
	.note-editable h5,.note-editable h6,.note-editable pre{
		text-align:left;
	}
	.modal-content{
		top:135px;
	}
	.note-image-input,.form-control{
		width:240px;
	}
	.popover-content{
		display:none;
	}

</style>
</head>
<body>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	
	<c:if test="${promembers.p_email==ppageInfo.p_email}">
<%-- 		<jsp:include page="../wing/ppageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty findermembers }">
<%-- 		<jsp:include page="../wing/fpageLeftWing.jsp"/> --%>
		<jsp:include page="../wing/jjimWing.jsp"/>
		<jsp:include page="../wing/fpageRightWing.jsp"/>
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
							<img src="${conPath }/profile/${ppageInfo.p_photo1 }" alt="사진" style="border-radius:5px;"/>
						</div><!-- main1-1-1 -->
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
								<li  style="border-bottom:4px solid #158CBA;">
									<p>올린 소식</p>
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
								<li>
									<p><a href="${conPath }/ppageJjimView.do?p_email=${p_email }">찜</a></p>
									<p>${jjimCnt }</p>
								</li>
							</ul>
						</div><!-- main1-2-3 -->
					</div><!-- main1-2 -->
				</div><!-- main1 -->
				
				<c:if test="${promembers.p_email eq p_email and not empty promembers}">
					<div class="main2">
						<div class="main2-1">
							<h2>소식</h2>
							<h2>올리기</h2>
						</div><!-- main2-1 -->
						<div class="main2-2">
							<h5 style="margin-top:30px;">자신의 전문 분야와 관련된 소식을 올려주세요.파일첨부가 필요한 경우 컨텐츠 등록을 이용하시면 됩니다.</h5>
						</div><!-- main2-2 -->
						<form action="${conPath }/newsfeedInsert.do" method="post">
							<div class="main2-3">
								<select class="form-control" name="cate_num">
									<c:forEach var="category" items="${categorySelect }">
										<option value="${category.cate_num }">${category.cate_name }</option>
									</c:forEach>
								</select>
							</div><!-- main2-3 -->
							<div class="main2-4">
								<input type="text" class="form-control"  name="n_title" placeholder="소식 제목을 입력하세요" id="con_title" />
							</div><!-- main2-4 -->
							<div class="main2-5">
								<textarea class="form-control" name="n_content" id="content"
								placeholder="소식 내용을 작성해주세요.본 내용은 메인페이지에서 누구에게나 공개됩니다."></textarea>
							</div><!-- main2-5 -->
							<div class="main2-6">
								
								<input type="hidden" name="p_email" value="${promembers.p_email }"/>
								<input type="submit" value="등록하기" id="main2-6_subBtn"/>
							</div><!-- main2-6 -->
						</form>
					
					</div><!-- main2 -->
				</c:if>
				<div class="main3">
					<div class="main3-1">
						<ul>
							<li>
								<h3>이 프로</h3>
								<h3>소식에서 검색</h3>
							</li>
							<li>
								<input type="text" class="form-control" name="pro_newsfeed_search" id="main3-1_text"/>
								<input type="button" class="btn btn-secondary" value="검색" id="main3-1_btn"/>
							</li>
						</ul>
					</div><!-- main3-1 -->
					<div class="main3-2">
						<div class="main_content">
							<c:forEach var="newsfeedList" items="${ppageNewsfeedList }">
								<div class="main_content_border" id="newsfeedContent${newsfeedList.n_num }">
									<div class="card border-light mb-3">
										<div class="card-body" style="margin:0;text-align:left;">
										<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeedList.p_email}">
												<img src="${conPath }/profile/${newsfeedList.p_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
											</a>
											<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
												<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeedList.p_email}" style="text-decoration: none;">${newsfeedList.p_nickname}</a>
											</h4>
											<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${newsfeedList.n_date}</h6>
											<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${newsfeedList.cate_name}</h4>
											<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${newsfeedList.n_title}</h4>
											<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${newsfeedList.n_content}</p>
										</div><!--card-body  -->
										<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
											<div class="content_good">
												<span style="color:cornflowerblue;">${newsfeedList.lcnt }</span>
												<span class="glyphicon glyphicon-thumbs-up"></span>
											</div><!-- content_good -->
											<div class="content_message">
												<span style="color:cornflowerblue;">${newsfeedList.ccnt }</span>
												<span class="glyphicon glyphicon-comment"></span>
											</div><!--content_message  -->
											<!-- <div class="content_view">
												<span style="color:cornflowerblue;">23445</span>
												<span class="glyphicon glyphicon-eye-open"></span>
											</div>content_view -->
											<div>
												<c:if test="${promembers.p_email eq newsfeedList.p_email }">
													<span id="newsfeedModifyView${newsfeedList.n_num }" class="newsfeedModifyView">수정하기</span>
													<span id="newsfeedDelete${newsfeedList.n_num }" class="newsfeedDelete">삭제하기</span>
												</c:if>
												<span class="newsfeedReport">신고하기</span>
												<span style="color:cornflowerblue;position:absolute;right:20px;" id="commentViewBtn${newsfeedList.n_num }" class="commentView">댓글보기</span>
											</div>
											<div id="comment_view${newsfeedList.n_num }" style="display:none;">
												
											</div>
											<script>
												$(function(){
													$('#newsfeedModifyView${newsfeedList.n_num }').click(function(){
														$.ajax({
															url:'${conPath}/newsfeedModifyView.do',
															type:'post',
															datatype:'html',
															data:'n_num=${newsfeedList.n_num}&n_title=${newsfeedList.n_title}&n_content=${newsfeedList.n_content}&cate_num=${newsfeedList.cate_num}',
															success:function(data,status){
																$('#newsfeedContent${newsfeedList.n_num }').html(data);
															}
														});
													});
													$('#newsfeedDelete${newsfeedList.n_num }').click(function(){
														var deleteChk = confirm('정말로 삭제 하시겠습니까?');
														if(deleteChk==true){
															location.href='${conPath}/newsfeedDelete.do?n_num=${newsfeedList.n_num}&p_email=${newsfeedList.p_email}&pageNum=${paging.currentPage}';
														}
													});
													var count = 1;
													$('#commentViewBtn${newsfeedList.n_num}').click(function(){
														if(count == 1){
															$('#commentViewBtn${newsfeedList.n_num}').html('댓글접기');
															$('#comment_view${newsfeedList.n_num}').show('fast');
															count = 0;
															
															$.ajax({
																url : '${conPath}/newsfeedCommentAjax.do',
																type : 'post',
																datatype : 'html',
																data : 'n_num=${newsfeedList.n_num}',
																success : function(data, status) {
																	$('#comment_view${newsfeedList.n_num}').html(data);
																}
															});
														}else{
															$('#commentViewBtn${newsfeedList.n_num}').html('댓글보기');
															$('#comment_view${newsfeedList.n_num}').hide('fast');
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
		 				<a class="page-link" href="${conPath }/ppageNewsfeedView.do?pageNum=${paging.startPage-1}&p_email=${p_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/ppageNewsfeedView.do?pageNum=${i}&p_email=${p_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/ppageNewsfeedView.do?pageNum=${paging.endPage+1}&p_email=${p_email}">&raquo;</a>
				   </li>
	 			  </c:if>
				</ul>
   			  </div>	
				</div>
			</div><!-- main_wrap -->
		</div><!-- main_position -->
	</div><!-- main -->
	<%-- <script src="${conPath }/js/bootstrap.js"></script>
	<script src="${conPath }/js/bootstrap.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
	<script src="${conPath }/js/ga.js"></script>
	<script src="${conPath }/js/jquery.min.js"></script>
	<script src="${conPath }/js/npm.js"></script>
	<script src="${conPath }/js/popper.min.js"></script> --%>
</body>
</html>