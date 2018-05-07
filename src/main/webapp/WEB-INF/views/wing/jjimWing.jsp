<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #jjimIcon{
  position:relative;
  width:10px;
  }
  #jjim_wrap{
  position:absolute;
  left:-585px;
  }
  #jjim{
     position:fixed;
     width:100px;
  }
  #jjim_undone{
  position:fixed;
   width:100px;
  display:none;
  }
</style>
  <script type="text/javascript">
 	$(document).ready(function(){
		 var loginfinder='${findermembers.f_email}';
		 var p_email='${p_email}';
		// alert('host: '+p_email+'guest: '+loginfinder);
		   $.ajax({
				url:'${conPath}/jjimChk.do',	
				type:'get',
				datatype:'html',
				data:'f_email='+loginfinder+'&p_email='+p_email,
				success:function(data,status){
					var ifJjim = parseInt(data.trim());
					//alert('ifJjim: '+ifJjim);
					  if(ifJjim==1){
			 			$("#jjim").css("display","none");
			 			$("#jjim_undone").css("display","block");
					  }else if(ifJjim==0){
						$("#jjim_undone").css("display","none");
				 		$("#jjim").css("display","block"); 
					  }
		     		}
			 	}); 	
		  $("#jjim").click(function(){
			  $.ajax({
					url:'${conPath}/addJjim.do',	
					type:'get',
					datatype:'html',
					data:'f_email='+loginfinder+'&p_email='+p_email,
					success:function(data,status){
						//var result= parseInt(data.trim());
						//alert('result: '+result);		
						location.reload();
			     		}
				 	});	
		 	 }); 
		  $("#jjim_undone").click(function(){
			  $.ajax({
					url:'${conPath}/removeJjim.do',	
					type:'get',
					datatype:'html',
					data:'f_email='+loginfinder+'&p_email='+p_email,
					success:function(data,status){
						//var result= parseInt(data.trim());
						//alert('result: '+result);
						location.reload();
			     		}
				 	});	
		 	 }); 
 		});
		</script>	 
</head>
<body>
 <div id="jjimIcon">
   <div id="jjim_wrap">
     <div id="jjim">
     <img src="${conPath }/img/jjim.png">
     </div>
     <div id="jjim_undone">
 	 <img src="${conPath }/img/jjim_undone.png"> 	
     </div>
  </div>
 </div>

</body>
</html>