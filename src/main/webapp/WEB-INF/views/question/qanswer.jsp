<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet">
<link href="${conPath }/css/ppageContent.css" rel="stylesheet">
<style>
	body {
		background-color: #F4F4F4;
	}
	@font-face{font-family:'Nanum Gothic'; src:url('${conPath}/font/nanum_gothic_ultralight.ttf')}
	body, table, div, p {font-family:'Nanum Gothic';}
	
 	.answer{
 		font-size:1.2em;
 		text-align:left;
 	}
 	.p_nickname{
 		font-size:1.5em;
 	}
 	.star_insert{
 		float:left;
 		width:200px;
 		font-size:1.4em;
 	}
 	.star_insertBtn{
 		position:relative;
 		left:-75px;
 		width:150px;
 		height:37px;
 	}
 	.star_insert_msg{
 		float:left;
 		font-size:1.3em;
 		padding-right:50px;
 		color:navy;
 	}
 	.q_star_insert_wrap{
 		position: relative;
 		top:3px;
 	}

</style>
</head>
<body>
	<c:forEach var="qanswer" items="${qanswer }">
		<p style="text-align:left;" id="qanswer_content${qanswer.q_num }">
		<h3 style="text-align:left;">${qanswer.p_nickname}님의 답변</h3><br>
		${qanswer.qa_date }<br>
		${qanswer.qa_content} 		
		</p>		
		<%-- ${promembers.p_email eq p_email and not empty promembers} --%>
		<c:if test="${not empty promembers and getQ_star==0}">
			<ul style="float:right; vertical-align:top;">
				<li style="margin-right:15px;"><span id="update${qanswer.q_num }" style="cursor:pointer;">수정</span></li>
				<li style="margin-right:15px;"><span id="delete${qanswer.q_num }" style="cursor:pointer;">삭제</span></li>
			</ul>			
			<div style="text-align:left; display:none;" id="qanswer_update${qanswer.q_num }">
				<textarea rows="3" cols="20" class="form-control q_modify_input" id="qanswer_update_text${qanswer.q_num }" style="text-align:left;">${qanswer.qa_content }</textarea>
				<input type="button" value="수정하기" class="form-control q_modify_btn" id="qanswer_update_btn${qanswer.q_num }"> 
			</div>
		</c:if>
		
		<c:if test="${not empty findermembers and getQ_star==0}">
		<form action="${conPath }/question_qstar.do">
		<span class="star_insert_msg">답변이 도움이 되었나요? 평점을 남겨주세요</span>
			<select name="q_star" style="color:#E99B00;" class="form-control star_insert">
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select> 
			<input type="submit" value="평점주기" class="btn btn-secondary star_insertBtn">
			<input type="hidden" name="q_num" value="${qanswer.q_num }">
		</form>
		</c:if>
		<!-- 질문답변 관련  ajax-->
		<script>
			$(function(){
				var count = 1;				
				// 질문답변 수정 칸 생성
				$('#update${qanswer.q_num }').click(function(){					
					if(count==1) {
						$('#qanswer_content${qanswer.q_num }').hide('fast');
						$('#qanswer_update${qanswer.q_num}').show('fast');
						$('#update${qanswer.q_num }').html('수정중');
						count = 0;
					}else{
						$('#qanswer_content${qanswer.q_num }').show('fast');
						$('#qanswer_update${qanswer.q_num}').hide('fast');
						$('#update${qanswer.q_num }').html('수정');
						count = 1;
					}
				});			
				// 질문답변 수정
				$('#qanswer_update_btn${qanswer.q_num }').click(function(){
					var qanswer = $('#qanswer_update_text${qanswer.q_num }').val();
					$.ajax({
						url : 'qanswerModify.do',
						type : 'get',
						data : 'qa_content='+qanswer+"&q_num=${qanswer.q_num}"+'&p_email=${promembers.p_email}',
						success : function(data, status){
							alert('수정되었습니다');							
							location.reload();
						}
					});
				});				
				// 질문답변 삭제
				$('#delete${qanswer.q_num }').click(function(){
					$.ajax({
						url : 'qanswerDelete.do',
						type : 'get',
						data : 'q_num=${qanswer.q_num}'+'&p_email=${promembers.p_email}',
						success : function(data, status){
							alert('삭제되었습니다');							
							location.reload();
						}
					});
				});
			});
		</script>
	</c:forEach>
	<c:if test="${empty qanswer }">
		<textarea rows="3" cols="20" class="form-control q_input" id="qanswer_text${q_num }" style="text-align:left"></textarea>
		<input type="button" value="답변 달기" class="form-control qanswer_btn" id="qanswer_btn${q_num }">
	</c:if>	
	<!-- qanswer 입력 ajax -->
	<script>
		$(function(){
			$('#qanswer_btn${q_num }').click(
				function() {
					var qanswer_text = $('#qanswer_text${q_num }').val();
					/* alert(qanswer_text);  */
					$.ajax({
						url : 'qanswerInsert.do',
						type: 'post',
						datatype : 'html',
						data : 'q_num=${q_num}'+'&qa_content='+qanswer_text+'&p_email=${promembers.p_email}',
						success : function(data, status) {
							alert('답변입력완료');
							location.reload();
						}
					});
			});
		});
	</script>
</body>
</html>