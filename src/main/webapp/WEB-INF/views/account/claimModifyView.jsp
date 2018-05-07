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

<textarea class="card-text form-control" id="cl_content" name="cl_content" rows="3" style="text-align:left;width:455px;height:70px;">${list.cl_content }</textarea>
<div class="btnDiv">
	<input type="button"id="modifyBtn${list.cl_num }" class="btn btn-primary btn-lg btn-block width320" value="수정완료" style="width:120px;margin-left:470px;"/>
	<input type="reset" id="resetBtn${list.cl_num }" class="btn btn-primary btn-lg btn-block width320" value="다시수정" style="width:120px;position: absolute;top:0px;right:30px;margin-top:0px;"/>
</div>
<script>
	$(function(){
		$('#resetBtn${list.cl_num}').click(function(){
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
		$('#modifyBtn${list.cl_num}').click(function(){
			$.ajax({
				url:'${conPath}/claimModify.do',
				type:'post',
				datatype:'html',
				data:'cl_content='+$("#cl_content").val()+'&cl_num=${list.cl_num}',
				success:function(data,status){
					$('#cl_content${list.cl_num}').html(data);
				}
			});
		});
	})
</script>
</body>
</html>