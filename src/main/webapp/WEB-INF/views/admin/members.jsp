<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/admin_main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<c:if test="${ad_id!=null }">
 <jsp:include page="header.jsp"></jsp:include>
 <div id="container">
  <div id="box_wrap">
 <div class="box">
 	회원관리 페이지입니다
 </div>
  </div>
 </div>
 </c:if>
 <c:if test="${ad_id==null }">
  <script type="text/javascript">
    location.href='${conPath}/main.do';
 </script>
 </c:if>
</body>
</html>