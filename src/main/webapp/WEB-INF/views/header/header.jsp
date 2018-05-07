<%@page import="java.util.Enumeration"%>
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
<link href="${conPath }/css/header.css" rel="stylesheet" type="text/css"/>

<%-- <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ssl.google-analytics.com/ga.js"></script> 
--%>
<%-- <script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>

<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>

<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script> --%>
<%--
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>

<script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
<script src="${conPath }/js/popper.min.js" type="text/javascript"></script>--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  $.noConflict();
  var J = jQuery;


  //jQuery를 사용합니다.

  J(document).ready(function(){
     J('h1').removeClass('high_light')

 });
  $(document).ready(function(){
		$("#admin_loginBtn").click(function(){
			var id = $("#ad_id").val();
			var pw = $("#ad_pw").val();
			$.ajax({
				url:'${conPath}/adminChk.do',
				type:'post',
				datatype:'html',
				data:'ad_id='+id+'&ad_pw='+pw,  			
				success:function(data, status){
					var trimdata = data.trim();
					var result= parseInt(data.trim());
					var msg = trimdata.substring(trimdata.indexOf(',')+1, trimdata.length);				
					if(result==-1 || result ==0){
						$("#message").html(msg);
					}else if(result==1){
						$("form[name='adlogin']").trigger('submit');
					}
				}  				
			});
		});
		$('#member_loginBtn').click(function(){
			var memberID = $('#memberid').val();
			var memberPW = $('#memberpw').val();
			$.ajax({
				url : 'memberLoginChk.do',
				type : 'post',
				data : 'f_email='+memberID+'&p_email='+memberID+'&f_pw='+memberPW+'&p_pw='+memberPW,
				success : function(data, status){
					var trimdata = data.trim();
					var result = parseInt(data.trim());
					var msg = trimdata.substring(trimdata.indexOf(',')+1, trimdata.length);
					if(result == -1 || result == 0){
						$('#memberMsg').html(msg);
					}else if(result == 1){
						$("form[name='memberLogin']").trigger('submit');
					}
				}
			});
		});
		$('#searchID').click(function(){
			window.open("${conPath}/searchMemberView.do","","width=500,height=550,left=600,top=150");
		});
		
		$("#alarm").click(function(){
			$("#notification").toggle();
			var promember = '${promembers.p_email}';
			var findermember ='${findermembers.f_email}';
			if(promember.length!=0){
				//alert('promembers'+promember);
				 $.ajax({
						url:'${conPath}/getAlarmList.do',	
						type:'get',
						datatype:'html',
						data:'al_receiver='+promember,
						success:function(data,status){
							//var result= parseInt(data.trim());
							//alert('result: '+result);		
							//location.reload();
							$("#notification").html(data);
				     		}
					 	});
				
			}else if(findermember.length!=0){
				 $.ajax({
						url:'${conPath}/getAlarmList.do',	
						type:'get',
						datatype:'html',
						data:'al_receiver='+findermember,
						success:function(data,status){
							//var result= parseInt(data.trim());
							//alert('result: '+result);		
							//location.reload();
							$("#notification").html(data);
				     		}
					 	});
			}		
			
			/* $.ajax({
				url:'${conPath}/getAlarmList.do',	
				type:'get',
				datatype:'html',
				data:'p_email='+loginfinder+'&p_email='+p_email,
				success:function(data,status){
					//var result= parseInt(data.trim());
					//alert('result: '+result);		
					location.reload();
		     		}
			 	}); */
		});
		$(".al_notifi").click(function(){
			 	
		});		
	});
  
  setInterval(function() {
	  var loginpro= '${promembers.p_email}';
	  var loginfinder ='${findermembers.f_email}';
	  //alert(loginpro+','+loginfinder);
	  var al_receiver;
	  if(loginpro!=null){
		  al_receiver=loginpro;
	  }else{
		  al_receiver=loginfinder;
	  }
	 // alert('al_receiver: '+al_receiver);
	  $.ajax({
			url:'${conPath}/getAlarmCnt.do',
			type:'get',
			datatype:'html',
			data:'al_receiver='+al_receiver, 			
			success:function(data, status){
				var cnt = data.trim();				
				if(cnt==0){
					$(".alarm_noti").html(cnt);					
				}else if(cnt>0){
					$(".alarm_noti").html(cnt);
					$(".alarm_noti").removeClass("inacti");
					$(".alarm_noti").addClass("acti");
				}
			}  				
		}); 
	}, 100);
  </script>
</head>
<body>
<!--  admin login -->
<div id="admin_login">
<button type="button" data-toggle="modal" data-target="#admin_modal" id="hiddenBtn">
관리자로그인
</button>
<div class="modal" id="admin_modal" style="background-color:rgba(0, 0, 0, 0.8 );">
	 <div class="modal-dialog" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
		<h5 class="modal-title">Administrator Login</h5>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="padding: 40px 50px;">
		<form action="${conPath }/adminLogin.do" name="adlogin" id="adminLoginForm" method="post">
			<div id="message"></div>
		    <table> 
		      <tr>
		        <td><label class="form-control-label" for="admin_id" >관리자 아이디</label></td>
		        <td><input type="text" class="form-control" name="ad_id" id="ad_id"
					 placeholder="Admin ID"></td>
		      </tr>
		      <tr>
		        <td><label class="form-control-label" for="admin_pw">비밀번호</label></td>
		        <td><input type="password" name="ad_pw" class="form-control" id="ad_pw" placeholder="Password"></td>
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
		 </div>
	 </div>
</div>
</div><!-- admin login ends -->
<div id="header">
	<div class="header_position">
		<div class="header_wrap">
			<div class="header1">
				<a href="${conPath }/main.do">
					<img src="${conPath }/img/logo_header.png" alt="로고"/>
				</a>
			</div><!-- header1 -->
			<div class="header2">
				<%-- <input type="text" class="form-control" size="15" name="search" id="header_search" style="position:absolute;top:10px;width:270px;"/>
				<input type="button" class="btn btn-secondary" value="검색" id="header_btn" style="position:absolute; top:10px;left:260px;"
				onclick="location.href='${conPath}/main.do'"/> --%>
			</div><!-- header2 -->
			<div class="header3">
				<c:if test="${not empty promembers or not empty findermembers }">
					<ul>
						<li style="display:inline-block;width:170px;text-decoration:none;margin-right:0px;">
							<c:if test="${not empty promembers and empty findermembers}">
							  <a href="${conPath }/ppageNewsfeedView.do?p_email=${email}">
							  	<img class="user_img" src="${conPath }/profile/${promembers.p_photo1}" alt="유저"/> 
							  </a>
							</c:if>
							<c:if test="${not empty findermembers}">
							  <a href="${conPath }/fpageNewsfeedView.do?f_email=${email}">
							  	<img class="user_img" src="${conPath }/profile/${findermembers.f_photo1}" alt="유저"/> 
							  </a>
							</c:if>
							<span style="position:relative; line-height:45px;">${nickname}</span>
						</li>
						<li>
						   <img id ="alarm" src="${conPath }/img/alarm_bell.png" style="width:35px; position:relative; top:7px;">
						   <div class="alarm_noti inacti">0</div>
						   <div id="notification"></div>
						</li>
							
						<li>
							<a href="${conPath }/fboardList.do">
								<img class="board_img" src="${conPath }/img/icon_freeboard_header.png" alt="게시판"/> 
							</a>
						</li>
						<li>
							<%-- <a href="${conPath }/fpageNewsfeedView.do?f_email=${email}">파인더페이지</a> --%>
								<a href="${conPath }/accountPage.do?cl_email=${email}">
								<img class="modify_img" src="${conPath }/img/icon_account_header.png" alt="정보수정"/> 
							</a>
						</li>
						<li>
							<a href="${conPath }/memberLogout.do">
								<img class="logout_img" src="${conPath }/img/icon_logout_header.png" alt="로그아웃"/> 
							</a>
						</li>
						<!-- <li>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#session">세션보기</button>
						</li>  -->
					</ul>
				</c:if>
				<c:if test="${empty promembers and empty findermembers }">
					<ul>	
					    <!-- temp part -->
						<%-- <li><a href="${conPath }/accountPage.do">계정관리</a></li>	 --%>					
						<li>
							<a href="${conPath }/joinView.do"  data-toggle="modal" data-target="#myModal">
								<img class="join_img" src="${conPath }/img/icon_join.png" alt="회원가입"/>
							</a>
						</li>   
						<li>
							<a href="${conPath }/fboardList.do">
								<img class="board_img" src="${conPath }/img/icon_freeboard_header.png" alt="게시판"/> 
							</a>
						</li>
						<li>							
							<a 	data-toggle="modal" data-target="#memberLogin"> <img
								class="login_img" src="${conPath }/img/icon_login_header.png"
								alt="로그인" />
							</a>								
						</li>
						<!-- <li>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#session">세션보기</button>
						</li>  -->
					</ul>
				</c:if>
			</div>
		</div><!-- header_wrap -->
	</div><!-- header_position -->
</div><!-- header -->
 <!-- sessionView -->
	<div class="modal" id="session" style="background-color:rgba(0, 0, 0, 0.8 );">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">세션보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
				 <jsp:include page="../sessionView/sessionView.jsp"></jsp:include>					
				</div>
				<div class="modal-footer">		
				</div>
			</div>
		</div>
	</div>
<!-- 회원가입 모달 슬라이드 DIV -->
   <div class="modal fade" id="myModal" role="dialog">
       <div class="modal-dialog">
          <div class="modal-content" style="left: -80px; top: 208px;"> 
          </div>
       </div>
    </div>

<!-- 로그인 모달 DIV -->
<div class="modal" id="memberLogin" style="background-color:rgba(0, 0, 0, 0.8 );">
	 <div class="modal-dialog" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
		<h5 class="modal-title">Member Login</h5>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="padding: 40px 50px;">
		<form action="${conPath }/memberLogin.do" name="memberLogin" id="memberLoginForm" method="post">
			<div id="memberMsg"> </div>
		    <table> 
		      <tr>
		        <td><label class="form-control-label" for="memberid" >아이디</label></td>
		        <td><input type="text" class="form-control" name="memberid" id="memberid"
					 placeholder="ID"></td>
		      </tr>
		      <tr>
		        <td><label class="form-control-label" for="memberPw">비밀번호</label></td>
		        <td><input type="password" name="memberpw"
					class="form-control" id="memberpw" placeholder="Password"></td>
		      </tr>
		      <tr>
		       <td></td>
		       <td><button type="button" class="btn btn-primary  btn-block"
					id="member_loginBtn" name="member_loginBtn">Login</button></td>
		      </tr>
		    </table>
			
		</form>		
	</div>
	<div class="modal-footer">
		<span id="searchID" style="cursor: pointer;">아이디/비번찾기</span>
	</div>				
		 </div>
	 </div>
</div>

 
</body>
</html>