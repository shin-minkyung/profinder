<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="num" value="${paging.total - paging.startRow+1 }" />
	<h1>Promembers볼 유료질문방</h1>
	<table>
		<tr>
			<td><a href="${conPath }/questionInsertView.do">유료질문방 글 작성</a></td>
		</tr>
		<tr>
			<th>글번호</th>
			<th>질문자</th>
			<th>답변자</th>
			<th>분야</th>
			<th>질문제목</th>
			<th>질문내용</th>
			<th>가격</th>
			<th>작성날짜</th>
			<th>수락여부</th>
			<th>별점</th>
		</tr>
		<c:forEach var="list" items="${questionList_Promembers}">
			<tr>
				<td>${num }</td>
				<td>${list.f_email }</td>
				<td>${list.p_email }</td>
				<td>${list.cate_num }</td>
				<td>${list.q_title }</td>
				<td>${list.q_content }</td>
				<td>${list.q_price }</td>
				<td>${list.q_date }</td>
				<td>${list.q_accept }</td>
				<td><c:if test="${list.q_star == null }">null</c:if>${list.q_star }</td>
			</tr>
			<c:set var="num" value="${num-1 }"></c:set>
		</c:forEach>
		</table>
		<c:if test="${paging.startPage>paging.blockSize}">
		[ <a href="questionList_Promembers.do?pageNum=${paging.endPage-paging.blockSize }&p_email=${proMember.p_email}">이전</a> ]
	</c:if>
		<c:forEach var="i" begin="${paging.startPage}"
			end="${paging.endPage }">
			<c:if test="${paging.currentPage == i }">
				<b> ${i } </b>
			</c:if>
			<c:if test="${paging.currentPage != i }">
			[ <a href="questionList_Promembers.do?pageNum=${i }&p_email=${proMember.p_email}">${i }</a> ]
		</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="questionList_Promembers.do?pageNum=${paging.startPage+paging.blockSize }&p_email=${proMember.p_email}">다음</a> ]
	</c:if>
	
</body>
</html>