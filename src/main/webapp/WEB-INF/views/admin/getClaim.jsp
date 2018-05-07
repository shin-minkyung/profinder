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

<style type="text/css">
#detail_container{
  width:800px;
  background-color: #f4f4f4;
  font-size:1.3em;
}
.title{
	display:block;
	font-size:1.5em;
	padding:10px 5px;
}
.con{
	color:white;
	background-color:#2394c0;
	width:120px;
	height:120px;	
	margin:10px 30px;
	font-size:3em;
	float:left;
}
td{
	padding:10px;	
}
table{
	margin-bottom:30px;
}
</style>
<script>
	$(function(){
		$('#claimAnswerView').click(function(){
			
			$.ajax({
				url:'${conPath}/claimAnswerView.do',
				type:'post',
				datatype:'html',
				data:'cl_num=${getClaim.cl_num}',
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

  <div class="con">
   <img src="${conPath }/img/noimg.png" alt="사진" style="width:150px;"/>
  </div> 
 <table>
 	<tr>
     <td>문의 분류</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_cate }"></td>     
   </tr>
   <tr>
   	
     <td>문의 번호</td>
     <td>
     	
     	<input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_num }">
     </td>     
   </tr>
   <tr>
     <td>문의자 이메일</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_email}"></td>     
   </tr>
   <tr>
     <td>문의자 닉네임</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_nickname }"> </td>     
   </tr>
   <tr>
     <td>문의 시간</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_date}" ></td>     
   </tr>
   <tr>
     <td>처리 상태</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_status==0? '처리중':'처리완료'}"></td>     
   </tr>
   <tr>
     <td>문의 제목</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${getClaim.cl_title}"></td>     
   </tr>
 </table>
 	<div>
 		<span style="position: absolute; bottom: 170px;">문의내용</span>
 		<textarea class="form-control inline" readonly="readonly" style="height:180px;width:376px;margin-left:100px;margin-bottom:50px;">${getClaim.cl_content }</textarea>
 	</div>
	<div>
		<input type="button" class="btn btn-primary" id="claimAnswerView" value="1:1 문의 답변하기" style="margin-left:200px;"/>	
	</div>

</div>

</body>
</html>