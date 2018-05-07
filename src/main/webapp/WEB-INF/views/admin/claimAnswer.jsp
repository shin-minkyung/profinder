<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#detail_container{
  width:600px;
  background-color: #f4f4f4;
  font-size:1.3em;
}
</style>
</head>

<body>
<div id="detail_container">
	<c:if test="${claimAnswer == 1 }">
		<p>1:1 문의 답변에 성공 하였습니다.</p>
		<script>
			alert('1:1문의 답변에 성공 하였습니다');
		</script>
	</c:if>
	<c:if test="${claimAnswer != 1 }">
		<p>1:1 문의 답변에 실패 하였습니다.</p>
		<p>다시 시도 해 주시기 바랍니다</p>
		<script>
			alert('1:1문의 답변에 실패 하였습니다');
		</script>
	</c:if>
</div>
</body>
</html>