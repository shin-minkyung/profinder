<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/admin_main.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<c:if test="${ad_id!=null }">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="container">
			<div id="box_wrap">
				<div class="colorbox deepblue">처리<br>대기<br>문의</div>
				<div class="panel_lg"></div>
				<div class="colorbox deepgreen wide">거래량<br> 통계</div>				
				<div class="panel_lg"></div>
				<div class="colorbox navy wide">처리대기신고</div>
				<div class="panel_sm"></div>
				<div class="panel_sm"></div>
				<div class="panel_lg"></div>
				<div class="colorbox mint wide">관리자<br>모드<br>안내</div>
				<div class="panel_sm">
				  <ul>
				    <li>세션에 'ad_id'값 없으면 main.do로 돌아갑니다</li>
				    <li>아이콘을 누르면 나오는 하위메뉴와 그 링크주소는 AdminController에서 입력합니다</li>
				    <li>아이콘마다 다른 do를 실행합니다</li>
				    <li>분야목록은 DB에서 받아옵니다.</li>
				  </ul>
				</div>
				<div class="panel_sm"></div>
			</div>
		</div>
	</c:if>
	<c:if test="${ad_id==null }">
		<script type="text/javascript">
			location.href = '${conPath}/main.do';
		</script>
	</c:if>

</body>
</html>