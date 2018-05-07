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
<!-- <script src="https://ssl.google-analytics.com/ga.js"></script> -->
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/main.css" rel="stylesheet" type="text/css"/>
<script>
	var didScroll = false;
	var ajaxCount = 5;
	var lastScrollTop = 0;
	var delta = 5;
	var scrollHeight = 700;
	$(window).scroll(function() {
		didScroll = true;
		
	});
	setInterval(function(){
		if(didScroll){
			ajaxAdd();
			mainScroll();
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
		
		if (maxHeight < currentScroll+300) {
			ajaxCount++;
			$.ajax({
				url : '${conPath}/newsfeedMainAjax.do',
				type : 'post',
				datatype : 'html',
				data : 'rn='+ajaxCount,
				success : function(data, status) {
					$(data).appendTo('.main_content');
				}
			});
		}
	} 
	$(function(){
		var bannerStartCount = 1;
		var bannerEndCount = 4;
		$('.newsNextAjaxBtn').click(function(){
			bannerStartCount += 3;
			bannerEndCount += 3;
			$.ajax({
				url:'${conPath}/newsfeedMainBannerAjax.do',
				type:'post',
				datatype:'html',
				data:'startRow='+bannerStartCount+'&endRow='+bannerEndCount,
				success:function(data,status){
					$('.main2-2').html(data);
				}
			});
		});
		$('.newsBeforeAjaxBtn').click(function(){
			bannerStartCount -= 3;
			bannerEndCount -= 3;
			if(bannerStartCount<0){
				bannerStartCount = 1;
				bannerEndCount = 4;
				$.ajax({
					url:'${conPath}/newsfeedMainBanner.do',
					type:'post',
					datatype:'html',
					success:function(data,status){
						$('.main2').html(data);
					}
				});
				
			}else{
				$.ajax({
					url:'${conPath}/newsfeedMainBannerAjax.do',
					type:'post',
					datatype:'html',
					data:'startRow='+bannerStartCount+'&endRow='+bannerEndCount,
					success:function(data,status){
						$('.main2-2').html(data);
					}
				});
			}
		});
	});
	$(function(){
		$(".bannerContents").click(function(){
			$.ajax({
				url:'${conPath}/contentsMainBanner.do',
				type:'post',
				datatype:'html',
				success:function(data,status){
					$('.main2').html(data);
				}
			});
		});
		$(".bannerPromembers").click(function(){
			$.ajax({
				url:'${conPath}/promembersMainBanner.do',
				type:'post',
				datatype:'html',
				success:function(data,status){
					$('.main2').html(data);
				}
			});
		});
		$(".bannerQuestion").click(function(){
			$.ajax({
				url:'${conPath}/questionMainBanner.do',
				type:'post',
				datatype:'html',
				success:function(data,status){
					$('.main2').html(data);
				}
			});
		});
	});
</script>

</head>
<body>
	<c:if test="${joinResult ==1}">
		<script>
			alert('회원가입에 성공하였습니다!');
		</script>
	</c:if>
	<c:if test="${memberModify==1 }">
		<script>
			alert('회원 정보 수정에 성공하였습니다!');
		</script>
	</c:if>
	<jsp:include page="../header/header.jsp"/>
	<jsp:include page="../wing/rightWing.jsp"/>
	<c:if test="${not empty findermembers }">
		<jsp:include page="../wing/fpageRightWing.jsp"/>
	</c:if>
	<c:if test="${not empty promembers }">
		<jsp:include page="../wing/ppageRightWing.jsp"/>
	</c:if>
	<div id="main">
		<div class="main_position">
			<div class="main_wrap">
				<div class="main1">
					<img class="main1_img" src="${conPath }/img/mainbanner_1000.png" alt="메인사진"/>
				</div>
				<div class="main2">
					<div class="main2-1">
						<ul>
							<li class="bannerNewsfeed" style="background-color:#158CBA;">
								<span style="background-color:white;">인기소식</span>
							</li>
							<li class="bannerPromembers">
								<span>인기PRO</span>
							</li>
							<li class="bannerContents">
								<span>인기컨텐츠</span>
							</li>
							<li class="bannerQuestion">
								<span>인기질문</span>
							</li>
						</ul>
					</div><!-- main2-1 -->
					<div class="main2-2">
						<span>전체 소식</span>
						<c:set var="i" value="2"/>
							<c:forEach var="newsfeed" items="${newsfeedMainBanner }">
								<ul class="main2-2-ul${i }">
									<li class="main2-2-ul${i }-li1">
										<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeed.p_email}">
											${newsfeed.n_title}
										</a>
									</li>
									<li class="main2-2-ul${i }-li2">${newsfeed.p_nickname}</li>
									<li class="main2-2-ul${i }-li3">좋아요 ${newsfeed.cnt}</li>
								</ul>
							<c:set var="i" value="${i+1 }"/>
						</c:forEach>
					</div><!-- main2-2 -->
					<div class="main2-3">
						<input type="button" id="btn_before_news_ajax" class="newsBeforeAjaxBtn">
						<div id="btn_before_triangle" class="newsBeforeAjaxBtn"></div>
						<input type="button" id="btn_next_news_ajax" class="newsNextAjaxBtn">
						<div id="btn_next_triangle" class="newsNextAjaxBtn"></div>
					</div><!-- main2-3 -->
				</div><!-- main2 -->
				<div class="main3">
					<span>스크롤 해서 최신 소식 보기</span>
					<img src="${conPath }/img/scroll_mouse.png" alt="마우스사진"/>
				</div>
				<div class="main4">
					<div class="main_content">
						<c:forEach var="newsfeed" items="${newsfeedMain }">
							<div class="main_content_border">
								<div class="card border-light mb-3">
									<div class="card-body" style="margin:0;text-align:left;">
										<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeed.p_email}">
											<img src="${conPath }/profile/${newsfeed.p_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
										</a>
										<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
											<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeed.p_email}">${newsfeed.p_nickname}</a>
										</h4>
										<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${newsfeed.n_date}</h6>
										<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${newsfeed.cate_name}</h4>
										<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${newsfeed.n_title}</h4>
										<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${newsfeed.n_content}</p>
									</div>
									<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
										<div class="content_good">
											<span style="color:cornflowerblue;">${newsfeed.lcnt }</span>
											<span class="glyphicon glyphicon-thumbs-up"></span>
										</div>
										<div class="content_message">
											<span id="message_count" style="color:cornflowerblue;">${newsfeed.ccnt }</span>
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
														url:'${conPath}/newsfeedMainModifyView.do',
														type:'post',
														datatype:'html',
														data:'n_num=${newsfeed.n_num}&n_title=${newsfeed.n_title}&n_content=${newsfeed.n_content}&cate_num=${newsfeed.cate_num}',
														success:function(data,status){
															$('.main_content_border${newsfeed.n_num }').html(data);
														}
													});
												});
												$('#newsfeedDelete${newsfeed.n_num }').click(function(){
													var deleteChk = confirm('정말로 삭제 하시겠습니까?');
													if(deleteChk==true){
														location.href='${conPath}/newsfeedMainDelete.do?n_num=${newsfeed.n_num}';
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
				</div>
			</div><!-- main_wrap -->
		</div><!-- main_position -->
	</div><!-- main -->
</body>
</html>