<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<head>
<script type="text/javascript">
  $(document).ready(function(){
	  $(".alarm_li").click(function(){
		//  var al_receiver='${alarmList}';
		var al_receiver=$(this).children(".al_receiver").val();
		var al_refnum=$(this).children(".al_refnum").val();
		var al_checknum=$(this).children(".al_checknum").val();
		//alert(al_receiver+','+al_refnum+','+al_checknum);
		   $.ajax({
				url:'${conPath}/deleteAlarm.do',	
				type:'get',
				datatype:'html',
				data:'al_receiver='+al_receiver+'&al_refnum='+al_refnum+'&al_checknum='+al_checknum,
				success:function(data,status){					
					//location.reload();
		     	}
			});	  
	  });
  });
</script>
</head>
<html>
<c:if test="${fn:length(alarmList)!=0 }">
<c:forEach var="alarm" items="${alarmList }">
 <c:if test="${alarm.al_refnum=='ppageJjimView.do' }"> 
   <div class="alarm_li">
     <input type="hidden" class="al_receiver" value="${alarm.al_receiver }">
     <input type="hidden" class="al_refnum" value="${alarm.al_refnum }">
     <input type="hidden" class="al_checknum" value="${alarm.al_checknum }">   
     
     <div class="al_photo">
       <img src="${conPath }/profile/${alarm.f_photo1}" style="width:30px;">
     </div>
     <div class="al_notifi">
    <a href="${conPath }/${alarm.al_refnum}?p_email=${alarm.al_receiver}">
      ${alarm.f_nickname }님이 회원님을 찜했습니다</a>
<%-- ${alarm.al_checknum }<br>
${alarm.al_refnum }<br>
      --%>
      </div>
	</div>
  </c:if>
</c:forEach>
</c:if>
<c:if test="${fn:length(alarmList)==0 }">
<p>알람을 모두 확인하셨습니다</p>
</c:if>


</html>
