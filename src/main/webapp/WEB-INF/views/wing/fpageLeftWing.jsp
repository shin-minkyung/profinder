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
<link href="${conPath }/css/fpageLeftWing.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="fpageLeftWing">
		<div class="fpageLeftWing_position">
			<div class="fpageLeftWing_wrap">
				<div class="wing1">
					<img src="${conPath }/img/icon_bell.png" alt="종"/>
				</div><!-- wing1 -->
				<div class="wing2">
					<ul>
						<li>소식</li>
						<li>
							<c:if test="${1>0 }">
								<a href="#" style="background-color:#ee607a;">1</a>
							</c:if>
							<c:if test="${1<0 }">
								<a href="#">1</a>
							</c:if>
						</li>
					</ul>
					<ul>
						<li>컨텐츠</li>
						<li>
							<a href="#">0</a>
						</li>
					</ul>
					<ul>
						<li>질문</li>
						<li>
							<a href="#">0</a>
						</li>
					</ul>
					<ul>
						<li>찜요청</li>
						<li>
							<a href="#">0</a>
						</li>
					</ul>					
				</div><!-- wing2 -->
				<div class="wing3">
					<a href="#">
						모두 읽음
					</a>
				</div>
			</div><!--  fpageLeftWing_wrap-->
		</div><!-- fpageLeftWing_position -->
	</div><!-- fpageLeftWing -->
</body>
</html>