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
</head>
<body>

<c:if test="${fpageNewsfeedAjaxChk==1 }">
	<div class="main_content_border">
		<div class="card border-light mb-3">
			<div class="card-body" style="margin:0;text-align:left;">
				<a href="${conPath }/ppageNewsfeedView.do?p_email=${fpageNewsfeedAjax.p_email}">
					<img src="${conPath }/profile/${fpageNewsfeedAjax.p_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />	
				</a>		
				<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
					<a href="${conPath }/ppageNewsfeedView.do?p_email=${fpageNewsfeedAjax.p_email}" style="text-decoration: none;">${fpageNewsfeedAjax.p_nickname}</a>
				</h4>
				<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${fpageNewsfeedAjax.n_date}</h6>
				<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${fpageNewsfeedAjax.cate_name}</h4>
				<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${fpageNewsfeedAjax.n_title}</h4>
				<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${fpageNewsfeedAjax.n_content}</p>
			</div>
			<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
				<div class="content_good">
					<span style="color:cornflowerblue;">${fpageNewsfeedAjax.lcnt}</span>
					<span class="glyphicon glyphicon-thumbs-up"></span>
				</div>
				<div class="content_message">
					<span style="color:cornflowerblue;">${fpageNewsfeedAjax.ccnt }</span>
					<span class="glyphicon glyphicon-comment"></span>
				</div>
				<!-- <div class="content_view">
					<span style="color:cornflowerblue;">23445</span>
					<span class="glyphicon glyphicon-eye-open"></span>
				</div> -->
				<div>
					<c:if test="${promembers.p_email eq fpageNewsfeedAjax.p_email }">
						<span id="newsfeedModifyView${fpageNewsfeedAjax.n_num }" class="newsfeedModifyView">수정하기</span>
						<span id="newsfeedDelete${fpageNewsfeedAjax.n_num }" class="newsfeedDelete">삭제하기</span>
					</c:if>
					<span class="newsfeedReport">신고하기</span>
					<span style="color:cornflowerblue;position:absolute;right:20px;" id="commentViewBtn${fpageNewsfeedAjax.n_num }" class="commentView">댓글보기</span>
				</div>
				<div id="comment_view${fpageNewsfeedAjax.n_num }" style="display:none;">
					
				</div>
				<script>
					$(function(){
						$('#newsfeedModifyView${fpageNewsfeedAjax.n_num }').click(function(){
							$.ajax({
								url:'${conPath}/newsfeedModifyView.do',
								type:'post',
								datatype:'html',
								data:'n_num=${fpageNewsfeedAjax.n_num}&n_title=${fpageNewsfeedAjax.n_title}&n_content=${fpageNewsfeedAjax.n_content}&cate_num=${fpageNewsfeedAjax.cate_num}',
								success:function(data,status){
									$('#newsfeedContent${newsfeedList.n_num }').html(data);
								}
							});
						});
						$('#newsfeedDelete${fpageNewsfeedAjax.n_num }').click(function(){
							var deleteChk = confirm('정말로 삭제 하시겠습니까?');
							if(deleteChk==true){
								location.href='${conPath}/newsfeedDelete.do?n_num=${fpageNewsfeedAjax.n_num}&p_email=${fpageNewsfeedAjax.p_email}&pageNum=${paging.currentPage}';
							}
						});
						var count = 1;
						$('#commentViewBtn${fpageNewsfeedAjax.n_num}').click(function(){
							if(count == 1){
								$('#commentViewBtn${fpageNewsfeedAjax.n_num}').html('댓글접기');
								$('#comment_view${fpageNewsfeedAjax.n_num}').show('fast');
								count = 0;
								$.ajax({
									url : '${conPath}/newsfeedCommentAjax.do',
									type : 'post',
									datatype : 'html',
									data : 'n_num=${fpageNewsfeedAjax.n_num}',
									success : function(data, status) {
										$('#comment_view${fpageNewsfeedAjax.n_num}').html(data);
									}
								});
							}else{
								$('#commentViewBtn${fpageNewsfeedAjax.n_num}').html('댓글보기');
								$('#comment_view${fpageNewsfeedAjax.n_num}').hide('fast');
								count = 1;
							}
						});
					});
				</script>
			</div>
		</div>
	</div>
</c:if>
</body>
</html>