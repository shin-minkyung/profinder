<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${result==1 }">
${loginfinder.f_point },
<span style="color:green;">충전 성공!</span>
</c:if>
<c:if test="${result==0 }">
  <span style="color:red;">충전 실패ㅠㅠ</span>
</c:if>