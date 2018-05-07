<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="${conPath }/css/admin_header.css" rel="stylesheet" type="text/css"/>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${conPath }/js/bootstrap.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${conPath }/js/bootstrap.min1.js" type="text/javascript"></script>
<script src="${conPath }/js/custom.js" type="text/javascript"></script>
<script src="${conPath }/js/ga.js" type="text/javascript"></script>
<script src="${conPath }/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
 <div id="icon_bar" class="inline">
    <ul> 
      <li id="empty"></li>    
      <li ${page=='members'? 'class="active_icon"':''}>
        <img src="${conPath }/img/icon_members.png">
      </li>
      <li ${page=='newsfeed'? 'class="active_icon"':''}>
        	<img src="${conPath }/img/icon_newsfeed.png">
      </li>
      <li ${page=='contents'? 'class="active_icon"':''}>
        <a href="${conPath }/adminContents.do">
        <img src="${conPath }/img/icon_contents.png">
        </a>
      </li>
      <li ${page=='Question' ? 'class="active_icon"':'' }>
         	<img src="${conPath }/img/icon_questions.png">
      </li>
      <li ${page=='review' ? 'class="active_icon"':'' }>
          	<img src="${conPath }/img/icon_review.png">
      </li>
      <li ${page=='freeboard' ? 'class="active_icon"':'' }>
         	<img src="${conPath }/img/icon_freeboard.png">
      </li>
      <li ${page=='claim' ? 'class="active_icon"':'' }>
      	 <a href="${conPath }/adminClaim.do">
         	<img src="${conPath }/img/icon_claims.png">
         </a>
      </li>
    </ul>
  </div>
  <div id="submenu" class="inline">
    <ul>
     <li id="logo">  
     <a href="${conPath }/adminMain.do">   
       <img src="${conPath }/img/admin_logo.png">
     </a>
     </li>
     <c:forEach var="list" items="${menu }">
     <li ${list.submenu==1? 'class="submenu_li"':'' }>
     <a href="${conPath }/${list.menu_url }">${list.menu_name }</a>
     </li>       
     </c:forEach>
    </ul>    
    
    <div id="login">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#session">세션보기</button>
     <p>관리자 ${ad_name }님<br> 환영합니다</p>
      <p>로그아웃 
        <a href="${conPath }/adminLogout.do">
       <img src="${conPath }/img/icon_admin_logout.png" style="width:40px;">       
       </a>
     </p>    
    </div>
     <!-- sessionView -->
	<div class="modal" id="session">
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
    
  </div>
</body>
</html>