<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>

<style>
#detail_container{
  width:600px;
  background-color: #f4f4f4;
  font-size:1.3em;
}
td{
	padding:10px;	
}
table{
	margin-bottom:30px;
	margin-left:122px;
}
</style>
<script>
	$(function(){
		$('#claimAnswerBtn').click(function(){
			$.ajax({
				url:'${conPath}/claimAnswer.do',
				type:'post',
				datatype:'html',
				data:'cl_num=${getClaim.cl_num}&cl_cate=${getClaim.cl_cate}&cl_nickname=${getClaim.cl_nickname}&cl_email=${getClaim.cl_email}&cl_title=${getClaim.cl_title}&cl_content=${getClaim.cl_content}&claimAnswer='+$("#claimAnswer").val(),
				success:function(data,status){
					$('#detail_view').html(data);
				}
			});
		});
	});
</script>
</head>
<body>
<div id="detail_container">
	<div>
		<img src="${conPath }/img/noimg.png" alt="사진" style="position: absolute;width:120px;top:49px;left:-9px;"/>
	</div>
	<table>
		<tr>
	     <td>문의 분류</td>
	     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_cate }" style="width:250px;"></td>     
	   </tr>
	  	<tr>
	     <td>문의자 이메일</td>
	     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_email }" style="width:250px;"></td>     
	   </tr>
	   <tr>
	     <td>문의 닉네임</td>
	     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_nickname }" style="width:250px;"></td>     
	   </tr>
	   <tr>
	     <td>문의 제목</td>
	     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_title }" style="width:250px;"></td>     
	   </tr>
</table>
	<div>
 		<span style="position: absolute; bottom: 410px;">문의내용</span>
		<textarea class="form-control inline" readonly="readonly" style="height:180px;width:376px;margin-left:132px;margin-bottom:50px;">${getClaim.cl_content }</textarea>
 	</div>
 	<div>
 		<span style="position: absolute; bottom: 170px;">답변내용</span>
		<textarea id="claimAnswer" class="form-control inline" placeholder="답변 내용을 입력해 주세요" style="height:180px;width:377px;margin-left:132px;margin-bottom:50px;"></textarea>
 	</div>
	<div>
		<input type="button" class="btn btn-primary" id="claimAnswerBtn" value="1:1 문의 답변보내기" style="margin-left:200px;"/>	
	</div>
</div>
</body>
</html>