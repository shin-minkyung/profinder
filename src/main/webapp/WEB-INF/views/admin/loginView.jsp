<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
body{
background-color: #f4f4f4;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
<div class="modal-header">
		<h5 class="modal-title">Administrator Login</h5>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="padding: 40px 50px;">
		<form action="${conPath }/adminLogin.do" name="adlogin" id="adminLoginForm"
			method="POST">
			<div id="message"> </div>
		    <table> 
		      <tr>
		        <td><label class="form-control-label" for="admin_id" >관리자 아이디</label></td>
		        <td><input type="text" class="form-control" name="admin_id" id="admin_id"
					 placeholder="Admin ID"></td>
		      </tr>
		      <tr>
		        <td><label class="form-control-label" for="admin_pw">비밀번호</label></td>
		        <td><input type="password" name="admin_pw"
					class="form-control" id="admin_pw" placeholder="Password"></td>
		      </tr>
		      <tr>
		       <td></td>
		       <td><button type="button" class="btn btn-primary  btn-block"
					id="admin_loginBtn" name="admin_loginBtn">Login</button></td>
		      </tr>
		    </table>
			
		</form>		
	</div>
	<div class="modal-footer">
		관리자 로그인입니다
	</div>
</body>
</html>