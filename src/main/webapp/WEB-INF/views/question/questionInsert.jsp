<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script>
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>
<script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
<script src="${conPath }/js/npm.js" type="text/javascript"></script>
<script src="${conPath }/js/popper.min.js" type="text/javascript"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet" type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css" />


</head>
<body>
	<h1>유료질문방입니다</h1>
	<form action="${conPath }/questionInsert.do" method="post">
		<%-- <input type="hidden" name="f_email" value="${findermembers.f_email }"> --%>
		<input type="hidden" name="f_email" value="${findermembers_email }">
		<input type="hidden" name="p_email" value="${promembers_email }">
		<table>
			<tr>
				<th>질문자 </th>
				<td><%-- ${findermembers.f_nickname} --%>
					${findermembers.f_nickname }
				</td>
			</tr>
			<tr>
				<th>희망 답변자</th>
				<td><%-- ${promembers.p_nickname} --%>
					${findermembers.f_nickname }
				</td>
			</tr>
			<tr>
				<th>분야</th>
				<td><select name="cate_num">
						<option value="1">국어</option>
						<option value="2">영어</option>
						<option value="3">수학</option>
						<option value="4">과학</option>
						<option value="5">사회</option>
					</select></td>
			</tr>
			<tr>
				<th>질문 제목</th>
				<td><input type="text" class="form-control" name="q_title" required="required"></td>
			</tr>
			<tr>
				<th>질문 내용</th>
				<td><textarea class="form-control" name="q_content" id="q_content" rows="3" style="margin-top: 0px; margin-bottom: 0px; height: 393px;" required="required"></textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" class="form-control" name="q_price" value="100" required="required"></td>
			</tr>
			<!-- <tr>
				<th>공개여부는 관리자에서 관리하는걸로</th>
				<td>
					<div class="custom-control custom-radio">
					<input type="radio" name="q_show" id="q_show1" value="0" checked="checked" class="custom-control-input">
					<label class="custom-control-label" for="q_show1">공개</label>
					</div>
					<div class="custom-control custom-radio">
					<input type="radio" name="q_show" id="q_show2" value="1"  class="custom-control-input">
					<label class="custom-control-label" for="q_show2">비공개</label>
					</div>										
				</td>
			</tr> -->
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-primary" value="질문 작성 완료"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>