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
<script>
$(function(){
	$(".bannerNewsfeed").click(function(){
		$.ajax({
			url:'${conPath}/newsfeedMainBanner.do',
			type:'post',
			datatype:'html',
			success:function(data,status){
				$('.main2').html(data);
			}
		});
	});
	$(".bannerPromembers").click(function(){
		$.ajax({
			url:'${conPath}/promembersMainBanner.do',
			type:'post',
			datatype:'html',
			success:function(data,status){
				$('.main2').html(data);
			}
		});
	});
	$(".bannerQuestion").click(function(){
		$.ajax({
			url:'${conPath}/questionMainBanner.do',
			type:'post',
			datatype:'html',
			success:function(data,status){
				$('.main2').html(data);
			}
		});
	});
});
$(function(){
	var bannerStartCount = 1;
	var bannerEndCount = 4;
	$('.conNextAjaxBtn').click(function(){
		bannerStartCount += 3;
		bannerEndCount += 3;
		$.ajax({
			url:'${conPath}/contentsMainBannerAjax.do',
			type:'post',
			datatype:'html',
			data:'startRow='+bannerStartCount+'&endRow='+bannerEndCount,
			success:function(data,status){
				$('.main2-2').html(data);
			}
		});
	});
	$('.conBeforeAjaxBtn').click(function(){
		bannerStartCount -= 3;
		bannerEndCount -= 3;
		if(bannerStartCount<0){
			bannerStartCount = 1;
			bannerEndCount = 4;
			$.ajax({
				url:'${conPath}/contentsMainBanner.do',
				type:'post',
				datatype:'html',
				success:function(data,status){
					$('.main2').html(data);
				}
			});
			
		}else{
			$.ajax({
				url:'${conPath}/contentsMainBannerAjax.do',
				type:'post',
				datatype:'html',
				data:'startRow='+bannerStartCount+'&endRow='+bannerEndCount,
				success:function(data,status){
					$('.main2-2').html(data);
				}
			});
		}
	});
});
</script>
</head>
<body>
<div class="main2-1">
	<ul>
		<li class="bannerNewsfeed">
			<span>인기소식</span>
		</li>
		<li class="bannerPromembers">
			<span>인기PRO</span>
		</li>
		<li class="bannerContents" style="background-color:#158CBA;">
			<span style="background-color:white;border-left:1px solid #d3d3de;">인기컨텐츠</span>
		</li>
		<li class="bannerQuestion">
			<span>인기질문</span>
		</li>
	</ul>
</div><!-- main2-1 -->
<div class="main2-2">
	<span>전체컨텐츠</span>
	<c:set var="i" value="2"/>
		<c:forEach var="contents" items="${contentsMainBanner }">
			<ul class="main2-2-ul${i }">
				<li class="main2-2-ul${i }-li1">
					<a href="${conPath }/ppageContentView.do?p_email=${contents.p_email}">
						${contents.con_title}
					</a>
				</li>
				<li class="main2-2-ul${i }-li2">${contents.p_nickname}</li>
				<li class="main2-2-ul${i }-li3">좋아요 ${contents.cnt}</li>
			</ul>
		<c:set var="i" value="${i+1 }"/>
	</c:forEach>
</div><!-- main2-2 -->
<div class="main2-3">
	<input type="button" id="btn_before_news_ajax" class="conBeforeAjaxBtn">
	<div id="btn_before_triangle" class="conBeforeAjaxBtn"></div>
	<input type="button" id="btn_next_news_ajax" class="conNextAjaxBtn">
	<div id="btn_next_triangle" class="conNextAjaxBtn"></div>
</div><!-- main2-3 -->
</body>
</html>