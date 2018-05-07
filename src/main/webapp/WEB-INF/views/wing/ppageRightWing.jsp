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
<link href="${conPath }/css/ppageRightWing.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	$(document).ready(function(){
		var p_email='${promembers.p_email}';
		 $.ajax({
				url:'${conPath}/getVisitCnt.do',	
				type:'get',
				datatype:'html',
				data:'p_email='+p_email,
				success:function(data,status){
					 var trimdata = data.trim();
					 var todayCnt = trimdata.substring(0,trimdata.indexOf(','));
					 var totalCnt = trimdata.substring(trimdata.indexOf(',')+1,trimdata.length);
					$("#todayVisitCnt").html(todayCnt);
					$("#totalVisitCnt").html(totalCnt);
		     		}
			 	}); 	
	});
</script>
</head>
<body>
	<div id="ppageRightWing">
		<div class="ppageRightWing_position">
			<div class="ppageRightWing_wrap">
				<div class="wing1">
					<p>보유 포인트</p>
					<h3>${promembers.p_point }</h3>
				</div>
				<div class="wing2">
					<p>오늘 방문자</p>
					<div id="todayVisitCnt"></div>
				</div>	
				<div class="wing3">
					<p>총 방문자</p>
					<div id="totalVisitCnt"></div>
				</div>		
			</div>
		</div>
	</div>
</body>
</html>