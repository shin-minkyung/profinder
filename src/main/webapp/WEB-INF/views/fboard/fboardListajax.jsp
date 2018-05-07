<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<c:if test="${fboardListAjax != null }">
	<div class="main_content_border">
						<div class="card border-light mb-3">
								<div class="card-body" style="margin:0; text-align: left; ">
									<img src="${conPath }/profile/${fboardListAjax.fb_photo}" style="width:60px; height: 60px; border-radius: 30px;">
									<span class="card-fb_name" style="position: absolute; top: 20px; left: 100px; font-size: 22px; font-weight: bold">${fboardListAjax.fb_name}</span>
									<span style="position: absolute; top: 64px; left: 100px; font-size: 15px;" ><fmt:formatDate value="${fboardListAjax.fb_date }" pattern="yyyy. MM. dd. hh:mm"/></span>
									<p id="title${fboardListAjax.fb_num }" style="margin-top: 30px;text-align: left; font-size: 20px; padding: 0 80px;">${fboardListAjax.fb_title}</p>
									<div id="content${fboardListAjax.fb_num}"style="padding: 0 80px; text-align: left;">${fboardListAjax.fb_content }</div>
									<form action="fboardModify.do" method="post" name="frm" onsubmit="return chk()">
										<input type="hidden" name="fb_num" value="${fboardListAjax.fb_num }">
										<p id="titleView${fboardListAjax.fb_num }" style="display: none; text-align: left;"><input type="text" class="form-control" name="fb_title" class="frm_fb_title" value="${fboardListAjax.fb_title}" style="margin-top: 30px;text-align: left; font-size: 16px; padding-left: 10px; width:900px"></p>
										<div id="contentView${fboardListAjax.fb_num }" style="display: none; text-align: left;">
											<textarea rows="10" cols="30" name="fb_content" class="updateNote">${fboardListAjax.fb_content }</textarea> 
											<p style="text-align: right; margin-right: 20px;"><input type="submit"  value="수정완료" class="btn btn-secondary" style="width:85px; height: 40px; font-weight: bold;"></p>
										</div>
									</form> 
								</div>
								<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
									<div class="fboard-comment">
										<span style="margin-right: 15px; color: cornflowerblue;">${fboardListAjax.total}</span>
										<span id="commentViewBtn${fboardListAjax.fb_num }" style="cursor: pointer;"><img src="${conPath }/img/icon_comment.png" alt="댓글" style="width:40px; height: 35px;" class="img1"></span>
									</div>
									<div class="fboard-like">
										<span style="margin-right: 15px; color: cornflowerblue;" id="likeText${fboardListAjax.fb_num }">${fboardListAjax.likecnt}</span>
										<span style="cursor: pointer;"><img src="${conPath }/img/icon_like.png" alt="좋아요" style="width:40px; height: 35px;" class="img2" onclick="location.href='${conPath}/fboardLikeInsert.do?l_num=${fboardListAjax.fb_num}&l_liker=${nickname }'"></span>
									</div>
									<div style="float: right;">
										<c:if test="${fboardListAjax.fb_name == nickname }">
											<span id="modify${fboardListAjax.fb_num }" style="cursor: pointer;">수정하기</span>
											<a href="fboardDelete.do?fb_num=${fboardListAjax.fb_num }" style="color:black; margin-left: 15px;">삭제</a>
										</c:if>
										<c:if test="${not empty findermembers or not empty promembers}">
											<a href="#" data-toggle="modal" data-target="#REPORT${fboardListAjax.fb_num }" style="color:black; margin-left: 15px;">신고하기</a>
										</c:if>
									</div>
									<div id="fboard_view${fboardListAjax.fb_num }" style="display:none; margin-top: 50px; text-align: left; position: relative;" >
									
									</div>
								</div>
									<script>
									$(function(){
										var count = 1;
										$('#commentViewBtn${fboardListAjax.fb_num }').click(function(){
											if(count == 1){
												$('#fboard_view${fboardListAjax.fb_num }').show('fast');
												count = 0;
												$.ajax({
													url : 'fboardCommentList.do',
													type : 'get',
													datatype : 'html',
													data : 'fb_num=${fboardListAjax.fb_num }',
													success : function(data, status) {
														$('#fboard_view${fboardListAjax.fb_num }').html(data);
													}
												});
											}else{
												$('#fboard_view${fboardListAjax.fb_num }').hide('fast');
												count = 1;
											}
										});
										$('#modify${fboardListAjax.fb_num }').click(function(){
											if(count == 1){
												$('#content${fboardListAjax.fb_num}').hide('fast');
												$('#contentView${fboardListAjax.fb_num }').show('fast');
												$('#title${fboardListAjax.fb_num}').hide('fast');
												$('#titleView${fboardListAjax.fb_num}').show('fast');
												$('#modify${fboardListAjax.fb_num }').html('수정취소');
												$('#modify${fboardListAjax.fb_num }').css('color', 'red');
												count = 0;
											}else{
												$('#content${fboardListAjax.fb_num}').show('fast');
												$('#contentView${fboardListAjax.fb_num }').hide('fast');
												$('#title${fboardListAjax.fb_num}').show('fast');
												$('#titleView${fboardListAjax.fb_num}').hide('fast');
												$('#modify${fboardListAjax.fb_num }').html('수정하기');
												$('#modify${fboardListAjax.fb_num }').css('color', 'black');
												count = 1;
											}
										});
									});
								</script>
							</div>
						</div>
						<div class="modal fade" id="REPORT${fboardListAjax.fb_num }">
					       <div class="modal-dialog">
					          <div class="modal-content" style="left: -80px; top: 208px;"> 
					          	<div class="modal-header" style="width:100%;">
										<h5 class="modal-title">신고하기</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="report.do">
									<input type="hidden" name="rep_num" value="${fboardListAjax.fb_num }">
										<div class="modal-body" style="padding: 40px 50px;">
											<div id="reporter" style="text-align: left;">
												<label class="form-control-label" for="inputSuccess1">신고자</label>
												<input type="text" name="rep_reporter" readonly="readonly" value="${email }" class="form-control">
											</div>
											<div id="why" style="text-align: left;">
												<label class="form-control-label" for="inputSuccess1">신고사유</label>
												<select name="rep_why" class="form-control" style="height: 40px;">
													<option value="부적절한 홍보 게시글">부적절한 홍보 게시글</option>
													<option value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용</option>
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
		</c:if>
		
</body>
</html>