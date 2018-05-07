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
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="main_content_border">
	<div class="card border-light mb-3">
		<div class="card-body" style="margin:0;text-align:left;">
			<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeedMainAjax.p_email}">
				<img src="${conPath }/profile/${newsfeedMainAjax.p_photo1}" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
			</a>
			<h4 class="card-title" style="position:absolute;top:16px;left:72px;">
				<a href="${conPath }/ppageNewsfeedView.do?p_email=${newsfeedMainAjax.p_email}" style="text-decoration: none;">${newsfeedMainAjax.p_nickname}</a>
			</h4>
			<h6 class="con_date" style="position:absolute;top:45px;left:74px;">${newsfeedMainAjax.n_date}</h6>
			<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${newsfeedMainAjax.cate_name}</h4>
			<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${newsfeedMainAjax.n_title}</h4>
			<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${newsfeedMainAjax.n_content}</p>
		</div>
		<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
			<div class="content_good">
				<span style="color:cornflowerblue;">${newsfeedMainAjax.lcnt }</span>
				<span class="glyphicon glyphicon-thumbs-up"></span>
			</div>
			<div class="content_message">
				<span style="color:cornflowerblue;">${newsfeedMainAjax.ccnt }</span>
				<span class="glyphicon glyphicon-comment"></span>
			</div>
			<!-- <div class="content_view">
				<span style="color:cornflowerblue;">23445</span>
				<span class="glyphicon glyphicon-eye-open"></span>
			</div> -->
			<div>
				<span style="color:cornflowerblue;position:absolute;right:20px;" id="commentViewBtn${newsfeedMainAjax.n_num }" class="commentView">댓글보기</span>
			</div>
			<div id="comment_view${newsfeedMainAjax.n_num }" style="display:none;">
				
			</div>
			<script>
				$(function(){
					$('#newsfeedModifyView${newsfeedMainAjax.n_num }').click(function(){
						$.ajax({
							url:'${conPath}/newsfeedModifyView.do',
							type:'post',
							datatype:'html',
							data:'n_num=${newsfeedList.n_num}&n_title=${newsfeedMainAjax.n_title}&n_content=${newsfeedMainAjax.n_content}&cate_num=${newsfeedMainAjax.cate_num}',
							success:function(data,status){
								$('#newsfeedContent${newsfeedMainAjax.n_num }').html(data);
							}
						});
					});
					$('#newsfeedDelete${newsfeedMainAjax.n_num }').click(function(){
						var deleteChk = confirm('정말로 삭제 하시겠습니까?');
						if(deleteChk==true){
							location.href='${conPath}/newsfeedMainDelete.do?n_num=${newsfeedMainAjax.n_num}';
						}
					});
					var count = 1;
					$('#commentViewBtn${newsfeedMainAjax.n_num}').click(function(){
						if(count == 1){
							$('#commentViewBtn${newsfeedMainAjax.n_num}').html('댓글접기');
							$('#comment_view${newsfeedMainAjax.n_num}').show('fast');
							count = 0;
							$.ajax({
								url : '${conPath}/newsfeedCommentAjax.do',
								type : 'post',
								datatype : 'html',
								data : 'n_num=${newsfeedMainAjax.n_num}',
								success : function(data, status) {
									$('#comment_view${newsfeedMainAjax.n_num}').html(data);
								}
							});
						}else{
							$('#commentViewBtn${newsfeedMainAjax.n_num}').html('댓글보기');
							$('#comment_view${newsfeedMainAjax.n_num}').hide('fast');
							count = 1;
						}
					});
				});
			</script>
			</div>
		</div>
	</div>
</body>
</html>