<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<style type="text/css">
#detail_container{
  width:600px;
  background-color: #f4f4f4;
  font-size:1.3em;
}
.title{
	display:block;
	font-size:1.5em;
	padding:10px 5px;
}
.con{
	color:white;
	background-color:#2394c0;
	width:120px;
	height:120px;	
	margin:10px 30px;
	font-size:3em;
	float:left;
}
td{
	padding:10px;	
}
table{
	margin-bottom:100px;
}
</style>
<div id="detail_container">
<p><span class="title">${thecon.con_title }</span></p>
<p>${thecon.con_content }</p>
  <div class="con">
   ${thecon.con_file1!=null? fn:substringAfter(thecon.con_file1,'.'):'x'}
  </div> 
 <table>
   <tr>
     <td>분야</td>
     <td> 
       <c:forEach var="category" items="${cate }" varStatus="status">
         <c:if test="${thecon.cate_num==cate[status.index].cate_num }">
         ${cate[status.index].cate_name }
         </c:if>
       </c:forEach>       
     </td>     
   </tr> 
   <tr>
     <td>컨텐츠 번호</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_num }"></td>     
   </tr>
   <tr>
     <td>작성자</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.p_email}"></td>     
   </tr>
   <tr>
     <td>가격</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_price }"> </td>     
   </tr>
   <tr>
     <td>  첨부파일1 </td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_file1==null? '없음':thecon.con_file1}" ></td>     
   </tr>
   <tr>
     <td> 첨부파일2 </td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_file2==null? '없음':thecon.con_file2 }"></td>     
   </tr>
   <tr>
     <td> 첨부파일3</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_file3==null? '없음':thecon.con_file3 }"></td>     
   </tr>
    <tr>
     <td>업로드일  </td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_date }"></td>     
   </tr>
    <tr>
     <td>다운로드수</td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_download }"></td>     
   </tr>   
   <tr>
     <td>삭제여부  </td>
     <td><input type="text" class="form-control inline" readonly="readonly" value="${thecon.con_del==0? '삭제되지 않음':'삭제' }"></td>
   </tr>
 </table>
</div>