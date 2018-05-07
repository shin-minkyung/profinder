<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	body{
		background-color: #f4f4f4;
	}
	.fade, .in{
		background-color: rgba( 0, 0, 0, 0.3 );
	}
</style>
<body>
	<div class="commnetContainer">
		<!-- Step 0  -->
		<c:forEach var="step0" items="${fboardComment }" varStatus="status">
			<c:if test="${step0.fc_indent == 0 }">
				<c:set var="cnt" value="0"></c:set>
			</c:if>
			<c:if test="${step0.fc_indent != 0 }">
				<c:set var="cnt" value="1"></c:set>
			</c:if>
			<c:if test="${step0.fc_group == step0.fc_num}">
				<div class="media">
					<div class="media-left">
						<c:if test="${step0.fc_del == 0 }">
							<img src="${conPath }/profile/${step0.fc_photo}" class="media-object" style="width:45px">
						</c:if>
						<c:if test="${step0.fc_del == 1 }">
							<span style="padding-right:45px;"></span>
						</c:if>
					</div>
					<div class="media-body relative-only" style="text-align: left;">
					<c:if test="${step0.fc_del == 0 }">
						<ul style="float: right; vertical-align: top;">
						<c:if test="${step0.fc_name == nickname }">
							<li style="margin-right: 15px;"><span id="update${step0.fc_num }" style="cursor: pointer;">수정</span></li>
							<li style="margin-right: 15px;"><span id="delete${step0.fc_num }" style="cursor: pointer;">삭제</span></li>
						</c:if>
						<c:if test="${not empty promembers or not empty findermembers }">
							<li style="margin-right: 15px;"><a href="#" data-toggle="modal" data-target="#REPORT${step0.fc_num }" style="color: black;">신고하기</a></li>
							<li style="margin-right: 15px;"><span id="comment${step0.fc_num }" style="cursor: pointer;">답글달기</span></li>
						</c:if>
						</ul>
						<h4 class="media-heading" style="text-align: left;">${step0.fc_name }
							<small><i><fmt:formatDate value="${step0.fc_date }" pattern="yyyy. MM. dd HH:mm"/></i></small>
						</h4>
						<p style="text-align: left;" id="content${step0.fc_num }">${step0.fc_content }</p>
					</c:if>
					<c:if test="${step0.fc_del == 1 }">
						<h4 class="media-heading" style="text-align: left; font-size: 13px;">
						&nbsp;<small><i>&nbsp;</i></small></h4>
						<p style="text-align: left;">삭제된 댓글입니다.</p>
					</c:if>
						
						<p style="text-align: left; display: none;" id="update_1${step0.fc_num }"><textarea rows="3" class="form-control" id="update_text${step0.fc_num }" style="width:730px; text-align: left; float: left;"></textarea> 
							<input type="button" value="수정하기" class="btn btn-secondary" id="update_btn${step0.fc_num }" style="vertical-align: top; width:84px; height: 74px; margin-left: 10px; font-weight: bold"></p>
						
						<div id="text${step0.fc_num }" style="display: none;">
							<textarea rows="3" class="form-control"
								id="comment_text${step0.fc_num }" style="width:690px; text-align: left; float: left;"></textarea>
							<input type="button" value="댓글달기" class="btn btn-secondary"
								id="comment_btn${step0.fc_num }" style="width: 85px; vertical-align:  top; height: 74px; margin-left: -43px; font-weight: bold;">
						</div>
						<script>
					$(function() {
						var count = 1;
						// 추가 댓글 입력칸 생성
						$('#comment${step0.fc_num }').click(function() {
							if (count == 1) {	
								$('#text${step0.fc_num }').show('fast');
								$('#comment${step0.fc_num }').html('답글취소');
								$('#comment${step0.fc_num }').css('color', 'red');
								count = 0;
							} else {
								$('#text${step0.fc_num }').hide('fast');
								$('#comment${step0.fc_num }').html('답글달기');
								$('#comment${step0.fc_num }').css('color', 'black');
								count = 1;
									}
								});
						// 댓글 수정
						$('#update_btn${step0.fc_num }').click(function(){
							var comment = $('#update_text${step0.fc_num }').val();
							$.ajax({
								url : 'commentUpdate.do',
								type : 'get',
								data : 'fc_content='+comment+"&fc_num=${step0.fc_num}&fb_num=${step0.fb_num}",
								success : function(data, status){
									$('#fboard_view${fb_num }').html(data);
								}
							});
						});
						// 댓글 수정 칸 생성
						$('#update${step0.fc_num }').click(function(){
							if(count == 1){
								$('#content${step0.fc_num }').hide('fast');
								$('#update_1${step0.fc_num }').show('fast');
								$('#update${step0.fc_num }').html('수정취소');
								$('#update${step0.fc_num }').css('color', 'red');
								count = 0;
							} else{
								$('#content${step0.fc_num }').show('fast');
								$('#update_1${step0.fc_num }').hide('fast');
								$('#update${step0.fc_num }').html('수정');
								$('#update${step0.fc_num }').css('color', 'black');
								count = 1;
							}
						});
						
						// 대댓글 INSERT AJAX
						$('#comment_btn${step0.fc_num }').click(function() {
							var fc_content = $('#comment_text${step0.fc_num }').val();
							$.ajax({
								url : 'fboardCommentReply.do',
								type : 'get',
								data : 'fc_num=${step0.fc_num}&fc_name=${nickname}&fc_content='
										+ fc_content
										+ '&fc_photo=${photo}&cnt=${cnt}',
								success : function(data, status) {
										$('#fboard_view${fb_num }').html(data);
										location.reload();
									}
							});
							
						});
						$('#delete${step0.fc_num }').click(function(){
							$.ajax({
								url : 'commentDelete.do',
								type : 'get',
								data : 'fc_num=${step0.fc_num}&fb_num=${step0.fb_num}',
								success : function(data, status){
									alert('삭제되었습니다');
									$('#fboard_view${fb_num }').html(data);
									location.reload();
								}
							});
						});
					});
				</script>
						<!-- step 1 -->
						<c:forEach var="step1" items="${fboardComment }">
							<c:if test="${step1.fc_indent == 0 }">
								<c:set var="cnt" value="0"></c:set>
							</c:if>
							<c:if test="${step1.fc_indent != 0 }">
								<c:set var="cnt" value="1"></c:set>
							</c:if>
							<c:if test="${step0.fc_group == step1.fc_group && step1.fc_indent == 1}">
								<div class="media">
									<div class="media-left">
										<c:if test="${step1.fc_del == 0 }">
											<img src="${conPath }/profile/${step1.fc_photo}" class="media-object" style="width:45px">
										</c:if>
										<c:if test="${step1.fc_del == 1 }">
											<span style="padding-right:45px;"></span>
										</c:if>
									</div>
									<div class="media-body relative-only">
										<c:if test="${step1.fc_del == 0 }">
											<ul style="float: right; vertical-align: top;">
											<c:if test="${step1.fc_name == nickname }">
												<li style="margin-right: 15px;"><span id="update${step1.fc_num }" style="cursor: pointer;">수정</span></li>
												<li style="margin-right: 15px;"><span id="delete${step1.fc_num }" style="cursor: pointer;">삭제</span></li>
											</c:if>
											<c:if test="${not empty promembers or not empty findermembers }">
												<li style="margin-right: 15px;"><a href="#" data-toggle="modal" data-target="#REPORT${step1.fc_num }" style="color: black;">신고하기</a></li>
												<li style="margin-right: 15px;"><span id="comment${step1.fc_num }" style="cursor: pointer;">답글달기</span></li>
											</c:if>
											</ul>
											<h4 class="media-heading" style="text-align: left;">${step1.fc_name }
											<small><i><fmt:formatDate value="${step1.fc_date }" pattern="yyyy. MM. dd HH:mm"/></i></small></h4>
											<p style="text-align: left;" id="content${step1.fc_num }">${step1.fc_content }</p>
										</c:if>
										<c:if test="${step1.fc_del == 1 }">
											<h4 class="media-heading" style="text-align: left; font-size: 13px;">
											&nbsp;<small><i>&nbsp;</i></small></h4>
											<p style="text-align: left;">삭제된 댓글입니다.</p>
										</c:if>
											
											<p style="text-align: left; display: none;" id="update_1${step1.fc_num }"><textarea rows="3" class="form-control" id="update_text${step1.fc_num }" style="width:690px; text-align: left; float: left;"></textarea> 
												<input type="button" value="수정하기" class="btn btn-secondary" id="update_btn${step1.fc_num }" style="vertical-align: top; width:84px; height: 74px; margin-left: 10px; font-weight: bold;"></p>
											<div id="text${step1.fc_num }" style="display: none;">
												<textarea rows="3" class="form-control"
													id="comment_text${step1.fc_num }" style="width:680px; text-align: left; float: left;" ></textarea>
												<input type="button" value="댓글달기" class="btn btn-secondary"
													id="comment_btn${step1.fc_num }" style="width: 85px; vertical-align:  top; height: 74px; font-weight: bold;">
											</div>
										
										
									<script>
									$(function() {
										var count = 1;
										$('#comment${step1.fc_num }').click(
												function() {
													if (count == 1) {
														$('#text${step1.fc_num }').show('fast');
														$('#comment${step1.fc_num }').html('답글취소');
														$('#comment${step1.fc_num }').css('color', 'red');
														count = 0;
													} else {
														$('#text${step1.fc_num }').hide('fast');
														$('#comment${step1.fc_num }').html('답글달기');
														$('#comment${step1.fc_num }').css('color', 'black');
														count = 1;
													}
												});
										// 댓글 수정
										$('#update_btn${step1.fc_num }').click(function(){
											var comment = $('#update_text${step1.fc_num }').val();
											$.ajax({
												url : 'commentUpdate.do',
												type : 'get',
												data : 'fc_content='+comment+"&fc_num=${step1.fc_num}&fb_num=${step1.fb_num}",
												success : function(data, status){
													$('#fboard_view${fb_num }').html(data);
												}
											});
										});
										// 댓글 수정 칸 생성
										$('#update${step1.fc_num }').click(function(){
											if(count == 1){
												$('#content${step1.fc_num }').hide('fast');
												$('#update_1${step1.fc_num }').show('fast');
												$('#update${step1.fc_num }').html('수정취소');
												$('#update${step1.fc_num }').css('color', 'red');
												count = 0;
											} else{
												$('#content${step1.fc_num }').show('fast');
												$('#update_1${step1.fc_num }').hide('fast');
												$('#update${step1.fc_num }').html('수정');
												$('#update${step1.fc_num }').css('color', 'black');
												count = 1;
											}
										});
										// 대댓글 INSERT AJAX
									$('#comment_btn${step1.fc_num }').click(
										function() {
											var fc_content = $('#comment_text${step1.fc_num }').val();
												$.ajax({
													url : 'fboardCommentReply.do',
													type : 'get',
													data : 'fc_num=${step1.fc_num}&fc_name=${nickname}&fc_content='
														+ fc_content
														+ '&fc_photo=${photo}&cnt=${cnt}',
													success : function(data, status) {
														$('#fboard_view${fb_num }').html(data);
														location.reload();
													}
												});
											});
										// 댓글 삭제 ajax
									$('#delete${step1.fc_num }').click(function(){
										$.ajax({
											url : 'commentDelete.do',
											type : 'get',
											data : 'fc_num=${step1.fc_num}&fb_num=${step1.fb_num}',
											success : function(data, status){
												alert('삭제되었습니다');
												$('#fboard_view${fb_num }').html(data);
												location.reload();
											}
										});
									});
										});
									</script>
										<!-- step 2 -->
										<c:forEach var="step2" items="${fboardComment }" varStatus="status">
											<c:if test="${step2.fc_indent == 0 }">
												<c:set var="cnt" value="0"></c:set>
											</c:if>
											<c:if test="${step2.fc_indent != 0 }">
												<c:set var="cnt" value="1"></c:set>
											</c:if>
											<c:if test="${step1.fc_group2 == step2.fc_group2 && step2.fc_indent >= 2}">
												<div class="media">
													<div class="media-left">
														<c:if test="${step2.fc_del == 0 }">
															<img src="${conPath }/profile/${step2.fc_photo}" class="media-object" style="width:45px">
														</c:if>
														<c:if test="${step2.fc_del == 1 }">
															<span style="padding-right:45px;"></span>
														</c:if>
													</div>
													<div class="media-body relative-only">
														<c:if test="${step2.fc_del == 0 }">
															<ul style="float: right; vertical-align: top;">
															<c:if test="${step2.fc_name == nickname }">
																<li style="margin-right: 15px;"><span id="update${step2.fc_num }" style="cursor: pointer;">수정</span></li>
																<li style="margin-right: 15px;"><span id="delete${step2.fc_num }" style="cursor: pointer;">삭제</span></li>
															</c:if>
															<c:if test="${not empty promembers or not empty findermembers }">
																<li style="margin-right: 15px;"><a href="#" data-toggle="modal" data-target="#REPORT${step2.fc_num }" style="color: black;">신고하기</a></li>
																<li style="margin-right: 15px;"><span id="comment${step2.fc_num }" style="cursor: pointer;">답글달기</span></li>
															</c:if>
															</ul>
															<h4 class="media-heading" style="text-align: left;">${step2.fc_name }
																<small><i><fmt:formatDate value="${step2.fc_date }" pattern="yyyy. MM. dd HH:mm"/></i></small>
															</h4>
															<p style="text-align: left;" id="content${step2.fc_num }">${step2.fc_content }</p>
														</c:if>
														<c:if test="${step2.fc_del == 1 }">
															<h4 class="media-heading" style="text-align: left; font-size: 13px;">&nbsp;
															<small><i>&nbsp;</i></small></h4>
															<p style="text-align: left;">삭제된 댓글입니다.</p>
														</c:if>
															<p style="text-align: left; display: none;" id="update_1${step2.fc_num }"><textarea rows="3" class="form-control" id="update_text${step2.fc_num }" style="width:640px; text-align: left; float: left;"></textarea> 
																<input type="button" value="수정하기" class="btn btn-secondary" id="update_btn${step2.fc_num }" style="vertical-align: top; width:84px; height: 74px; margin-left: 10px; font-weight: bold;"></p>
															<div id="text${step2.fc_num }" style="display: none;">
																<textarea rows="3" class="form-control"
																	id="comment_text${step2.fc_num }" style="width:630px; text-align: left; float: left;"></textarea>
																<input type="button" value="댓글달기" class="btn btn-secondary"
																	id="comment_btn${step2.fc_num }" style="width: 85px; vertical-align:  top; height: 74px; font-weight: bold;">
															</div>
														
														
													<script>
														$(function() {
															var count = 1;
															$('#comment${step2.fc_num }').click(function() {
																if (count == 1) {
																	$('#text${step2.fc_num }').show('fast');
																	$('#comment${step2.fc_num }').html('답글취소');
																	$('#comment${step2.fc_num }').css('color', 'red');
																	count = 0;
																} else {
																	$('#text${step2.fc_num }').hide('fast');
																	$('#comment${step2.fc_num }').html('답글달기');
																	$('#comment${step2.fc_num }').css('color', 'black');
																	count = 1;
																}
															});
															// 댓글 수정
															$('#update_btn${step2.fc_num }').click(function(){
																var comment = $('#update_text${step2.fc_num }').val();
																$.ajax({
																	url : 'commentUpdate.do',
																	type : 'get',
																	data : 'fc_content='+comment+"&fc_num=${step2.fc_num}&fb_num=${step2.fb_num}",
																	success : function(data, status){
																		$('#fboard_view${fb_num }').html(data);
																	}
																});
															});
															// 댓글 수정 칸 생성
															$('#update${step2.fc_num }').click(function(){
																if(count == 1){
																	$('#content${step2.fc_num }').hide('fast');
																	$('#update_1${step2.fc_num }').show('fast');
																	$('#update${step2.fc_num }').html('수정취소');
																	$('#update${step2.fc_num }').css('color', 'red');
																	count = 0;
																} else{
																	$('#content${step2.fc_num }').show('fast');
																	$('#update_1${step2.fc_num }').hide('fast');
																	$('#update${step2.fc_num }').html('수정');
																	$('#update${step2.fc_num }').css('color', 'black');
																	count = 1;
																}
															});
															// 대댓글 INSERT AJAX
															$('#comment_btn${step2.fc_num }').click(function() {
																var fc_content = $('#comment_text${step2.fc_num }').val();
																	$.ajax({
																		url : 'fboardCommentReply.do',
																		type : 'get',
																		data : 'fc_num=${step2.fc_num}&fc_name=${nickname}&fc_content='
																				+ fc_content
																				+ '&fc_photo=${photo}&cnt=${cnt}',
																		success : function(data, status) {
																				$('#fboard_view${fb_num }').html(data);
																				location.reload();
																		}
																	});
																});
															$('#delete${step2.fc_num }').click(function(){
																$.ajax({
																	url : 'commentDelete.do',
																	type : 'get',
																	data : 'fc_num=${step2.fc_num}&fb_num=${step2.fb_num}',
																	success : function(data, status){
																		alert('삭제되었습니다');
																		$('#fboard_view${fb_num }').html(data);
																		location.reload();
																	}
																});
															});
														});
													</script>
													</div>
												</div>
											</c:if>
										</c:forEach> <!-- step 2 -->
									</div>
								</div>
							</c:if>
						</c:forEach> <!-- step 1 -->
					</div>
				</div>
			</c:if>
		</c:forEach> <!-- step 0 -->
		<textarea rows="3" id="comment_text${fb_num }" style="width:760px; text-align: left; float: left; margin-left: 30px;" class="form-control"></textarea>
		<input type="button" value="댓글달기"
			id="comment_btn${fb_num }" style="width: 85px; vertical-align:  top; height: 74px; font-weight: bold; margin-left: -5px;" class="btn btn-secondary">
			
			<!-- 댓글 입력 ajax -->
		<script>
			$(function() {
				$('#comment_btn${fb_num }').click(
					function() {
						var comment_text = $('#comment_text${fb_num }').val();
						$.ajax({
							url : 'fboardCommentInsert.do',
							type : 'post',
							datatype : 'html',
							data : 'fb_num=${fb_num }&fc_content='
									+ comment_text
									+ '&fc_name=${nickname}&fc_photo=${photo}',
							success : function(data, status) {
								$('#fboard_view${fb_num }').html(data);
								location.reload();
							}
						});
				});
			});
		</script>
	</div>
	<!-- 신고하기 모달 DIV -->
	<c:forEach var="report" items="${fboardComment}">
	<div class="modal fade" id="REPORT${report.fc_num }">
       <div class="modal-dialog">
          <div class="modal-content" style="left: -80px; top: 208px;"> 
          	<div class="modal-header" style="width:100%;">
					<h5 class="modal-title">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="report.do">
				<input type="hidden" name="rep_num" value="${report.fc_num }">
					<div class="modal-body" style="padding: 40px 50px;">
						<div id="reporter" style="text-align: left;">
							<label>신고자</label>
							<input type="text" name="rep_reporter" readonly="readonly" value="${email }" class="form-control">
						</div>
						<div id="why" style="text-align: left;">
							<label>신고사유</label>
							<select name="rep_why" class="form-control" style="height: 40px;">
								<option value="부적절한 홍보 게시글">부적절한 홍보 게시글</option>
								<option value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 애용</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="신고하기" style="width:85px; height: 35px;">
					</div>
				</form>
          </div>
       </div>
    </div>
    </c:forEach>
</body>
</html>