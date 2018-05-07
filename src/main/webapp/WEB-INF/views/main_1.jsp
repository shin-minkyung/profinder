<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
				url : '${conPath}/ajax_add.do?',
				type : 'post',
				datatype : 'html',
				data : 'rn='+ajaxCount,
				success : function(data, status) {
					$(data).appendTo('.main_content');
				}
			});
		}
	}
	
</script>
<style>
	@media screen and (max-width:1000px){
		.header_2-3,.header_2-4{
			display:none;
		}
	}
	@media screen and (min-width:719px){
		.header_4{
			display:none;
		}
	}
	@media screen and (max-width:720px){
		.header_2,.header_3,.header_2-1{
			display:none;
		}
		.header_4{
			display:block;
		}
	}
	@media screen and (max-width:880px){
		#wing,.header_2-2{
			display:none;
			
		}
		body{
			background-color:red;
		}
	}	
	*{
		margin:0 auto;
		text-decoration: none;
		list-style:none;
	}
	body{
		background-color:#f4f4f4;
	}
	#header{
		position:relative;
		width:100%;
		height:50px;
		z-index: 9999;
	}
	.header_position{
		position:fixed;
		width:100%;
	}
	.header_1{
		position:absolute;
		left:44px;
		top:10px;
	}
	.header_2{
		position:absolute;
		left:287px;
		top:0px;
		width:120px;
	}
	.header_2-1{
		position:absolute;
		left:407px;
		top:0px;
		width:120px;
	}
	.header_2-2{
		position:absolute;
		left:527px;
		top:0px;
		width:120px;
	}
	.header_2-3{
		position:absolute;
		left:647px;
		top:0px;
		width:120px;
	}
	.header_2-4{
		position:absolute;
		left:767px;
		top:0px;
		width:120px;
	}
	.header_2-5{
		position:absolute;
		left:887px;
		top:0px;
		width:120px;
	}
	.header_3{
		position:absolute;
		right:10px;
		top:0px;
	}
	.header_4{
		position:absolute;
		right:10px;
		top:0px;
	
	}
	.nav-link.dropdown-toggle:hover{
		background-color:#0c769f;
	}
	#main{
		width:100%;
	}
	#main .main_position{
		width:61.8%;
		position:relative;
		background-color:white;
		border:1px solid #d3d3de;
		
	}
	#main .main_position .main_select{
		height:80px;
		position:absolute;
		width:40%;
	}
	#main .main_position .main_search{
		height:80px;
		width:55%;
	}
	#btnLa1{
		position: absolute;
		right:20px;
		top:32px;
	}
	#main .main_content{
	position:relative;
	}
	#main .main_content_border{
	border:1px solid #d3d3de;
	margin-bottom:50px;
	margin-left:2%;
	margin-right:2%;
	}
	#wing{
		position:relative;
	}
	#wing .wing_position{
		position:fixed;
		right:17%;
		top:200px;
	}
	#wing .wing_position .wing_content{
		position:absolute;
		width:122px;
		height:182px;
		background-color:white;
	}
	#wing .wing_position .wing_content .wing_content_ul{
		margin:0;
		height:100%;
		padding:0;
		text-align:center;
		border:1px solid #afafbe;
		box-shadow:3px 3px rgba(43,43,117,.07);
		box-sizing: border-box;
		padding-left:15px;
		padding-right:15px;
	}
	#wing .wing_position .wing_content .wing_content_ul li{
		height:36px;
		line-height: 36px;
		border-bottom:1px solid #e9eaed
	}
	#wing .wing_position .wing_content .wing_content_ul li a{
		display:block;
		width:100%;
		height:100%;
	}
	#wing .wing_position .wing_content .wing_content_ul li a:hover{
		background-color:#eceded;
	}
	#wing .wing_position .wing_triangle{
		width: 0;
    	height: 0;
    	border-bottom: 10px solid #afafbe;
    	border-left: 11px solid transparent;
    	border-right: 11px solid transparent;
    	position:absolute;
    	right:-73px;
    	top:-15px;
	}
	.content_message,.content_good,.content_view{
		float:left;
		margin-right:15px;
	}
	.commentView{
		cursor: pointer;
	}
	.comment_text{
		width:85%;
	}
	.comment_btn{
		position:absolute;
		right: 9px;
		width: 14%;
		height:66px;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<c:if test="${newsfeedInsert==1 }">
		<script>
			alert('뉴스피드글 등록에 성공하였습니다!');
		</script>
	</c:if>
	<c:if test="${claimInsert==1 }">
		<script>
			alert('1:1문의글 등록에 성공하였습니다!');
		</script>
	</c:if>

	<div id="header">
		<div class="header_position">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="height: 50px;border-bottom:none;">
				<div class="header_1">
					<a href="${conPath }/true_main.do">
						<img src="${conPath }/img/logo.png" alt="로고"/>
					</a>
				</div><!-- header_1 -->
				<div class="header_2">
					<ul class="nav nav-pills">
						<li class="nav-item dropdown" style="width:100%;">
							<a	class="nav-link dropdown-toggle" data-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" style="color:#fff; font-weight:bold; font-size:1.48em; width:100%;height:50px;text-align:center; ">사람찾기</a>
							<div class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 12px; left: 0px; will-change: transform;width:180px;padding:0;
								box-shadow:3px 3px rgba(43,43,117,.07);">
								<a class="dropdown-item" href="#">sub menu1</a> 
								<a class="dropdown-item" href="#">sub menu2</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"></a>
								<a class="dropdown-item" href="#"></a>
							</div>
						</li>
					</ul>
				</div><!-- header_2 -->
				<div class="header_2-1">
					<ul class="nav nav-pills">
						<li class="nav-item dropdown" style="width:100%;">
							<a	class="nav-link dropdown-toggle" data-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" style="color:#fff; font-weight:bold; font-size:1.48em; width:100%;height:50px;text-align:center; ">메뉴1</a>
							<div class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 12px; left: 0px; will-change: transform;width:180px;padding:0;
								box-shadow:3px 3px rgba(43,43,117,.07);">
								<a class="dropdown-item" href="#">sub menu1</a> 
								<a class="dropdown-item" href="#">sub menu2</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"></a>
								<a class="dropdown-item" href="#"></a>
							</div>
						</li>
					</ul>
				</div><!-- header_2 -->
				<div class="header_2-2">
					<ul class="nav nav-pills">
						<li class="nav-item dropdown" style="width:100%;">
							<a	class="nav-link dropdown-toggle" data-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" style="color:#fff; font-weight:bold; font-size:1.48em; width:100%;height:50px;text-align:center; ">메뉴2</a>
							<div class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 12px; left: 0px; will-change: transform;width:180px;padding:0;
								box-shadow:3px 3px rgba(43,43,117,.07);">
								<a class="dropdown-item" href="#">sub menu1</a> 
								<a class="dropdown-item" href="#">sub menu2</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"></a>
								<a class="dropdown-item" href="#"></a>
							</div>
						</li>
					</ul>
				</div><!-- header_2 -->
				<div class="header_2-3">
					<ul class="nav nav-pills">
						<li class="nav-item dropdown" style="width:100%;">
							<a	class="nav-link dropdown-toggle" data-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" style="color:#fff; font-weight:bold; font-size:1.48em; width:100%;height:50px;text-align:center; ">메뉴3</a>
							<div class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 12px; left: 0px; will-change: transform;width:180px;padding:0;
								box-shadow:3px 3px rgba(43,43,117,.07);">
								<a class="dropdown-item" href="#">sub menu1</a> 
								<a class="dropdown-item" href="#">sub menu2</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"></a>
								<a class="dropdown-item" href="#"></a>
							</div>
						</li>
					</ul>
				</div><!-- header_2 -->
				<div class="header_2-4">
					<ul class="nav nav-pills">
						<li class="nav-item dropdown" style="width:100%;">
							<a	class="nav-link dropdown-toggle" data-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" style="color:#fff; font-weight:bold; font-size:1.48em; width:100%;height:50px;text-align:center; ">메뉴4</a>
							<div class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 12px; left: 0px; will-change: transform;width:180px;padding:0;
								box-shadow:3px 3px rgba(43,43,117,.07);">
								<a class="dropdown-item" href="#">sub menu1</a> 
								<a class="dropdown-item" href="#">sub menu2</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"></a>
								<a class="dropdown-item" href="#"></a>
							</div>
						</li>
					</ul>
				</div><!-- header_2 -->
				<div class="header_2-5">
					<input type="button" value="임시등록" onclick="location.href='${conPath}/newsfeedInsertView.do'"/>
					<input type="button" value="1:1문의등록" onclick="location.href='${conPath}/claimInsertView.do'"/>
					<c:if test="${not empty findermembers }">
					<input type="button" value="1:1문의보기" onclick="location.href='${conPath}/claimListView.do?cl_email=${findermembers.f_email }'"/>
					</c:if>
					<c:if test="${not empty proMember }">
					<input type="button" value="1:1문의보기" onclick="location.href='${conPath}/claimListView.do?cl_email=${proMember.p_email }'"/>
					</c:if>
					<input type="button" value="관리자로 문의보기" onclick="location.href='${conPath}/claimAdminList.do'"/> 
					<input type="button" value="컨텐츠 등록" onclick="location.href='${conPath}/contentsInsertView.do'"/>
					<input type="button" value="컨텐츠 보기" onclick="location.href='${conPath}/contentsList.do'"/>
					
					<!-- 한별오빠꺼 TEST-->				
					<input type="button" value="로그인하러가기" onclick="location.href='${conPath}/memberLoginView.do'" />
					<input type="button" value="로그아웃" onclick="location.href='${conPath}/logout.do'" />
					<input type="button" value="FAQ" onclick="location.href='${conPath}/faqView.do'">
					<!-- 다혜꺼 TEST -->
					<input type="button" value="유료질문방 글작성" onclick="location.href='${conPath}/questionInsertView.do'">
				
					<!-- 성훈오빠꺼  TEST -->
					<input type="button" value="회원가입 하러가기" onclick="location.href='${conPath}/joinView.do'">
					<input type="button" value="자유게시판" onclick="location.href='${conPath}/fboardList.do'">
					<input type="button" value="프로멤버가 받은 질문리스트" onclick="location.href='${conPath}/questionList_Promembers.do?p_email=${proMember.p_email }'">
					<input type="button" value="파인더멤버가 질문한 리스트" onclick="location.href='${conPath}/questionList_findermembers.do?f_email=${findermembers.f_email}'">
					<input type="button" value="질문방리스트_분야별로 나눔" onclick="location.href='${conPath}/questionList_category.do'">
					<input type="button" value="프로멤버페이지"
						onclick="location.href='${conPath}/ppageContentView.do?p_email=hope1821@naver.com'"/>
				</div>
				<div class="header_3">
					<form action="#" class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="text" placeholder="Search"/>
						<input type="submit" class="btn btn-secondary my-2 my-sm-0" value="SEARCH"/>
					</form>
				</div><!-- header_3 -->
				<div class="header_4">
					<ul class="nav nav-pills">
						<li class="nav-item dropdown" style="width:100%;">
							<a	class="nav-link dropdown-toggle" data-toggle="dropdown"
								href="#" role="button" aria-haspopup="true"
								aria-expanded="false" style="color:#fff; font-weight:bold; font-size:1.48em; width:50px;height:50px;text-align:center; ">
								<span class="glyphicon glyphicon-menu-hamburger"></span>
							</a>
							<div class="dropdown-menu" x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 37px, 0px); top: 12px; left: -109px; will-change: transform;width:50px;padding:0;
								box-shadow:3px 3px rgba(43,43,117,.07);">
								<a class="dropdown-item" href="#">sub menu1</a> 
								<a class="dropdown-item" href="#">sub menu2</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"></a>
								<a class="dropdown-item" href="#"></a>
							</div>
						</li>
					</ul>
				</div><!-- header_4 -->
			</nav><!-- navbar navbar-expand-lg navbar-dark bg-primary -->
		</div><!-- header_position -->
	</div><!-- header -->
	<div id="wing">
		<div class="wing_position">
			<div class="wing_triangle">	
			</div>
			<div class="wing_content">
				<ul class="wing_content_ul">
					<li>
						<a href="#">THIS WEEK</a>
					</li>
					<li>
						<a href="#">UNREAD</a>
					</li>
					<li style="height:54px; line-height:27px;">
						<a href="#">0<br>Notification</a>
					</li>
					<li style="height:54px; line-height:27px;">
						<a href="#">0<br>Messages</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="main">
		<div class="main_position">
			<div class="main_select">
				<div class="form-group" style="width:100%;position:absolute;left:10px;top:16px;">
					<select class="custom-select">
						<option selected="selected">
							Open this select menu
						</option>
						<option>
							one
						</option>
						<option>
							two
						</option>
						<option>
							three
						</option>
					</select>
				</div><!-- form-group -->
			</div><!-- main_select -->
			
			<div class="main_search">
				<form action="#">
					<input type="text" class="form-control is-valid" style="border-color:#eceded; position:absolute; top:23px; right:10px; width:55%; "/>
					<input type="submit" id="searchBtn1" style="display:none">
					<label for="searchBtn1" id="btnLa1">
						<span class="glyphicon glyphicon-search"></span>
					</label>
				</form>
			</div><!-- main_search -->
			
			<div class="main_content">
				<c:forEach var="newsfeed" items="${newsfeedMain }">
					<div class="main_content_border">
						<div class="card border-light mb-3">
							<div class="card-body" style="margin:0;">
								<img src="${conPath }/img/ex1.JPG" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
								<h4 class="card-title" style="position:absolute;top:28px;padding-left:57px;width:100%;">${newsfeed.p_nickname}</h4>
								<p class="card-text" style="width:100%;">${newsfeed.n_content}</p>
							</div>
							<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
								<div class="content_good">
									<span style="color:cornflowerblue;">12</span>
									<span class="glyphicon glyphicon-thumbs-up"></span>
								</div>
								<div class="content_message">
									<span style="color:cornflowerblue;">23</span>
									<span class="glyphicon glyphicon-comment"></span>
								</div>
								<div class="content_view">
									<span style="color:cornflowerblue;">23445</span>
									<span class="glyphicon glyphicon-eye-open"></span>
								</div>
								<div>
									<span style="color:cornflowerblue;" id="commentViewBtn${newsfeed.n_num }" class="commentView">댓글보기</span>
								</div>
								<div id="comment_view${newsfeed.n_num }" style="display:none;">
									
								</div>
								<script>
									$(function(){
										var count = 1;
										$('#commentViewBtn${newsfeed.n_num}').click(function(){
											if(count == 1){
												$('#commentViewBtn${newsfeed.n_num}').html('댓글접기');
												$('#comment_view${newsfeed.n_num}').show('fast');
												count = 0;
												$.ajax({
													url : '${conPath}/comment_ajax.do',
													type : 'post',
													datatype : 'html',
													data : 'n_num=${newsfeed.n_num}',
													success : function(data, status) {
														$('#comment_view${newsfeed.n_num}').html(data);
													}
												});
											}else{
												$('#commentViewBtn${newsfeed.n_num}').html('댓글펴기');
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
		</div><!-- main_position -->
	</div><!-- main -->
	<script src="${conPath }/js/bootstrap.js"></script>
	<script src="${conPath }/js/bootstrap.min.js"></script>
	<script src="${conPath }/js/bootstrap.min1.js"></script>
	<script src="${conPath }/js/custom.js"></script>
	<script src="${conPath }/js/ga.js"></script>
	<script src="${conPath }/js/jquery.min.js"></script>
	<%-- <script src="${conPath }/js/npm.js"></script> --%>
	<script src="${conPath }/js/popper.min.js"></script>
</body>
</html>