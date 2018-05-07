<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> -->
</head>
<body>
<div class="card border-light mb-3">
	<div class="card-body" style="margin:0;text-align:left;">
		<img src="${conPath }/img/ex1.JPG" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
		<h4 class="card-title" style="position:absolute;top:16px;left:72px;">${newsfeedList.p_nickname}</h4>
		<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${newsfeedList.n_date}</h6>
		<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${newsfeedList.cate_name}</h4>
		<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${newsfeedList.n_title}</h4>
		<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${newsfeedList.n_content}</p>
	</div><!--card-body  -->
	<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
		<div class="content_good">
			<span style="color:cornflowerblue;">12</span>
			<span class="glyphicon glyphicon-thumbs-up"></span>
		</div><!-- content_good -->
		<div class="content_message">
			<span style="color:cornflowerblue;">23</span>
			<span class="glyphicon glyphicon-comment"></span>
		</div><!--content_message  -->
		<div class="content_view">
			<span style="color:cornflowerblue;">23445</span>
			<span class="glyphicon glyphicon-eye-open"></span>
		</div><!-- content_view -->
		<div>
			<c:if test="${promembers.p_email eq p_email }">
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
</body>
</html>