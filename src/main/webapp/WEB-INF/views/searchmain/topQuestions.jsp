<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
	<c:forEach var="topQuestions" items="${topQuestions }">
		<div class="block inline">
			<div class="photo" style="margin-left: 10px;">
				<img src="${conPath }/img/icon_question.png"
					style="width: 60px; height: auto;">
			</div>
			<div style="position: absolute; top: 70px; left: 20px;">
				<h4>
					<c:choose>
						<c:when test="${fn:length(topQuestions.q_title)>15 }">
							<c:out value="${fn:substring(topQuestions.q_title,0,14) }"></c:out>...
		            </c:when>
						<c:otherwise>
		            ${topQuestions.q_title }
		            </c:otherwise>
					</c:choose>
				</h4>
			</div>
			<ul style="position: absolute; top: 100px; left: 20px;"
				class="vertical-list">
				<li>좋아요${topQuestions.likecnt }</li>
				<li>분야
				  <c:forEach var="c" items="${cate }" varStatus="status">					  				  
					 <c:if test="${cate[status.index].cate_num==topQuestions.cate_num }">
					 	${cate[status.index].cate_name }
					  </c:if>
					 </c:forEach>	
				</li>
				<li>답변평점 ${topQuestions.q_star }</li>
			</ul>
			<div class="q_content">
				<c:choose>
					<c:when test="${fn:length(topQuestions.q_content)>26 }">
						<c:out value="${fn:substring(topQuestions.q_content,0,25)}"></c:out>......
		         </c:when>
					<c:otherwise>
		         ${topQuestions.q_content }
		         </c:otherwise>
				</c:choose>
			</div>
			<div class="go">
			  <a href="${conPath }/ppageQuestionView.do?p_email=${topQuestions.p_email}">
				<img src="${conPath }/img/icon_arrow.png">
			  </a>
			</div>
		</div>
	</c:forEach>