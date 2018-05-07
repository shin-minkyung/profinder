<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>프로파인더 - 자유게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	*{
		margin:0 auto;
		text-decoration: none;
		list-style:none;
		padding:0;
	}
	#fboardWrap{
		width:1000px;
		background-color:white;	
	}
	#fboardWrap #fboardLogo img{
		width:1000px;
	}
	#fboardWrap #fboardsearch{
		padding-top: 15px;
		padding-bottom: 15px;
	}
	#fboardWrap #fboardsearch #fb_name{
		float: right;
		width:200px;
		margin-right: 15px;
		height: 33px;
	}
	#fboardWrap  #fboardsearch #fb_content{	
		float: right;
		width:300px;
		margin-right: 15px;
		height: 33px;
	}
	#fboardWrap #fboardsearch #btn_search{
		float: right;
		margin-right:20px;
		height: 33px;
		width: 70px;
		font-weight: bold;
		font-size: 11px; 
	}
	#fboard{
		margin-top: 25px;
	}
	.fboard-comment{
		text-align: left; 
		float: left;
		margin-left: 25px;
		margin-right: 30px;
	}
	.fboard-like{
		text-align: left; 
		float: left;
	}
	.fade, .in{
		background-color: rgba( 0, 0, 0, 0.3 );
	}
	.main_content_border{
		margin:20px;
		margin-bottom:30px;
	}
	p{
		text-align:left;
	}
	h2{
		margin-top:0px;
	}
</style>
<script>
	$(document).ready(function(){
		$('.img1').mouseenter(function(){
			$(this).attr('src', '${conPath}/img/icon_comment_hover.png');
		});
		$('.img1').mouseleave(function(){
			$(this).attr('src', '${conPath}/img/icon_comment.png');
		});
		
		$('.img2').mouseenter(function(){
			$(this).attr('src', '${conPath}/img/icon_like_hover.png');
		});
		$('.img2').mouseleave(function(){
			$(this).attr('src', '${conPath}/img/icon_like.png');
		});
		$('.note').summernote({
			width:900,
			height:300,
			minHeight:null,
			maxHeight:null,
			focus:true,
			lang:'ko-KR'
		});
		$('.updateNote').summernote({
			width:900,
			height:300,
			minHeight:null,
			maxHeight:null,
			focus:true,
			lang:'ko-KR'
		});
	});
	
	
	var didScroll = false;
	var ajaxCount = 10;
	var lastScrollTop = 0;
	var delta = 10;
	var scrollHeight = 700;
	$(window).scroll(function(){
		didScroll = true;
	})
	setInterval(function(){
		if(didScroll){
			ajaxAdd();
			didScroll = false;
		}
	},500);
	function mainScroll(){
		var st = $(this).scrollTop();
		if(Math.abs(lastScrollTop-st)<=delta){
			return;
		}
		if(st > lastScrollTop && st < scrollHeight){
			$('html').animate( { 
				scrollTop : 650
				}, 1000 );
		}
		lastScrollTop = st;
	}
function ajaxAdd(){
		
		var maxHeight = $(document).height();
		var currentScroll = $(this).scrollTop()+$(window).height();
		
		if (maxHeight <= currentScroll+100) {
			ajaxCount++;
			$.ajax({
				url : '${conPath}/fboardlistajax.do',
				type : 'post',
				datatype : 'html',
				data : 'rn='+ajaxCount,
				success : function(data, status) {
					$(data).appendTo('#fboardList');
				}
			});
		}
	} 
	function chk(){
		if($('.frm_fb_title').val().length==0){
			alert('제목을 입력하셔야합니다');
			return false;
		}else if($('.updateNote').val().length == 0){
			alert("내용을 입력하셔야합니다");
			return false;
		}
	}
	function insert(){
		if($('#write_fb_title').val().length == 0){
			alert("제목을 입력하셔야 합니다");
			return false;
		}else if($('#write_fb_content').val().length == 0){
			alert("글 내용을 입력하셔야 합니다");
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="../header/header.jsp"></jsp:include>
<jsp:include page="../wing/rightWing.jsp"/>
	<c:if test="${not empty findermembers }">
		<jsp:include page="../wing/fpageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty promembers }">
		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<c:if test="${insertResult == 1 }">
		<script>
			alert('글 작성이 완료되었습니다.');
		</script>
	</c:if>
	<c:if test="${modifyResult == 1 }">
		<script>
			alert('수정이 완료되었습니다.');
		</script>
	</c:if>
	<c:if test="${likeChk == 1 }">
		<script>
			alert('이미 좋아요 누른 게시글입니다.');
		</script>
	</c:if>
	<div id="fboardWrap">
			<div id="fboardLogo">
				<img src="${conPath }/img/banner_freeboard.png" alt="로고">
			</div>
			<div id="fboardsearch">
				<form action="fboardSearch.do">
					<input type="submit" class="btn btn-secondary" name="btn_search" id="btn_search" value="search">
					<input type="text" class="form-control" name="fb_content" id="fb_content" style="text-align: left;">
					<select name="fb_name" id="fb_name" class="form-control">
						<option value="1">작성자</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
					</select>
				</form>
			</div>
			<c:if test="${not empty findermembers or not empty promembers}">
				<div id="fboardWrite" style="margin-top: 65px;">
					<form action="fboardInsert.do" method="post" onsubmit="return insert()">
						<input type="hidden" name="fb_photo" value="${photo}">
						<input type="hidden" name="fb_name" value="${nickname}">
						<div id="write" style="text-align: left; margin-left: 43px;">
							<p style="text-align: left;"><input type="text" class="form-control" name="fb_title" id="write_fb_title" style="text-align: left; margin-left: 8px; width:900px; padding-left: 10px;" placeholder="제목을 입력해주세요"></p>
						</div>
						<div id="write" style="text-align: left;">
							<textarea rows="10" cols="30" name="fb_content" id="write_fb_content" class="note"></textarea>
						</div>
						<div id="write" style="text-align: right; margin-right: 50px;">
							<input type="submit" value="작성완료" class="btn btn-secondary" style="width:80px; height: 40px; font-weight: bold;" >
						</div>
					</form>
				</div>	
			</c:if>
			<div id="fboard">
				<div id="fboardList" style="position: relative; padding:15px;">
				<c:forEach var="fboardlist" items="${fboardList }">
					<div class="main_content_border">
						<div class="card border-light mb-3">
								<div class="card-body" style="margin:0; text-align: left; ">
									<img src="${conPath }/profile/${fboardlist.fb_photo}" style="width:60px; height: 60px; border-radius: 30px;">
									<span class="card-fb_name" style="position: absolute; top: 20px; left: 100px; font-size: 22px; font-weight: bold">${fboardlist.fb_name}</span>
									<span style="position: absolute; top: 64px; left: 100px; font-size: 15px;" ><fmt:formatDate value="${fboardlist.fb_date }" pattern="yyyy. MM. dd. hh:mm"/></span>
									<p id="title${fboardlist.fb_num }" style="margin-top: 30px;text-align: left; font-size: 20px; padding: 0 80px;">${fboardlist.fb_title}</p>
									<div id="content${fboardlist.fb_num}"style="padding: 0 80px; text-align: left;">${fboardlist.fb_content }</div>
									<form action="fboardModify.do" method="post" name="frm" onsubmit="return chk()">
										<input type="hidden" name="fb_num" value="${fboardlist.fb_num }">
										<p id="titleView${fboardlist.fb_num }" style="display: none; text-align: left;"><input type="text" class="form-control" name="fb_title" class="frm_fb_title" value="${fboardlist.fb_title}" style="margin-top: 30px;text-align: left; font-size: 16px; padding-left: 10px; width:900px"></p>
										<div id="contentView${fboardlist.fb_num }" style="display: none; text-align: left;">
											<textarea rows="10" cols="30" name="fb_content" class="updateNote">${fboardlist.fb_content }</textarea> 
											<p style="text-align: right; margin-right: 20px;"><input type="submit"  value="수정완료" class="btn btn-secondary" style="width:85px; height: 40px; font-weight: bold;"></p>
										</div>
									</form> 
								</div>
								<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
									<div class="fboard-comment">
										<span style="margin-right: 15px; color: cornflowerblue;">${fboardlist.total}</span>
										<span id="commentViewBtn${fboardlist.fb_num }" style="cursor: pointer;"><img src="${conPath }/img/icon_comment.png" alt="댓글" style="width:40px; height: 35px;" class="img1"></span>
									</div>
									<div class="fboard-like">
										<span style="margin-right: 15px; color: cornflowerblue;" id="likeText${fboardlist.fb_num }">${fboardlist.likecnt}</span>
										<span style="cursor: pointer;"><img src="${conPath }/img/icon_like.png" alt="좋아요" style="width:40px; height: 35px;" class="img2" onclick="location.href='${conPath}/fboardLikeInsert.do?l_num=${fboardlist.fb_num}&l_liker=${nickname }'"></span>
									</div>
									<div style="float: right;">
										<c:if test="${fboardlist.fb_name == nickname }">
											<span id="modify${fboardlist.fb_num }" style="cursor: pointer;">수정하기</span>
											<a href="fboardDelete.do?fb_num=${fboardlist.fb_num }" style="color:black; margin-left: 15px;">삭제</a>
										</c:if>
										<c:if test="${not empty findermembers or not empty promembers}">
											<a href="#" data-toggle="modal" data-target="#REPORT${fboardlist.fb_num }" style="color:black; margin-left: 15px;">신고하기</a>
										</c:if>
									</div>
									<div id="fboard_view${fboardlist.fb_num }" style="display:none; margin-top: 50px; text-align: left; position: relative;" >
									
									</div>
								</div>
									<script>
									$(function(){
										var count = 1;
										$('#commentViewBtn${fboardlist.fb_num }').click(function(){
											if(count == 1){
												$('#fboard_view${fboardlist.fb_num }').show('fast');
												count = 0;
												$.ajax({
													url : 'fboardCommentList.do',
													type : 'get',
													datatype : 'html',
													data : 'fb_num=${fboardlist.fb_num }',
													success : function(data, status) {
														$('#fboard_view${fboardlist.fb_num }').html(data);
													}
												});
											}else{
												$('#fboard_view${fboardlist.fb_num }').hide('fast');
												count = 1;
											}
										});
										$('#modify${fboardlist.fb_num }').click(function(){
											if(count == 1){
												$('#content${fboardlist.fb_num}').hide('fast');
												$('#contentView${fboardlist.fb_num }').show('fast');
												$('#title${fboardlist.fb_num}').hide('fast');
												$('#titleView${fboardlist.fb_num}').show('fast');
												$('#modify${fboardlist.fb_num }').html('수정취소');
												$('#modify${fboardlist.fb_num }').css('color', 'red');
												count = 0;
											}else{
												$('#content${fboardlist.fb_num}').show('fast');
												$('#contentView${fboardlist.fb_num }').hide('fast');
												$('#title${fboardlist.fb_num}').show('fast');
												$('#titleView${fboardlist.fb_num}').hide('fast');
												$('#modify${fboardlist.fb_num }').html('수정하기');
												$('#modify${fboardlist.fb_num }').css('color', 'black');
												count = 1;
											}
										});
									});
								</script>
							</div>
						</div>
						<div class="modal fade" id="REPORT${fboardlist.fb_num }">
					       <div class="modal-dialog">
					          <div class="modal-content" style="left: -80px; top: 208px;"> 
					          	<div class="modal-header" style="width:100%;">
										<h5 class="modal-title">신고하기</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="report.do">
									<input type="hidden" name="rep_num" value="${fboardlist.fb_num }">
										<div class="modal-body" style="padding: 40px 50px;">
											<div id="reporter" style="text-align: left;">
												<label class="form-control-label" for="inputSuccess1">신고자</label>
												<input type="text" name="rep_reporter" readonly="readonly" value="${email }" class="form-control">
											</div>
											<div id="why" style="text-align: left;">
												<label class="form-control-label" for="inputSuccess1">신고사유</label>
												<select name="rep_why" class="form-control" style="height: 40px;">
													<option value="부적절한 홍보 게시글">부적절한 홍보 게시글</option>
													<option value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 애용</option>
													<option value="기타">기타</option>
												</select>
											</div>
										</div>
										<div class="modal-footer">
											<input type="submit" value="신고하기" class="btn btn-secondary" style="width:85px; height: 35px;"> 
										</div>
									</form>
					          </div>
					       </div>
					    </div>
					</c:forEach>
				</div>
			</div>
		</div>
</body>
</html>