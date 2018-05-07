<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
		<c:forEach var="topContents" items="${topContents }">
				<div class="block inline">
					<div class="photo" style="margin-left:10px;font-size:2em;color:white;background-color:#23bbc0;">
					${fn:substringAfter(topContents.con_file1,'.') }
					</div>
					<div style="position: absolute; top: 70px; left: 60px;">
						<h4>${topContents.con_title }</h4>
					</div>
					<ul style="position: absolute; top: 100px; left: 20px;"
						class="vertical-list">
						<li>다운로드 ${topContents.con_download }</li>
						<li>가격 ${topContents.con_price }</li>
						<li>분야
						  <c:forEach var="c" items="${cate }" varStatus="status">					  				  
					   		<c:if test="${cate[status.index].cate_num==topContents.cate_num }">
					     		${cate[status.index].cate_name }
					 	  </c:if>
					  	 </c:forEach>		
						</li>
					</ul>
					<div class="go">
					  <a href="${conPath }/ppageContentView.do?p_email=${topContents.p_email}">
						<img src="${conPath }/img/icon_arrow.png">
				      </a>
					</div>
				</div>
			</c:forEach>	