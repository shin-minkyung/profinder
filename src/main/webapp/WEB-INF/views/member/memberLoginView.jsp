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

<%-- <script src="https://ssl.google-analytics.com/ga.js"></script>
<link href="${conPath }/css/glyphicon.css" rel="stylesheet"
	type="text/css" />
<link href="${conPath }/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="${conPath }/css/memberLoginView.css" rel="stylesheet"
	type="text/css" />
<script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script>
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>
<script src="${conPath }/js/npm.js" type="text/javascript"></script> --%>
<%-- <script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
<script src="${conPath }/js/popper.min.js" type="text/javascript"></script> --%>

<script>
	
</script>
</head>
<body>

	<div class="modal-header">
		<h5 class="modal-title">Login</h5>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="padding: 40px 50px;">

		<form action="${conPath }/memberLogin.do" name="fmt" id="floginform"
			method="POST" onsubmit="return chk()">
			<div id="message"> </div>
			<div class="form-group has-success">
				<label class="form-control-label" for="inputSuccess1" >Email</label>
				<input type="email" class="form-control" name="f_email" id="f_email"
					aria-describedby="emailHelp" placeholder="Enter email">
			</div>
			<div class="form-group has-success">
				<label class="form-control-label" for="inputSuccess1">password</label>
				<input type="password" value="${f_pw }" name="f_pw"
					class="form-control" id="f_pw" placeholder="Password">
			</div>
			<br>

			<div>
				<button type="submit" class="btn btn-primary  btn-block"
					id="floginchk" name="floginchk">Login</button>

			</div>
		</form>

		<br>
	</div>
	<div class="modal-footer">
		<p>
			Forgot <a href="#">Password?</a>
		</p>
	</div>

</body>
</html>