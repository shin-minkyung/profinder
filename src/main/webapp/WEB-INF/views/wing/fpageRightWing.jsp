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
<link href="${conPath }/css/fpageRightWing.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="fpageRightWing">
		<div class="fpageRightWing_position">
			<div class="fpageRightWing_wrap">
				<div class="wing1">
					<p>보유포인트</p>
					<h3>${findermembers.f_point } p</h3>
				</div>
				<div class="wing2">
					<h4>포인트</h4>
					<h4>충전하기</h4>
					<a href="${conPath }/accountPage.do?wing=1">
						<img src="${conPath }/img/icon_coin.png" alt="돈"/>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>