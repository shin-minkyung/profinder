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
	<table>
		<caption>1:1문의 임시보기</caption>
		<tr>
			<th>문의자</th>
			<th>답변받을이메일</th>
			<th>문의등록시간</th>
			<th>문의분류</th>
			<th>처리상태</th>
		</tr>
		<c:forEach var="list" items="${claimList }">
			<tr>
				<td class="td${list.cl_num }">${list.cl_nickname }</td>
				<td class="td${list.cl_num }">${list.cl_email }</td>
				<td class="td${list.cl_num }">${list.cl_date }</td>
				<td class="td${list.cl_num }">${list.cl_cate }</td>
				<td class="td${list.cl_num }">
					<c:if test="${list.cl_status==0 }">
						처리중
					</c:if>
					<c:if test="${list.cl_status==1 }">
						처리완료
					</c:if>
				</td>
			</tr>
			<tr id="content${list.cl_num }" style="display:none;">
				<td colspan="5">
					${list.cl_content }
				</td>
			</tr>
			<script>
				$(function(){
					var count${list.cl_num} = 1;
					$('.td${list.cl_num}').click(function(){
						if(count${list.cl_num} == 1){
							$('#content${list.cl_num}').css("display","table-row");
							count${list.cl_num} = 0;
						}else{
							$('#content${list.cl_num}').css("display","none");
							count${list.cl_num} = 1;
						}
					});
				});
			</script>
		</c:forEach>
		<tr>
			<td colspan="5">
				<input type="button" value="1:1문의하기"
				onclick="location.href='${conPath}/claimInsertView.do'"/>
				<input type="button" value="메인가기"
				onclick="location.href='${conPath}/main.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>