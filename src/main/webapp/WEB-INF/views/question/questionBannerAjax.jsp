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
	<c:set var="i" value="1"/>
		<c:forEach var="question" items="${questionMainBannerAjax }">
			<ul class="main2-2-ul${i }">
				<li class="main2-2-ul${i }-li1">
					<a href="${conPath }/ppageQuestionView.do?p_email=${question.p_email}">
						${question.q_title}
					</a>
				</li>
				<li class="main2-2-ul${i }-li2">${question.p_nickname}</li>
				<li class="main2-2-ul${i }-li3">좋아요 ${question.cnt}</li>
			</ul>
		<c:set var="i" value="${i+1 }"/>
	</c:forEach>
</body>
</html>