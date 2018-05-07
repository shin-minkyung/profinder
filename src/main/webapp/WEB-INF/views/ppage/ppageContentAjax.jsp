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
</head>
<body>
<div class="main_content_border">
	<div class="card border-light mb-3">
		<div class="card-body" style="margin:0;text-align:left;">
			<img src="${conPath }/img/ex1.JPG" alt="사진" style="width:40px;height:40px;margin-bottom:15px;" />
			<h4 class="card-title" style="position:absolute;top:33px;left:72px;">${ppageContentsAjax.p_nickname}</h4>
			<h6 class="con_date" style="position:absolute;top:41px;left:125px;">${ppageContentsAjax.con_date}</h6>
			<h4 class="cate_name" style="position:absolute;top:33px;right:30px;">${ppageContentsAjax.cate_name}</h4>
			<h4 class="con_title" style="width:100%;text-align:left;padding-left:40px;">${ppageContentsAjax.con_title}</h4>
			<p class="card-text" style="width:100%;text-align:left;padding-left:40px;">${ppageContentsAjax.con_content}</p>
		</div>
		<div class="card-header" style="width:100%;border-bottom:none;border-top:1px solid #d3d3de;overflow:hidden;">
			<div class="content_good">
				<span style="color:cornflowerblue;">12</span>
				<span class="glyphicon glyphicon-thumbs-up"></span>
			</div>
			<div class="content_message">
				<span style="color:cornflowerblue;">23</span>
				<span class="glyphicon glyphicon-comment"></span>
			</div>
			<div class="content_view">
				<span style="color:cornflowerblue;">23445</span>
				<span class="glyphicon glyphicon-eye-open"></span>
			</div>											
		</div>
	</div>
</div>
</body>
</html>