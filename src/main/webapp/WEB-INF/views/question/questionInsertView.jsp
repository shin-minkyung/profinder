<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${conPath }/css/emp.css" rel="stylesheet" type="text/css"/>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script src="${conPath }/js/summernote-ko-KR.js"></script>
<script>
	$(document).ready(function(){
		$('#q_content').summernote({
			width:1000,
			height:600,
			minHeight:null,
			maxHeight:1048576,
			focus:true,
			lang:'ko-KR'
		});
	});
	
	
	function chk() {
		if(frm.cate_num.value == '0') {
			alert('분야를 선택해주세요.');
			return false;
		}
	}
</script>


</head>
<body>
	<h2>이 프로에게 질문하기</h2> 
	<h5>모든 질문은 xx포인트입니다. 질문을 받은 프로는 답변을 수락 떠는 거절할 수 있습니다. 답변 수락/거절 전에 질문작성자가 질문을 철회할 수 있습니다.<br>
		답변이 작성될때 포인트가 차감됩니다. 부적절한 질문 작성시 삭제되며 포인트는 차감되지 않습니다.
	</h5>
	
	
	<form action="${conPath }/questionInsert.do " method="post" name="frm" onsubmit="return chk()">
		<input type="hidden" name="f_email" value="${findermembers.f_email }">
		<input type="hidden" name="p_email" value="pro@naver.com">        
		<input type="hidden" name="q_price" value="500">
		<div>	
			<select name="cate_num">
				<option value="0">분야 선택</option>
				<option value="1">국어</option>
				<option value="2">영어</option>
				<option value="3">수학</option>
				<option value="4">과학</option>
				<option value="5">사회</option>
			</select>	
			<input type="text" class="form-control" name="q_title" required="required">
		</div>
		<div>
			<textarea class="form-control" name="q_content" id="q_content" required="required"></textarea>
		</div>
		<!-- 가격, 언니 UI에는 없음 -->
		<!-- <div>
			<input type="number" class="form-control" name="q_price" value="100" required="required">
		</div> -->
		<div>
			<input type="submit" class="btn btn-primary" value="질문하기"/>
		</div>
	</form>

	
	<%-- <form action="${conPath }/questionInsert.do" method="post">
		<input type="hidden" name="f_email" value="${findermembers.f_email }">
		<input type="hidden" name="f_email" value="${findermembers_f.email }">
		<input type="hidden" name="p_email" value="${proMember_p.email }">
		<table>
			<tr>
				<th>질문자 </th>
				<td>
					${findermembers.f_nickname }
				</td>
			</tr>
			<tr>
				<th>희망 답변자</th>
				<td>
					${findermembers.f_nickname }
				</td>
			</tr>
			<tr>
				<th>분야</th>
				<td><select name="cate_num">
						<option value="1">국어</option>
						<option value="2">영어</option>
						<option value="3">수학</option>
						<option value="4">과학</option>
						<option value="5">사회</option>
					</select></td>
			</tr>
			<tr>
				<th>질문 제목</th>
				<td><input type="text" class="form-control" name="q_title" required="required"></td>
			</tr>
			<tr>
				<th>질문 내용</th>
				<td><textarea class="form-control" name="q_content" id="q_content" required="required"></textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" class="form-control" name="q_price" value="100" required="required"></td>
			</tr>
			<!-- <tr>
				<th>공개여부는 관리자에서 관리하는걸로</th>
				<td>
					<div class="custom-control custom-radio">
					<input type="radio" name="q_show" id="q_show1" value="0" checked="checked" class="custom-control-input">
					<label class="custom-control-label" for="q_show1">공개</label>
					</div>
					<div class="custom-control custom-radio">
					<input type="radio" name="q_show" id="q_show2" value="1"  class="custom-control-input">
					<label class="custom-control-label" for="q_show2">비공개</label>
					</div>										
				</td>
			</tr> -->
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-primary" value="질문 작성 완료"/>
				</td>
			</tr>
		</table>
	</form> --%>
</body>
</html>