<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${conPath }/css/emp.css" rel="stylesheet" type="text/css"/>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script src="${conPath }/js/summernote-ko-KR.js"></script>
<script>
	$(document).ready(function(){
		$('#fb_content').summernote({
			width:1000,
			height:600,
			minHeight:null,
			maxHeight:1048576,
			focus:true,
			lang:'ko-KR'
		});
	});
</script>

</head>
<body>
	<form action="fboardInsert.do" method="post">
		<input type="text" name="fb_photo" value="${photo}">
		<input type="text" name="fb_name" value="${nickname}">
		<table style="text-align: left;">
			<tr>
				<td>글 제목</td>
				<td><input type="text" name="fb_title"></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td style="text-align: left;"><textarea rows="10" cols="30" name="fb_content" id="fb_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>