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
<script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet"
	type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script>
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>
<script src="${conPath }/js/npm.js" type="text/javascript"></script>
<script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
<script src="${conPath }/js/popper.min.js" type="text/javascript"></script>
<!-- <script>
	$('#myTab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	});
</script> -->
<script>
	$(document).ready(function() {
		$(' .card-header').on('click', function() {
			var content = $(this).siblings('.card-body');
			if (content.css('display') == 'none') {
				$('#accordion .card-body').slideUp();
				content.slideDown();
			} else {
				content.slideUp();
			}
		});
	});
</script>
<style>
#accordion .card-body {
	display: none;
}
</style>
</head>
<body>


	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" href="#members"
			aria-controls="all" role="tab" data-toggle="tab">회원 관련</a></li>
		<li class="nav-item"><a class="nav-link" href="#sell"
			aria-controls="members" role="tab" data-toggle="tab">판매관련</a></li>
		<li class="nav-item"><a class="nav-link" href="#buy"
			aria-controls="sell" role="tab" data-toggle="tab">구매관련</a></li>
		
	</ul>


	<div id="myTabContent" class="tab-content">

		<div role="tabpanel" class="tab-pane active" id="members">
			<c:forEach var="list" items="${faqViewResult }">
				<c:if test="${list.faq_catenum==1 }">
					<div class="card bg-light mb-3" style="max-width: 60rem;"
						id="accordion">
						<div class="card-header">
							<h2>${list.faq_title }</h2>
						</div>

						<div class="card-body">
							<p class="card-text">${list.faq_content }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>

		</div>



		<div role="tabpanel" class="tab-pane" id="sell">
			<c:forEach var="list" items="${faqViewResult }">
				<c:if test="${list.faq_catenum==2 }">
					<div class="card bg-light mb-3" style="max-width: 60rem;"
						id="accordion">
						<div class="card-header">
							<h2>${list.faq_title }</h2>
						</div>

						<div class="card-body">
							<p class="card-text">${list.faq_content }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>


		<div role="tabpanel" class="tab-pane" id="buy">
			<c:forEach var="list" items="${faqViewResult }">
				<c:if test="${list.faq_catenum==3 }">
					<div class="card bg-light mb-3" style="max-width: 60rem;"
						id="accordion">
						<div class="card-header">
							<h2>${list.faq_title }</h2>
						</div>

						<div class="card-body">
							<p class="card-text">${list.faq_content }</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

	</div>
</body>
</html>