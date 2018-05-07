<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<c:if test="${finderPW != null }">
<span class="ok">회원님이 찾는 비밀번호는 ${finderPW.f_pw } 입니다</span>
</c:if>
<c:if test="${proPW != null }">
<span class="ok">회원님이 찾는 비밀번호는 ${proPW.p_pw } 입니다</span>
</c:if>
<c:if test="${finderPW == null && proPW == null }">
<span class="incorrect">일치하는 정보가 없습니다</span>
</c:if>
</body>
</html>