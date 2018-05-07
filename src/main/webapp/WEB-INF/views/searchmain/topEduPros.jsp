<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
		<c:forEach var="topPros" items="${topPro }" varStatus="status">
		<c:if test="${topPro[0].p_email!=null }">
			<div class="block inline">				
				<div class="photo" style="margin-left: 10px;">
					<img src="${conPath }/profile/${topPros.p_photo1}" width="60px";height=auto;>
				</div>
				<div style="position: absolute; top: 70px; left: 60px;">				
					<h4>${topPros.p_nickname }</h4>
				</div>
				<ul style="position: absolute; top: 100px; left: 20px;"
					class="vertical-list">
					<li>지역 ${topPros.p_area }</li>
					<li>찜 ${topPros.jjimCnt }</li>
					<li>분야
					  <c:forEach var="c" items="${cate }" varStatus="status">					  				  
					   <c:if test="${cate[status.index].cate_num==topPros.cate_num }">
					     ${cate[status.index].cate_name }
					   </c:if>
					  </c:forEach>					  
					</li>
				</ul>
				<div class="go">
				  <a href="${conPath }/ppageNewsfeedView.do?p_email=${topPros.p_email}">				  
					<img src="${conPath }/img/icon_arrow.png">
				  </a>
				</div>
			</div>
			</c:if>
			<c:if test="${topPro[0].p_nickname==null || empty topPro[0].p_email}">
			 <script type="text/javascript">
			  alert('더 이상목록이 없습니다');
			 </script>
			</c:if>						
		</c:forEach>	