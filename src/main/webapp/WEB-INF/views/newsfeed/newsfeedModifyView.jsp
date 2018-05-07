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
<%-- <link href="${conPath }/css/sumbootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> --%>
<!-- include summernote css/js-->
<%-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="${conPath }/js/summernote-ko-KR.js"></script> --%>
<!-- <script src="https://ssl.google-analytics.com/ga.js"></script> -->
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />
<%-- <link href="${conPath }/css/ppageNewsfeed.css" rel="stylesheet" type="text/css"/> --%>
<script>
$(document).ready(function(){
	$('#contentModify${newsfeed.n_num }').summernote({
		width:945,
		height:400,
		minHeight:null,
		maxHeight:null,
		focus:true,
		lang:'ko-KR'
	});
});
</script>
</head>
<body>
<select name="cate_num" id="cate_numModify${newsfeed.n_num }" style="margin-left:-5px;margin-bottom:20px;margin-top:15px;margin-right:20px;
width:150px;height:26px;padding-left:50px;">
	<c:forEach var="category" items="${categorySelect }">
		<c:if test="${category.cate_num == newsfeed.cate_num }">
			<option selected="selected" value="${category.cate_num }">${category.cate_name}</option>
		</c:if>
		<c:if test="${category.cate_num != newsfeed.cate_num }">
			<option value="${category.cate_num }">${category.cate_name}</option>
		</c:if>
	</c:forEach>
</select>
<input type="text" name="n_title" value="${newsfeed.n_title }" placeholder="소식 제목을 입력하세요" id="titleModify${newsfeed.n_num}" style="width:720px;height:25px;padding-left:10px;"/>
<textarea class="form-control" name="n_content" id="contentModify${newsfeed.n_num }"
placeholder="소식 내용을 작성해주세요.본 내용은 메인페이지에서 누구에게나 공개됩니다.">${newsfeed.n_content }</textarea>
<div class="btnDiv" style="position: relative;">
	<input type="button"id="modifyBtn${newsfeed.n_num }" class="btn btn-primary btn-lg btn-block width320" value="수정완료" style="width:120px;margin-left:670px; margin-bottom:15px;"/>
	<input type="reset" id="resetBtn${newsfeed.n_num }" class="btn btn-primary btn-lg btn-block width320" value="다시수정" style="width:120px;position: absolute;bottom:0px;right:30px;margin-top:0px;"/>
</div>
<script>
	$(function(){
		$('#resetBtn${newsfeed.n_num }').click(function(){
			$.ajax({
				url:'${conPath}/newsfeedModifyView.do',
				type:'post',
				datatype:'html',
				data:'n_num=${newsfeed.n_num}',
				success:function(data,status){
					$('#newsfeedContent${newsfeed.n_num }').html(data);
				}
			});
		});
		$('#modifyBtn${newsfeed.n_num }').click(function(){
			$.ajax({
				url:'${conPath}/newsfeedModify.do',
				type:'post',
				datatype:'html',
				data:'p_email=${newsfeed.p_email}&n_title='+$("#titleModify${newsfeed.n_num}").val()+'&n_content='+$("#contentModify${newsfeed.n_num }").val()+'&n_num=${newsfeed.n_num}&cate_num='+$("#cate_numModify${newsfeed.n_num }").val(),
				success:function(data,status){
					$('#newsfeedContent${newsfeed.n_num }').html(data);
				}
			});
		});
	})
</script>
</body>
</html>