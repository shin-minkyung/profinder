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
	<form action="${conPath }/claimAdminAnswer.do">
		<table>
			<caption>관리자 메일로 임시답변</caption>
			<tr>
				<th>답변받는 이메일</th>
				<td>${cl_email }</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>
					<textarea rows="10" cols="30" name="cl_content">${cl_content }</textarea>
				</td>
			</tr>
			<tr>
				<th>답변내용</th>
				<td>
					<textarea rows="10" cols="30" name="cl_answer"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="cl_email" value="${cl_email }"/>
					<input type="hidden" name="cl_num" value="${cl_num }"/>
					<input type="submit" value="답변하기"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="목록가기"
					onclick="location.href='${conPath}/claimAdminList.do'"/>
					<input type="button" value="메인가기"
					onclick="location.href='${conPath}/main.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>