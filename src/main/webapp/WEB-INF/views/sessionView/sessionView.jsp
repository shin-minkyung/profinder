<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Enumeration <String> sessionList= session.getAttributeNames();
	int count=0;
	while(sessionList.hasMoreElements()){
		count++;
		String sName=sessionList.nextElement();//이름하나 받음
		String sValue=session.getAttribute(sName).toString(); ///혹은 (String) 카스트
		out.println(sName+"(세션명): "+sValue+"(세션값)<br>");		
	}
	if(count==0){
		out.println("추가된 세션값이 없습니다.<br>");		
	}
%>	
</body>
</html>