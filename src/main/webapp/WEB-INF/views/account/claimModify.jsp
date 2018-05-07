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
<p class="card-text">${list.cl_content }</p>
<div class="btnDiv">
	<input type="button" id="modifyViewBtn${list.cl_num }" class="btn btn-primary btn-lg btn-block width320" value="수정" style="width:120px;margin-left:470px;"/>
	<input type="button" id="deleteBtn${list.cl_num }" class="btn btn-primary btn-lg btn-block width320" value="삭제" style="width:120px;position: absolute;top:0px;right:30px;margin-top:0px;"
	onclick="location.href='${conPath}/claimDelete.do?cl_num=${list.cl_num }&pageNum=${pageNum}&cl_email=${email }'"/>
</div>
<script>
	$(function(){
		$('#modifyViewBtn${list.cl_num}').click(function(){
			$.ajax({
				url:'${conPath}/claimModifyView.do',
				type:'post',
				datatype:'html',
				data:'cl_content=${list.cl_content}&cl_num=${list.cl_num}',
				success:function(data,status){
					$('#cl_content${list.cl_num}').html(data);
				}
			});
		});
		
	})
</script>
</body>
</html>