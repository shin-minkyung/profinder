<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	.answer{
 		font-size:1.2em;
 		text-align:left;
 	}
 	.p_nickname{
 		font-size:1.5em;
 	}
 	.star_insert{
 		float:left;
 		width:200px;
 		font-size:1.4em;
 	}
 	.star_insertBtn{
 		position:relative;
 		left:-85px;
 		width:150px;
 		height:37px;
 	}
 	.star_insert_msg{
 		float:left;
 		font-size:1.3em;
 		padding-right:50px;
 		color:navy;
 	}
 	.q_star_insert_wrap{
 		position: relative;
 		top:3px;
 	}
</style>
</head>
<body>
<div class="answer">
	<span class="p_nickname">${qanswer.p_nickname }님의 답변<br></span>
	${qanswer.qa_date }<br><br>	
	${qanswer.qa_content }
</div>
<div class="q_star_insert_wrap">
<c:set var="hostfinder" value="${fn:substring(jspFile,jspFile.indexOf('=')+1,fn:length(jspFile)) }"></c:set>
	<c:if test="${hostfinder==email and getQ_star==0}">
	   <span class="star_insert_msg">답변이 도움이 되었나요? 평점을 남겨주세요</span>
		<form action="${conPath }/question_qstar.do">
			<select class="form-control star_insert" name="q_star" style="color:#E99B00;">
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select> 
			<input type="submit" class="star_insertBtn btn btn-secondary" value="평점주기">
			<input type="hidden" name="q_num" value="${qanswer.q_num }">
		</form>
		</c:if>
</div>
</body>
</html>