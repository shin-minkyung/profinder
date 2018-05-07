<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로파인더 - 판매컨텐츠 페이지</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/ppageContent.css" rel="stylesheet" type="text/css"/>
<script>
	/* var didScroll = false;
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
				url : '${conPath}/ppageContentAjax.do?',
				type : 'post',
				datatype : 'html',
				data : 'p_email=${p_email}&r='+ajaxCount,
				success : function(data, status) {
					$(data).appendTo('.main_content');
				}
			});
		}
	} */
	
</script>
<style>
	
	
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
								<li style="border-bottom:4px solid #158CBA;">
									<p>등록 컨텐츠</p>
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
				<!-- what's this?? -->
				<c:if test="${promembers.p_email eq p_email and not empty promembers}">
					<div class="main2">
						<div class="main2-1">
						 
							<h2>컨텐츠</h2>
							<h2>올리기</h2>
						  
						</div><!-- main2-1 -->
						<div class="main2-2">
						   <div id="con_expl">
							자신의 전문성을 보여줄 수 있는 컨텐츠를 공유하거나 판매해보세요.
							저작권 위반 자료 공유/판매는 불법입니다.<br>유료컨텐츠의 가격은 0p부터 10000p까지 1000p 단위로 설정할 수 있습니다.
						   </div>
						</div><!-- main2-2 -->
						<form action="${conPath }/contentsInsert.do" method="post" enctype="multipart/form-data">
							<div class="main2-3">
								<select name="cate_num" class="form-control">
									<c:forEach var="category" items="${categorySelect }">
										<option value="${category.cate_num }">${category.cate_name }</option>
									</c:forEach>
								</select>
							</div><!-- main2-3 -->
							<div class="main2-4">
								<input type="text" class="form-control" name="con_title" placeholder="컨텐츠 제목을 입력하세요" id="con_title" />
							</div><!-- main2-4 -->
							<div class="main2-5">
								<textarea rows="10" class="form-control" cols="131" name="con_content" id="con_content"
								placeholder="유용한 지식을 공유해 주세요. 이 내용은 누구나 볼 수 있는 부분입니다. 유료로 과금할 컨텐츠는 첨부파일로 업로드 해 주세요."></textarea>
							</div><!-- main2-5 -->
							<div class="main2-6">
								<ul>
									<li><span>첨부파일1</span></li>
									<li>
										<input type="file" name="con_file1" id="con_file1"/>
									</li>
									<li>
										<select class="form-control" name="con_price1">
											<option value="0">가격(0~10000p)</option>
											<option value="0">0p</option>
											<option value="1000">1000p</option>
											<option value="2000">2000p</option>
											<option value="3000">3000p</option>
											<option value="4000">4000p</option>
											<option value="5000">5000p</option>
											<option value="6000">6000p</option>
											<option value="7000">7000p</option>
											<option value="8000">8000p</option>
											<option value="9000">9000p</option>
											<option value="10000">10000p</option>
										</select>
									</li>
								</ul>
								<ul>
									<li><span>첨부파일2</span></li>
									<li>
										<input type="file" name="con_file2" id="con_file2"/>
									</li>
									<li>
										<select class="form-control" name="con_price2">
											<option value="0">가격(0~10000p)</option>
											<option value="0">0p</option>
											<option value="1000">1000p</option>
											<option value="2000">2000p</option>
											<option value="3000">3000p</option>
											<option value="4000">4000p</option>
											<option value="5000">5000p</option>
											<option value="6000">6000p</option>
											<option value="7000">7000p</option>
											<option value="8000">8000p</option>
											<option value="9000">9000p</option>
											<option value="10000">10000p</option>
										</select>
									</li>
								</ul>
								<ul>
									<li><span>첨부파일3</span></li>
									<li>
										<input type="file" name="con_file3" id="con_file3"/>
									</li>
									<li>
										<select class="form-control" name="con_price3">
											<option value="0">가격(0~10000p)</option>
											<option value="0">0p</option>
											<option value="1000">1000p</option>
											<option value="2000">2000p</option>
											<option value="3000">3000p</option>
											<option value="4000">4000p</option>
											<option value="5000">5000p</option>
											<option value="6000">6000p</option>
											<option value="7000">7000p</option>
											<option value="8000">8000p</option>
											<option value="9000">9000p</option>
											<option value="10000">10000p</option>
										</select>
									</li>
								</ul>
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
								<h3>컨텐츠에서 검색</h3>
							</li>
							<li>
								<input type="text" name="pro_content_search" class="form-control" id="main3-1_text"/>
								<input type="button" value="검색" class="btn btn-secondary" id="main3-1_btn"/>
							</li>
						</ul>
					</div><!-- main3-1 -->
					<div class="main3-2">
						<div class="main_content">
							<c:forEach var="contentsList" items="${ppageContentsList }">
								<div class="main_content_border">
									<div class="card border-light mb-3">
										<div class="card-body" style="margin:0;text-align:left;">
											<a href="${conPath }/ppageContentView.do?p_email=${contentsList.p_email}">
												<img src="${conPath }/profile/${contentsList.p_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
											</a>
											<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
												<a href="${conPath }/ppageContentView.do?p_email=${contentsList.p_email}" style="text-decoration: none;">${contentsList.p_nickname}</a>
											</h4>
											<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${contentsList.con_date}</h6>
											<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${contentsList.cate_name}</h4>
											<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${contentsList.con_title}</h4>
											<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${contentsList.con_content}</p>
											<c:if test="${contentsList.con_file1 != '파일없음' or contentsList.con_file2 != '파일없음' or contentsList.con_file3 != '파일없음'  }">
											<span>${contentsList.con_file1}     ${contentsList.con_file2}     ${contentsList.con_file3}    ${contentsList.con_price}P</span>
											</c:if>
										</div>
										<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
											<div class="content_good">
												<span style="color:cornflowerblue;">${contentsList.lcnt }</span>
												<span class="glyphicon glyphicon-thumbs-up"></span>
											</div>
											<!-- <div class="content_message">
												<span style="color:cornflowerblue;">23</span>
												<span class="glyphicon glyphicon-comment"></span>
											</div> -->
											<div class="content_view">
												<span style="color:cornflowerblue;">${contentsList.con_download }</span>
												<span class="glyphicon glyphicon-eye-open"></span>
											</div>	
											<div>
												<c:if test="${promembers.p_email eq contentsList.p_email }">
													<span id="contentsModifyView${contentsList.n_num }" class="contentsModifyView">수정하기</span>
													<span id="contentsDelete${contentsList.n_num }" class="contentsDelete">삭제하기</span>
												</c:if>
												<span class="contentsReport">신고하기</span>
												<c:if test="${not empty findermembers }">
													<c:if test="${contentsList.con_file1 != '파일없음' or contentsList.con_file2 != '파일없음' or contentsList.con_file3 != '파일없음'  }">
														<span style="color:cornflowerblue;position:absolute;right:20px;cursor: pointer;" id="downloadBtn${contentsList.con_num }" class="conDownload">다운받기</span>
													</c:if>
													
												</c:if>
												<script>
													$(function(){
														$('#contentsModifyView${contentsList.con_num }').click(function(){
															$.ajax({
																url:'${conPath}/newsfeedModifyView.do',
																type:'post',
																datatype:'html',
																data:'con_num=${contentsList.con_num}',
																success:function(data,status){
																	$('#newsfeedContent${newsfeedList.n_num }').html(data);
																}
															});
														});
														$('#contentsDelete${newsfeedList.con_num }').click(function(){
															var deleteChk = confirm('정말로 삭제 하시겠습니까?');
															if(deleteChk==true){
																location.href='${conPath}/contentsDelete.do?con_num=${contentsList.con_num}&p_email=${contentsList.p_email}&pageNum=${paging.currentPage}';
															}
														});
														$('#downloadBtn${contentsList.con_num}').click(function(){
															if(${contentsList.con_price> findermembers.f_point}){
																alert('포인트가 부족해서 다운받으실 수 없습니다!! 필요한 포인트 ${contentsList.con_price}P');
															}else{
																var downloadChk = confirm('다운로드 하시겠습니까? 필요한 포인트 ${contentsList.con_price}P                            이미 다운 받으신분은 포인트 차감이 안됩니다.');
																if(downloadChk==true){
																	
																	location.href='${conPath}/contentsDownload.do?con_num=${contentsList.con_num}&p_email=${contentsList.p_email}&f_email=${findermembers.f_email}&pageNum=${paging.currentPage}&f_point=${contentsList.con_price}&jsp=ppage';
																}
															}
														});
													});
												</script>
											</div>
											<c:if test="${contentsList.con_num eq downCon_num }">
												<div id="conDownList${contentsList.con_num }" style="width:100%;height:100px;">
													<c:if test="${contentsList.con_file1 != '파일없음' }">
														<a href="${conPath }/contentsFile/${contentsList.con_file1}" style="text-decoration: none;position: absolute;bottom: 65px;left:150px;">${contentsList.con_file1 }</a>
													</c:if>
													<c:if test="${contentsList.con_file2 != '파일없음' }">
														<a href="${conPath }/contentsFile/${contentsList.con_file2}" style="text-decoration: none;position: absolute;bottom: 38px;left:150px;">${contentsList.con_file2 }</a>
													</c:if>
													<c:if test="${contentsList.con_file3 != '파일없음' }">
														<a href="${conPath }/contentsFile/${contentsList.con_file3}" style="text-decoration: none;position: absolute;bottom: 10px;left:150px;">${contentsList.con_file3 }</a>
													</c:if>
												</div>
											</c:if>											
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
		 				<a class="page-link" href="${conPath }/ppageContentView.do?pageNum=${paging.startPage-1}&p_email=${p_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/ppageContentView.do?pageNum=${i}&p_email=${p_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/ppageContentView.do?pageNum=${paging.endPage+1}&p_email=${p_email}">&raquo;</a>
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