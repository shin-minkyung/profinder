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
								<li>
									<p><a href="${conPath }/fpageNewsfeedView.do?f_email=${f_email}" style="color:black;text-decoration:none;">구독 소식</a></p>
									<p>&nbsp;</p>
								</li>
								<li style="border-bottom:4px solid #ac9bee;">
									<p>구매 컨텐츠</p>
									<p>${paging.total }</p>
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
								<h3>컨텐츠에서 검색</h3>
							</li>
							<li>
								<input type="text" class="form-control" name="finder_contents_search" id="main2-1_text"/>
								<input type="button" class="btn btn-secondary" value="검색" id="main2-1_btn"/>
							</li>
						</ul>
					</div><!-- main2-1 -->
					<div class="main2-2">
						<div class="main_content">
							<c:forEach var="contentsList" items="${fpageContentsList }">
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
												<span style="color:cornflowerblue;">${contentsList.con_download}</span>
												<span class="glyphicon glyphicon-eye-open"></span>
											</div>
											<div>
												<c:if test="${promembers.p_email eq contentsList.p_email }">
													<span id="contentsModifyView${contentsList.n_num }" class="contentsModifyView">수정하기</span>
													<span id="contentsDelete${contentsList.n_num }" class="contentsDelete">삭제하기</span>
												</c:if>
												<span class="contentsReport">신고하기</span>
												<c:if test="${not empty findermembers }">
													<c:if test="${contentsList.con_file1!= null or contentsList.con_file2!= null or contentsList.con_file3!= null  }">
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
														$('#contentsDelete${contentsList.con_num }').click(function(){
															var deleteChk = confirm('정말로 삭제 하시겠습니까?');
															if(deleteChk==true){
																location.href='${conPath}/contentsDelete.do?con_num=${contentsList.con_num}&p_email=${contentsList.p_email}&pageNum=${paging.currentPage}';
															}
														});
														$('#downloadBtn${contentsList.con_num}').click(function(){
															
																var downloadChk = confirm('다운로드 하시겠습니까? 필요한 포인트 ${contentsList.con_price}P                           이미 다운 받으신분은 포인트 차감이 안됩니다.');
																if(downloadChk==true){
																	location.href='${conPath}/contentsDownload.do?con_num=${contentsList.con_num}&p_email=${contentsList.p_email}&f_email=${findermembers.f_email}&pageNum=${paging.currentPage}&f_point=${contentsList.con_price}&jsp=fpage';
																}
															
														});
													});
												</script>
											</div>
											<c:if test="${contentsList.con_num eq downCon_num }">
												<div id="conDownList${contentsList.con_num }" style="width:100%;height:100px;">
													<c:if test="${contentsList.con_file1!=null }">
														<a href="${conPath }/contentsFile/${contentsList.con_file1}" style="text-decoration: none;position: absolute;bottom: 65px;left:150px;">${contentsList.con_file1 }</a>
													</c:if>
													<c:if test="${contentsList.con_file2!=null }">
														<a href="${conPath }/contentsFile/${contentsList.con_file2}" style="text-decoration: none;position: absolute;bottom: 38px;left:150px;">${contentsList.con_file2 }</a>
													</c:if>
													<c:if test="${contentsList.con_file3!=null }">
														<a href="${conPath }/contentsFile/${contentsList.con_file3}" style="text-decoration: none;position: absolute;bottom: 10px;left:150px;">${contentsList.con_file3 }</a>
													</c:if>
												</div>
											</c:if>																
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
		 				<a class="page-link" href="${conPath }/fpageBuyContentView.do?pageNum=${paging.startPage-1}&f_email=${finderInfo.f_email}">&laquo;</a>
					 </li>
	 				</c:if>
	 				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					  <c:if test="${paging.currentPage == i }">
						<li class="page-item active"> 
			  			 <a class="page-link"><b>${i }</b></a> 
						</li>
					</c:if>
					<c:if test="${paging.currentPage != i }">
					   <li class="page-item"><a class="page-link" href="${conPath }/fpageBuyContentView.do?pageNum=${i}&f_email=${finderInfo.f_email}">${i }</a></li>
					</c:if>
	 			  </c:forEach>
	 			  <c:if test="${paging.endPage<paging.pageCnt }">
				   <li class="page-item">
		 			<a class="page-link" href="${conPath }/fpageBuyContentView.do?pageNum=${paging.endPage+1}&f_email=${finderInfo.f_email}">&raquo;</a>
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