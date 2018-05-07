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
	<table style="width:100%;">
	<c:forEach var="comment" items="${newsCommentSelect}">
			<tr>
				<td style="text-align:left;">${comment.nc_name}</td>
			</tr>
			<tr>
				<td style="text-align:left;">${comment.nc_content }</td>
			</tr>
	</c:forEach>
	<tr>
	<td>
	<c:if test="${not empty promembers or not empty findermembers }">
		<textarea rows="3" class="comment_text form-control" id="comment_text${newsfeed.n_num }" style="width:84%;"></textarea>
		<input type="button" value="댓글달기" class="comment_btn btn btn-primary" id="comment_btn${newsfeed.n_num }" style="margin-top:-70px;"/>
	</c:if>
	<script>
		$(function(){
			$('#comment_btn${newsfeed.n_num }').click(function(){
				var comment_text = $('#comment_text${newsfeed.n_num}').val();
				$.ajax({
					url : '${conPath}/newsCommentInsert.do',
					type : 'post',
					datatype : 'html',
					data : 'nc_name=${nickname}&n_num=${newsfeed.n_num}&nc_content='+comment_text,
					success : function(data, status) {
						$('#comment_view${newsfeed.n_num}').html(data);
						location.reload();
					}
				});
			});
		});
	</script>
	</td>
	</tr>
	</table>
</body>
</html>