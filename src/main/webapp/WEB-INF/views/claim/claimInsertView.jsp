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
<link href="${conPath }/css/emp.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<form action="${conPath }/claimInsert.do" method="post">
	<c:if test="${not empty findermembers }">
		<input type="hidden" name="cl_email" value="${findermembers.f_email }">
		<input type="hidden" name="cl_nickname" value="${findermembers.f_nickname }"/>
	</c:if>
	<c:if test="${not empty proMember }">
		<input type="hidden" name="cl_email" value="${proMember.p_email }">
		<input type="hidden" name="cl_nickname" value="${proMember.p_nickname }"/>
	</c:if>
	<table>
		<caption>임시 1:1문의 등록</caption>
		<tr>
			<th>문의분류</th>
			<td>
				<select name="cl_cate">
					<option value="회원">회원관련</option>
					<option value="게시글">게시글관련</option>
					<option value="컨텐츠">컨텐츠관련</option>
					<option value="기타">기타문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td>
				<textarea rows="15" name="cl_content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="1:1문의 등록"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록가기" 
				onclick="location.href='${conPath}/main.do'"/>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>