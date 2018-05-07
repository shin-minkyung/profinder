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
<title>Insert title here</title>
<link href="${conPath }/css/admin_nonmain.css" rel="stylesheet" type="text/css"/>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".data_li").click(function(){
		$("div#list_container div").removeClass('activated');
		$(this).addClass('activated');
		var id= $(this).children(".id").val();
		$.ajax({
			url:'${conPath}/getContents.do',	
			type:'get',
			datatype:'html',
			data:'con_num='+id,
			success:function(data,status){
				$('#detail_view').html(data);
			}
		});		
	});
	$("#searchBtn").click(function(){
		var cate_num= $("#cate_selectbox").val();
		var searchWord =$("#searchTxtInput").val();
		//alert(cate_num+','+searchWord);
		if(cate_num==-1){
			alert('분야를 선택하세요');
		}else{
			location.href='${conPath}/searchContents.do?cate_num='+cate_num+'&searchWord='+searchWord;
		}
		
	});
	
});
</script>
</head>
<body>
<c:if test="${ad_id!=null }">
 <jsp:include page="header.jsp"></jsp:include>
 <div id="container">
   <div id="wrap">
 	<span class="big">전체 컨텐츠 보기</span>
 	<div class="row">
 	  <div class="col-lg-3"> 
 	    <select id="cate_selectbox" class="form-control inline" style="width:120px;">
 	        <option value="-1">분야선택</option>
 	      <c:forEach var="a" items="${cate }">
 	        <option value="${a.cate_num }">${a.cate_name }</option>
 	      </c:forEach> 	          
 	    </select>
 	  </div>
 	  <div class="col-lg-5">
 	   <input type="text" id="searchTxtInput" placeholder="제목/내용 검색" style="width:220px;" class="form-control inline">
 	  </div>
 	  <div class="col-lg-3">
 	    <button type="button" id="searchBtn" class="btn btn-primary" style="width:100px;">찾기</button>
 	  </div>
 	  <div class="col-lg-1">
 	  </div>
 	</div><!-- row -->
 	<div class="row">
	  <div class="col-lg-12" id="list_container">
	   	<span class="sub_caption">전체목록   - 최신순</span>	   
	    <c:forEach var="allcon" items="${allCon }">
	    <div class="data_li">	
	    <input type="hidden" class="id" value="${allcon.con_num }">
	     <div class="img">
	       ${allcon.con_file1!=null? fn:substringAfter(allcon.con_file1,'.'):'x'}
	     </div>    
	     <ul>   	    
 	     <li style="color:#2394c0">
 	     <c:forEach var="category" items="${cate }" varStatus="status">
 	       <c:if test="${cate[status.index].cate_num==allcon.cate_num }">
 	         ${cate[status.index].cate_name }
 	       </c:if>
 	     </c:forEach> 	          
 	     </li> 	     
 	     <li style="font-size:1.3em;">
 	     <c:choose>
 	       <c:when test="${fn:length(allcon.con_title)>25 }">
 	         <c:out value="${fn:substring(allcon.con_title,0,24) }"></c:out>...
 	       </c:when> 
 	       <c:otherwise>
 	         ${allcon.con_title }
 	       </c:otherwise>
 	      </c:choose>
 	     </li>
 	     <li>등록일 ${allcon.con_date }</li>
 	     </ul>
 	     </div>	     
	   </c:forEach> 
  <div class="paging">
	<ul class="pagination pagination-lg">
	 <c:if test="${paging.startPage>paging.blockSize }">	  
		<li class="page-item">
		 <a class="page-link" href="${conPath }/adminContents.do?pageNum=${paging.startPage-1}">&laquo;</a>
		</li>
	 </c:if>
	 <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<c:if test="${paging.currentPage == i }">
			<li class="page-item active"> 
			  <a class="page-link"><b>${i }</b></a> 
			</li>
		</c:if>
		<c:if test="${paging.currentPage != i }">
			<li class="page-item"><a class="page-link" href="${conPath }/adminContents.do?pageNum=${i}">${i }</a></li>
		</c:if>
	 </c:forEach>
	 <c:if test="${paging.endPage<paging.pageCnt }">
		<li class="page-item">
		 <a class="page-link" href="${conPath }/adminContents.do?pageNum=${paging.endPage+1}">&raquo;</a>
		</li>
	 </c:if>
	</ul>
   </div>
	  </div> 	
 	</div> 	   
   </div><!-- row -->
 </div>
 <div id="detail_view"> 
   <p style="font-size:3em; color:#2394c0;">
      원하는 컨텐츠를<br> 클릭하면 자세하게<br> 볼 수 있습니다</p>
 </div>
 </c:if>
 <c:if test="${ad_id==null }">
 <script type="text/javascript">
    location.href='${conPath}/main.do';
 </script>
 </c:if>
</body>
</html>