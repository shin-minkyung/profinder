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
<script>
$(function(){
	$(".proIcon").click(function(){
		$(".wing_pro").css("display","block");
		$(".wing_content").css("display","none");
		$(".wing_question").css("display","none");
	});
	$(".contentIcon").click(function(){
		$(".wing_pro").css("display","none");
		$(".wing_content").css("display","block");
		$(".wing_question").css("display","none");
	});
	$(".questionIcon").click(function(){
		$(".wing_pro").css("display","none");
		$(".wing_content").css("display","none");
		$(".wing_question").css("display","block");
	});
});
$(document).ready(function(){
	$("#wingProBtn").click(function(){
		var cate_num1=$("#wing_pro_cate").val();
		var area=$("#wing_pro_area").val();
		if(area==-1){
			alert('지역을 선택해주세요');			
		}else if(cate_num1==-1){
			alert('분야를 선택해주세요');
		}else{
			$('#proForm').trigger("submit");			
		}
	});
	$("#wingConBtn").click(function(){
		var cate_num2=$("#wing_con_cate").val();
		var conKeyword=$("wingConKeyword").val();
		if(cate_num2==-1){
			alert('분야를 선택해주세요');
		}else if(conKeyword==""){
			alert("컨텐츠 검색 키워드를 입력해주세요");
		}else{
			$('#conForm').trigger("submit");
		}
	});
	$("#wingQueBtn").click(function(){
		var queKeyword=$('#wingQueKeyword').val();
		if(queKeyword==""){
			alert('질문 검색 키워드를 입력해주세요');
		}else{
			$("#queForm").trigger("submit");
		}
	});
});
</script>
<link href="${conPath }/css/rightWing.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="wing">
		<div class="wing_position">
			<div class="wing_wrap">
				<div class="wing_pro">
					<div class="wing1">
						<ul>
							<li style="border-bottom:3px solid #158CBA;">
								<img class="proIcon" src="${conPath }/img/w_icon_pro.png" alt="윙프로"/>
							</li>
							<li style="width:71.78px;">
								<img class="contentIcon" src="${conPath }/img/w_icon_contents.png" alt="윙컨텐츠"/>
							</li>
							<li style="width:69.07px;border-right:none;">
								<img class="questionIcon" src="${conPath }/img/w_icon_question.png" alt="윙질문"/>
							</li>
						</ul>
					</div><!-- wing1 -->
					<div class="wing2">
						<a href="${conPath }/searchmain.do">
							<img src="${conPath }/img/button_allpro.png" alt="페이지이동"/>
						</a>
					</div><!-- wing2 -->
					<div class="wing3">
						<h2>프로검색</h2>
						<form action="${conPath}/searchProforSM.do" id="proForm">
							<select name="cate_num" id="wing_pro_cate">
							  <option value="-1">분야 선택</option>
							  <option value="1">교육</option>
							  <option value="2">비즈니스</option>
							  <option value="3">생활과학</option>
							  <option value="4">디자인</option>
							  <option value="5">개발</option>
							  <option value="6">건강/미용</option>
							  <option value="7">이벤트</option>
							  <option value="8">기타</option>						
							</select>
							<select name="p_area" id="wing_pro_area">
								<option value="-1">지역 선택</option>
								<option value="서울">서울</option>
								<option value="경기도">경기도</option>
								<option value="충청도">충청도</option>
								<option value="전라도">전라도</option>
								<option value="경상도">경상도</option>
							</select>
							<button type="button" id="wingProBtn">GO</button>
						</form>
					</div><!-- wing3 -->
				</div><!-- wing_pro -->
				<div class="wing_content">
					<div class="wing1">
						<ul>
							<li>
								<img class="proIcon" src="${conPath }/img/w_icon_pro.png" alt="윙프로"/>
							</li>
							<li style="width:71.78px;border-bottom:3px solid #158CBA;">
								<img class="contentIcon" src="${conPath }/img/w_icon_contents.png" alt="윙컨텐츠"/>
							</li>
							<li style="width:69.07px;border-right:none;">
								<img class="questionIcon" src="${conPath }/img/w_icon_question.png" alt="윙질문"/>
							</li>
						</ul>
					</div><!-- wing1 -->
					<div class="wing2">
						<a href="${conPath }/searchmain.do?key=1">
							<img src="${conPath }/img/button_allcontents.png" alt="페이지이동"/>
						</a>
					</div><!-- wing2 -->
					<div class="wing3">
						<h2>컨텐츠검색</h2>
						<form action="${conPath}/searchConforSM.do" id="conForm">
							<select name="cate_num" id="wing_con_cate">
								<option value="-1">분야선택</option>
								<option value="1">교육</option>
							  	<option value="2">비즈니스</option>
							  	<option value="3">생활과학</option>
							  	<option value="4">디자인</option>
							  	<option value="5">개발</option>
							  	<option value="6">건강/미용</option>
							  	<option value="7">이벤트</option>
							  	<option value="8">기타</option>	
							</select>
							<input type="text" name="searchWord" class="form-control" id="wingConKeyword" placeholder="제목/내용에서 검색"/>
							<button type="button" id="wingConBtn">GO</button>
						</form>
					</div><!-- wing3 -->
				</div><!-- wing_content -->
				<div class="wing_question">
					<div class="wing1">
						<ul>
							<li>
								<img class="proIcon" src="${conPath }/img/w_icon_pro.png" alt="윙프로"/>
							</li>
							<li style="width:71.78px;">
								<img class="contentIcon" src="${conPath }/img/w_icon_contents.png" alt="윙컨텐츠"/>
							</li>
							<li style="width:69.07px;border-right:none;border-bottom:3px solid #158CBA;">
								<img class="questionIcon" src="${conPath }/img/w_icon_question.png" alt="윙질문"/>
							</li>
						</ul>
					</div><!-- wing1 -->
					<div class="wing2">
						<a href="${conPath }/searchmain.do?key=2">
							<img src="${conPath }/img/button_allquestion.png" alt="페이지이동"/>
						</a>
					</div><!-- wing2 -->
					<div class="wing3">
						<h2>질문검색</h2>
						<form action="${conPath}/searchQueforSM.do" id="queForm">							
							<input type="text" class="form-control" name="searchWord" id="wingQueKeyword" placeholder="제목/내용에서 찾기"/>
							<button type="button" id="wingQueBtn">GO</button>
						</form>
					</div><!-- wing3 -->
				</div><!-- wing_question -->
			</div><!-- wing_wrap -->
		</div><!-- wing_position -->
	</div><!-- wing -->
</body>
</html>